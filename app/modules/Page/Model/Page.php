<?php

namespace Page\Model;

use Application\Mvc\Model\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Validator\PresenceOf;
use Application\Localization\Transliterator;

class Page extends Model
{

    public function getSource()
    {
        return "page";
    }

    protected $translateModel = 'Page\Model\Translate\PageTranslate'; // translate

    private $id;
    private $slug; // translate
    private $title; // translate
    private $cover_photo; // translate
    private $thumbnail_photo; // translate
    private $text; // translate
    private $meta_title; // translate
    private $meta_description; // translate
    private $meta_keywords; // translate
    private $created_at;
    private $updated_at;

    public function initialize()
    {
        $this->hasMany('id', $this->translateModel, 'foreign_id', ['alias'=>'translates']); // translate
    }

    public function beforeCreate()
    {
        $this->created_at = date("Y-m-d H:i:s");
    }

    public function beforeUpdate()
    {
        $this->updated_at = date("Y-m-d H:i:s");
    }

    public function updateFields($data)
    {
        if (!$this->getMeta_title()) {
            $this->setMeta_title($data['title']);
        }
    }

    public function validation()
    {
        $this->validate(new Uniqueness(
            array(
                "field" => "slug",
                "message" => "Page with slug is already exists"
            )
        ));

        return $this->validationHasFailed() != true;
    }

    public static function findCachedBySlug($slug)
    {
        $pt = \Page\Model\Translate\PageTranslate::findFirst([
            'conditions' =>'key="slug" AND value= ?0 AND lang=?1',
            'bind' => [0 => $slug, 1=>LANG]
        ]);

        $query = "id = '$pt->foreign_id'";
        $key = HOST_HASH . md5("Page::findFirst($query)");
        $page = self::findFirst(array($query, 'cache' => array('key' => $key, 'lifetime' => 60)));
        return $page;
    }

    /**
     * @param mixed $created_at
     */
    public function setCreatedAt($created_at)
    {
        $this->created_at = $created_at;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->created_at;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $meta_description
     */
    public function setMeta_description($meta_description)
    {
        $this->setMLVariable('meta_description', $meta_description);
    }

    /**
     * @return mixed
     */
    public function getMeta_description()
    {
        return $this->getMLVariable('meta_description');
    }

    /**
     * @param mixed $meta_keywords
     */
    public function setMeta_keywords($meta_keywords)
    {
        $this->setMLVariable('meta_keywords', $meta_keywords);
    }

    /**
     * @return mixed
     */
    public function getMeta_keywords()
    {
        return $this->getMLVariable('meta_keywords');
    }

    /**
     * @param mixed $meta_title
     */
    public function setMeta_title($meta_title)
    {
        $this->setMLVariable('meta_title', $meta_title);
    }

    /**
     * @return mixed
     */
    public function getMeta_title()
    {
        return $this->getMLVariable('meta_title');
    }

    public function setSlug($slug)
    {
        $this->setMLVariable('slug', $slug);
    }

    public function getSlug()
    {
        return $this->getMLVariable('slug');
    }

    /**
     * @param mixed $text
     */
    public function setText($text)
    {
        $this->setMLVariable('text', $text);
    }

    /**
     * @return mixed
     */
    public function getText()
    {
        return $this->getMLVariable('text');
    }

    /**
     * @param mixed $title
     */
    public function setTitle($title)
    {
        $this->setMLVariable('title', $title);
    }

    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->getMLVariable('title');
    }

    /**
     * @param mixed $updated_at
     */
    public function setUpdatedAt($updated_at)
    {
        $this->updated_at = $updated_at;
    }

    /**
     * @return mixed
     */
    public function getUpdatedAt()
    {
        return $this->updated_at;
    }
    /**
     * @return mixed
     */
    public function getCover_Photo()
    {
        return $this->getMLVariable('cover_photo');
    }

    /**
     * @param mixed $cover_photo
     */
    public function setCover_Photo($cover_photo)
    {
        $this->setMLVariable('cover_photo', $cover_photo);
    }

    /**
     * @return mixed
     */
    public function getThumbnail_Photo()
    {
        return $this->getMLVariable('thumbnail_photo');
    }

    /**
     * @param mixed $thumbnail_photo
     */
    public function setThumbnail_Photo($thumbnail_photo)
    {
        $this->setMLVariable('thumbnail_photo', $thumbnail_photo);
    }
}
