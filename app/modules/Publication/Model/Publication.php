<?php

namespace Publication\Model;

use Application\Mvc\Model\Model;
use Carbon\Carbon;
use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Validator\PresenceOf;
use Application\Localization\Transliterator;
use Phalcon\Mvc\Model\Behavior\Timestampable;
use Publication\Model\Translate\PublicationTranslate;

class Publication extends Model
{
    private $id;
    private $type_id;
    private $slug;
    private $created_at;
    private $updated_at;
    private $date;
    private $cover_photo; // translate
    private $preview_src; // translate
    private $preview_inner; // translate

    protected $title;
    protected $text;
    protected $meta_title;
    protected $meta_description;
    protected $meta_keywords;



    public function getSource()
    {
        return "publication";
    }

    protected $translateModel = 'Publication\Model\Translate\PublicationTranslate'; // translate

    public function initialize()
    {
        $this->addBehavior(
            new Timestampable(
                array(
                    'beforeValidationOnCreate' => array(
                        'field' => ['created_at', 'updated_at'],
                        'generator' => function () {
                            return Carbon::now()->timestamp;
                        }
                    ),
                    'beforeUpdate' => array(
                        'field' => 'updated_at',
                        'generator' => function () {
                            return Carbon::now()->timestamp;
                        }
                    ),
                )
            )
        );

        $this->hasMany('id', $this->translateModel, 'foreign_id', ['alias'=>'translates']); // translate

        $this->belongsTo('type_id', 'Publication\Model\Type', 'id', [
            'alias' => 'type'
        ]);
    }

    public function afterUpdate()
    {
        parent::afterUpdate();

        $cache = $this->getDi()->get('cache');

        $cache->delete(self::cacheSlugKey($this->getSlug()));
    }

    public function beforeSave(){
        $this->setDate(strtotime($this->date));
    }

    public function validation()
    {
        $this->validate(new Uniqueness(
            [
                "field"   => "slug",
                "message" => "Страница с такой транслитерацией = '" . $this->slug . "' уже существует"
            ]
        ));

        return $this->validationHasFailed() != true;
    }

    public function afterValidation()
    {
        if (!$this->date) {
            $this->date = date("Y-m-d H:i:s");
        }
    }

    public function updateFields($data)
    {
        if (!$this->getSlug()) {
            $this->setSlug(Transliterator::slugify($data['title']));
        }
        if (!$this->getMeta_title()) {
            $this->setMeta_title($data['title']);
        }
        $this->setPreviewInner(isset($data['preview_inner']) ? 1 : 0);
    }

    public static function findCachedBySlug($slug)
    {
        $pt = \Publication\Model\Translate\PublicationTranslate::findFirst([
            'conditions' =>'key="slug" AND value= ?0 AND lang=?1',
            'bind' => [0 => $slug, 1=>LANG]
        ]);
        $publication = self::findFirst(["id = '$pt->foreign_id'",
            'cache' => [
                'key'      => self::cacheSlugKey($slug),
                'lifetime' => 60]
        ]);
        return $publication;
    }

    public static function cacheSlugKey($slug)
    {
        $key = HOST_HASH . md5('Publication\Model\Publication; slug = ' . $slug);
        return $key;
    }

    public function setCreatedAt($created_at)
    {
        $this->created_at = $created_at;
    }

    public function getCreatedAt()
    {
        return $this->created_at;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setMeta_description($meta_description)
    {
        $this->setMLVariable('meta_description', $meta_description);
    }

    public function getMeta_description()
    {
        return $this->getMLVariable('meta_description');
    }

    public function setMeta_keywords($meta_keywords)
    {
        $this->setMLVariable('meta_keywords', $meta_keywords);
    }

    public function getMeta_keywords()
    {
        return $this->getMLVariable('meta_keywords');
    }

    public function setMeta_title($meta_title)
    {
        $this->setMLVariable('meta_title', $meta_title);
    }

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

    public function setText($text)
    {
        $this->setMLVariable('text', $text);
    }

    public function getText()
    {
        return $this->getMLVariable('text');
    }

    public function setTitle($title)
    {
        $this->setMLVariable('title', $title);
    }

    public function getTitle()
    {
        return $this->getMLVariable('title');
    }

    public function setUpdatedAt($updated_at)
    {
        $this->updated_at = $updated_at;
    }

    public function getUpdatedAt()
    {
        return $this->updated_at;
    }

    public function setDate($date)
    {
        $this->date = $date;
    }

    public function getDate($format=null)
    {
        if ($format) {
            $format =  $this->getDi()->get('helper')->getDateFormat();
            if ($this->date) {
                return date($format, $this->date);
            }
        }

        return $this->date;
    }

    public function setType_id($type_id)
    {
        $this->type_id = $type_id;
    }

    public function getType_id()
    {
        return $this->type_id;
    }

    public function getTypeTitle()
    {
        if ($this->type_id) {
            $types = Type::cachedListArray(['key' => 'id']);
            if (array_key_exists($this->type_id, $types)) {
                return $types[$this->type_id];
            }
        }
    }

    public function getTypeSlug()
    {
        if ($this->type_id) {
            $types = Type::cachedListArray(['key' => 'id', 'value' => 'slug']);
            if (array_key_exists($this->type_id, $types)) {
                return $types[$this->type_id];
            }
        }
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

    public function setPreviewInner($preview_inner)
    {
        $this->setMLVariable('preview_inner', $preview_inner);
    }

    public function getPreview_Inner()
    {
        return $this->getMLVariable('preview_inner');
    }

    public function getPreview_Src()
    {
        return $this->getMLVariable('preview_src');
    }

    public function setPreview_Src($preview_src)
    {
        $this->setMLVariable('preview_src', $preview_src);
    }

    /**
     * @return mixed
     */
    public function getThumbnailPhoto()
    {
        return $this->getPreviewSrc();
    }

}