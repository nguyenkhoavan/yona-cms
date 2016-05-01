<?php

/**
 * Routes
 * @copyright Copyright (c) 2011 - 2014 Aleksandr Torosh (http://wezoom.com.ua)
 * @author Aleksandr Torosh <webtorua@gmail.com>
 */

namespace Page;

use Application\Mvc\Router\DefaultRouter;

class Routes
{

    public function init(DefaultRouter $router)
    {
        $router->addML('/{slug:[a-zA-Z0-9_-]+}.html', array(
            'module' => 'page',
            'controller' => 'index',
            'action' => 'index'
        ), 'page');

        $router->addML('/contacts.html', array(
            'module' => 'page',
            'controller' => 'index',
            'action' => 'contacts',
        ), 'contacts');

        // Admin
        $router->add('/admin/page/parents-dropdown/{id:(\d+)}', array(
            'module'     => 'page',
            'controller' => 'admin',
            'action'     => 'pageParent',
        ))->setName('parents-dropdown');

        $router->add('/admin/page/{id:(\d+)}/edit', array(
            'module'     => 'page',
            'controller' => 'admin',
            'action'     => 'edit',
        ))->setName('edit-page');

        $router->add('/admin/page/add', array(
            'module'     => 'page',
            'controller' => 'admin',
            'action'     => 'add',
        ))->setName('add-page');

        $router->add('/admin/page/{id:(\d+)}/delete', array(
            'module'     => 'page',
            'controller' => 'admin',
            'action'     => 'delete',
        ))->setName('delete-page');

        $router->add('/page/admin/layout/{name:[a-zA-Z0-9_-]+}', array(
            'module'        => 'page',
            'controller'    => 'template',
            'action'        => 'index'
        ))->setName('page-layout');

        $router->add('/admin/generate-slug', array(
            'module'        => 'page',
            'controller'    => 'admin',
            'action'        => 'generateSlug'
        ))->setName('generate-slug');

        return $router;

    }

}