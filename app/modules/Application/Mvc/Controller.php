<?php

/**
 * Controller
 * @copyright Copyright (c) 2011 - 2014 Aleksandr Torosh (http://wezoom.com.ua)
 * @author Aleksandr Torosh <webtorua@gmail.com>
 */

namespace Application\Mvc;

/**
 * @property \Phalcon\Cache\Backend\Memcache $cache
 * @property \Phalcon\Mvc\View\Simple $viewSimple
 * @property \Application\Mvc\Helper $helper
 * @property \Phalcon\Http\Cookie $cookies
 */

class Controller extends \Phalcon\Mvc\Controller
{

    public function redirect($url, $code = 302)
    {
        switch ($code) {
            case 301:
                header('HTTP/1.1 301 Moved Permanently');
                break;
            case 302:
                header('HTTP/1.1 302 Moved Temporarily');
                break;
        }
        header('Location: ' . $url);
        $this->response->send();
    }

    public function returnJSON($response)
    {
        $this->view->disable();

        $this->response->setContentType('application/json', 'UTF-8');
        $this->response->setContent(json_encode($response));
        $this->response->send();
        exit;
    }

    public function flashErrors($model)
    {
        foreach ($model->getMessages() as $message) {
            $this->flash->error($message);
        }
    }

    public function setAdminEnvironment()
    {
        $this->view->setMainView(MAIN_VIEW_PATH . 'admin');
        $this->view->setLayout(null);
    }

    public function uploadImage($model, $type = null)
    {
        if (!$type) {
            $type = $model->getSource();
        }
        if ($this->request->isPost()) {
            if ($this->request->hasFiles() == true) {
                foreach ($this->request->getUploadedFiles() as $file) {
                    if (!$file->getName()) {
                        continue;
                    }
                    if (!in_array($file->getType(), [
                        'image/bmp',
                        'image/jpeg',
                        'image/png',
                    ])
                    ) {
                        return $this->flash->error($this->helper->translate('Only allow image formats jpg, jpeg, png, bmp'));
                    }

                    if($file->getSize() > 2000000) // 2MB
                    {
                        return $this->flash->error($this->helper->translate('File size upload exceeds'));

                    }

                    $attr = $file->getKey();
                    $imageFilter = new \Image\Storage([
                        'id' => $model->getId(),
                        'type' => $type."_".$attr,
                    ]);
                    $imageFilter->removeCached();

                    $image = new \Phalcon\Image\Adapter\GD($file->getTempName());
//                    if ($image->getWidth() > $resize_x) {
//                        $image->resize($resize_x);
//                    }
//
                    $image->save($imageFilter->originalAbsPath());

                    $model->setMLVariable($attr, $imageFilter->originalRelPath());
                    $model->update();
                }
            }
        }
    }

}