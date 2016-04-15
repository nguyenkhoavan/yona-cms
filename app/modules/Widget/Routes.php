<?php

/**
 * Routes
 * @copyright Copyright (c) 2011 - 2014 Aleksandr Torosh (http://wezoom.com.ua)
 * @author Aleksandr Torosh <webtorua@gmail.com>
 */

namespace Widget;

use Application\Mvc\Router\DefaultRouter;

class Routes
{

    public function init(DefaultRouter $router)
    {
        // Admin

        $router->add('/widget/admin', array(
            'module'     => 'widget',
            'controller' => 'admin',
            'action'     => 'index',
        ))->setName('static-widget');

        $router->add('/widget/admin/add', array(
            'module'     => 'widget',
            'controller' => 'admin',
            'action'     => 'add',
        ))->setName('add-widget');

        $router->add('/admin/widget/{id:(\d+)}/edit', array(
            'module'     => 'widget',
            'controller' => 'admin',
            'action'     => 'edit',
        ))->setName('edit-widget');

        $router->add('/admin/widget/{id:(\d+)}/delete', array(
            'module'     => 'widget',
            'controller' => 'admin',
            'action'     => 'delete',
        ))->setName('delete-widget');

        return $router;

    }

}