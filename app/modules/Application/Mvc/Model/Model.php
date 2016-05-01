<?php

/**
 * Model
 * @copyright Copyright (c) 2011 - 2014 Aleksandr Torosh (http://wezoom.com.ua)
 * @author Aleksandr Torosh <webtorua@gmail.com>
 */
namespace Application\Mvc\Model;

use Cms\Model\Language;

class Model extends \Phalcon\Mvc\Model
{
    const CACHE_LIFETIME = 300;

    protected $translations_array = []; // Translation array

    public $translations = [];
    public $fields = [];

    public static $lang = 'en'; // Language default
    public static $custom_lang = ''; // Used to create a sitemap
    private static $translateCache = true; // Translation cache usage flag

    /**
     * Translate. In order to implement a multilingual scheme, you need to copy your model of the following methods:
     * Start Copy:
     */
    protected $translateModel; // translate // Название связанного класса с переводами, например = 'Page\Model\Translate\PageTranslate'


    public function initialize()
    {
        $this->hasMany("id", $this->translateModel, "foreign_id"); // translate
    }
    //End Copy

    /**
     * This method is invoked after removal of all the fields in the Model
     */
    public function afterFetch()
    {
        if ($this->translateModel && defined('LANG')) {
            // If there is an array of translation and is set constant active language or other language
            if(self::$custom_lang){
                self::setLang(self::$custom_lang);
            } else {
                self::setLang(LANG); // Set the current language
            }

            $this->initTranslationsArray(); // Extract translated from the associated translation table
            $this->initTranslations();
        }
    }

    /**
     * Cleansing translation cache
     * The method is called after updating values in the model
     */
    public function afterUpdate()
    {
        $this->deleteTranslateCache();
    }

    /**
     * Setting the language
     */
    public static function setLang($lang)
    {
        self::$lang = $lang;
    }

    /**
     * Installing another language sitemap
     */
    public static function setCustomLang($lang)
    {
        self::$custom_lang = $lang;
    }

    /**
     * Установка флага использования кеша.
     * Нужно устанавливать до вызова других методов модели.
     * Пример:
     *
     * ModelName::setTranslateCache(false); // Устанавливаем флаг. Отключение кеша необходимо при работе с моделями в админке
     * $entries = ModelName::find(); // Извлекаем данные
     */
    public static function setTranslateCache($value)
    {
        self::$translateCache = (bool) $value;
    }

    /**
     * Extracting money transfers on behalf of a variable
     */
    public function getMLVariable($key)
    {
        $r = [];
        if (array_key_exists($key, $this->translations)) {
            $r = $this->translations[$key];
        }

        if(!$r){
            $defaultLang = Language::findFirstByPrimary(1);
            $this->initTranslationsArray($defaultLang->getIso());
            $this->initTranslations();
            if (array_key_exists($key, $this->translations)) {
                $r = $this->translations[$key];
            } else {
                $r = false;
            }
        }
        return $r;
    }

    public function setMLVariable($key, $value, $lang = null)
    {
        if (!$this->getId()) {
            return false;
        }
        $model = new $this->translateModel();
        if (!$lang) {
            $lang = self::$lang;
        }
        $conditions = "foreign_id = :foreign_id: AND lang = :lang: AND key = :key:";
        $parameters = [
            'foreign_id' => $this->getId(),
            'lang'       => $lang,
            'key'        => $key
        ];
        $entity = $model->findFirst([
            $conditions,
            'bind' => $parameters]);
        if (!$entity) {
            $entity = new $this->translateModel();
            $entity->setForeignId($this->getId());
            $entity->setLang($lang);
            $entity->setKey($key);
        }
        $entity->setValue($value);
        $entity->save();
    }

    public function translateCacheKey($lang=null)
    {
        if(!$lang){
            $lang = self::$lang;
        }
        if (!$this->getId()) {
            return false;
        }
        $query = 'foreign_id = ' . $this->getId() . ' AND lang = "' . $lang . '"';
        $key = HOST_HASH . md5($this->getSource() . '_translate ' . $query);
        return $key;
    }

    public function deleteTranslateCache()
    {
        if (!$this->getId()) {
            return false;
        }
        $cache = $this->getDi()->get('cache');
        $cache->delete($this->translateCacheKey());
    }

    /**
     * Removing the transfer array
     */
    private function initTranslationsArray($lang=null)
    {
        if(!$lang){
            $lang = self::$lang;
        }

        if (!$this->getId()) {
            return false;
        }
        $model = new $this->translateModel();
        $query = 'foreign_id = ' . $this->getId() . ' AND lang = "' . $lang . '"';
        $params = ['conditions' => $query];

        if (self::$translateCache) {
            $cache = $this->getDi()->get('cache');
            $data = $cache->get($this->translateCacheKey($lang));
            if (!$data) {
                $data = $model->find($params);
                if ($data) {
                    $cache->save($this->translateCacheKey($lang), $data, self::CACHE_LIFETIME);
                }
            }
        } else {
            $data = $model->find($params);
        }

        $this->translations_array = $data;
    }

    public function initTranslations()
    {
        if (!empty($this->translations_array)) {
            foreach ($this->translations_array as $translation) {
                $this->translations[$translation->getKey()] = $translation->getValue();
            }
        }
    }

    public function getImgFolder($attr=null){
        if($attr){
            return $this->getSource(). '_'.$attr;
        }
        return $this->getSource();
    }

}
