<?php
/**
 * Created by PhpStorm.
 * User: office-pb1
 * Date: 18.07.14
 * Time: 20:49
 */

namespace Publication\Controller;

use Application\Mvc\Controller;
use Publication\Model\Publication;
use Publication\Form\PublicationForm;

class AdminController extends Controller
{

    public function initialize()
    {
        $this->view->setMainView(MAIN_VIEW_PATH . 'admin');
        $this->helper->activeMenu()->setActive('admin-publication');

    }

    public function indexAction()
    {
        $this->view->entries = Publication::find(array(
            "order" => "type ASC, id DESC"
        ));

        $this->view->title = 'Список публикаций';
    }

    public function addAction()
    {
        $this->view->pick(array('admin/edit'));
        $form = new PublicationForm();
        $model = new Publication();

        if ($this->request->isPost()) {
            $form->bind($this->request->getPost(), $model);
            if ($form->isValid()) {
                if ($model->save()) {
                    $this->flash->success('Публикация создана');
                    return $this->redirect('/publication/admin/edit/' . $model->getId());
                } else {
                    $this->flashErrors($model);
                }
            } else {
                $this->flashErrors($form);
            }
        }

        $this->view->model = $model;
        $this->view->form = $form;
        $this->view->title = 'Создание публикации';

    }

    public function editAction($id)
    {
        $id = (int)$id;
        $form = new PublicationForm();
        $model = Publication::findFirst($id);

        if ($this->request->isPost()) {
            $form->bind($this->request->getPost(), $model);
            if ($form->isValid()) {
                if ($model->save()) {
                    $this->uploadImage($model);
                    $this->flash->success('Информация обновлена');
                    return $this->redirect('/publication/admin/edit/' . $model->getId());
                } else {
                    $this->flashErrors($model);
                }
            } else {
                $this->flashErrors($form);
            }
        } else {
            $form->setEntity($model);
        }

        $this->view->model = $model;
        $this->view->form = $form;
        $this->view->title = 'Редактирование публикации';
    }

    public function deleteAction($id)
    {
        $model = Publication::findFirst($id);

        if ($this->request->isPost()) {
            $model->delete();
            $this->redirect('/publication/admin');
        }

        $this->view->model = $model;
        $this->view->title = 'Удаление публикации';
    }

    private function uploadImage($model)
    {
        if ($this->request->isPost()) {
            if ($this->request->hasFiles() == true) {
                foreach ($this->request->getUploadedFiles() as $file) {
                    if (!in_array($file->getType(), array(
                        'image/bmp',
                        'image/jpeg',
                        'image/png',
                    ))
                    ) {
                        return $this->flash->error('Разрешается загружать только файлы с расширением jpg, jpeg, png, bmp');
                    }

                    $imageFilter = new \Image\Filter(array(
                        'id' => $model->getId(),
                        'type' => 'publication',
                    ));

                    $resize_x = 1000;
                    $resize_y = 1000;

                    $successMsg = 'Фото добавлено';

                    $imageFilter->removeCached();

                    require_once __DIR__ . '/../../Image/vendor/PHPThumb/ThumbLib.inc.php';
                    $thumb = \PhpThumbFactory::create($file->getTempName());
                    $thumb->resize($resize_x, $resize_y);
                    $thumb->save($imageFilter->originalAbsPath());

                    $this->flash->success($successMsg);
                }
            }
        }

    }

} 