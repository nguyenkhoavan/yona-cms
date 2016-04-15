<?php
/**
 * Created by PhpStorm.
 * User: office-pb1
 * Date: 07.07.14
 * Time: 22:48
 */

namespace Publication\Form;

use Application\Form\Element\Image;
use Carbon\Carbon;
use Phalcon\Forms\Element\Check;
use Phalcon\Validation\Validator\PresenceOf;
use Application\Form\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use \Phalcon\Forms\Element\File;
use Publication\Model\Type;
use Tag\Model\Tag;

class PublicationForm extends Form
{

    public function initialize($model)
    {
        $config = $this->getDI()->getConfig();
        $dateFormat = $config['date_format'];
        $dFormat = $dateFormat[LANG];

        $type = new Select('type_id', Type::cachedListArray(['key' => 'id']));
        $type->setLabel('Type of Publication');
        $this->add($type);

        $title = new Text('title', array('required' => true, 'data-url' => $this->url->get(['for' => 'generate-slug'])));
        $title->addValidator(new PresenceOf([
            'message' => 'Title can not be empty'
        ]));
        $title->setLabel('Title');
        $this->add($title);

        $slug = new Text('slug');
        $slug->setLabel('Slug');
        $this->add($slug);

        $date = new Text('date', ['data-widget' => 'datepicker', 'data-date-format'=>$dFormat]);
        $date->setLabel('Publication Date');
        $this->add($date);

        $coverPhoto = new Image('cover_photo');
        $coverPhoto->setLabel('Cover Image');
        $this->add($coverPhoto);

        $short_description = new TextArea('short_description', ['rows'=>6]);
        $short_description->setLabel('Short content');
        $this->add($short_description);

        $text = new TextArea('text');
        $text->setLabel('Full content');
        $this->add($text);

        $meta_title = new Text('meta_title', ['required' => true]);
        $meta_title->setLabel('meta-title');
        $this->add($meta_title);

        $meta_description = new TextArea('meta_description', ['style' => 'height:4em; min-height: inherit']);
        $meta_description->setLabel('meta-description');
        $this->add($meta_description);

        $meta_keywords = new TextArea('meta_keywords', ['style' => 'height:4em; min-height: inherit']);
        $meta_keywords->setLabel('meta-keywords');
        $this->add($meta_keywords);

        $preview_inner = new Check('preview_inner');
        $preview_inner->setLabel('Show preview image inside publication');
        $this->add($preview_inner);

        $image = new Image('preview_src');
        $image->setLabel('Thumbnail Image');
        $this->add($image);
    }

    public function getDate(){
        $config = $this->getDI()->getConfig();
        $dateFormat = $config['date_format'];
        $dFormat = $dateFormat[LANG];
        if(!$this->getEntity()) return Carbon::now()->format($dFormat);
        if(!$this->getEntity()->getDate()) return Carbon::now()->format($dFormat);
        if (\DateTime::createFromFormat('Y-m-d G:i:s', $this->getEntity()->getDate()) !== FALSE) {
            return Carbon::createFromFormat('Y-m-d G:i:s', $this->getEntity()->getDate())->format($dFormat);
        }
        return Carbon::createFromTimestamp($this->getEntity()->getDate())->format($dFormat);
    }

    public function getCustomValue($name, $entity, $data)
    {
        if($name == 'date') {
            return $this->getDate();
        }

        return parent::getCustomValue($name, $entity, $data);
    }
}