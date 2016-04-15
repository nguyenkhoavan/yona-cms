<?php

/**
 * Routes
 * @copyright Copyright (c) 2011 - 2014 Aleksandr Torosh (http://wezoom.com.ua)
 * @author Aleksandr Torosh <webtorua@gmail.com>
 */

namespace Admin;

class Routes
{

    public function init($router)
    {
        $router->add('/admin', array(
            'module'     => 'admin',
            'controller' => 'index',
            'action'     => 'index',
        ))->setName('admin');

        $router->add('/forgotPassword', array(
            'module'        => 'admin',
            'controller'    => 'index',
            'action'        => 'forgotPassword',
        ))->setName('forgotPassword');

        $router->add('/newPassword', array(
            'module'        => 'admin',
            'controller'    => 'index',
            'action'        => 'newPassword',
        ))->setName('newPassword');

        $router->add('/admin/user/{id:(\d+)}/delete', array(
            'module'        => 'admin',
            'controller'    => 'admin-user',
            'action'        => 'delete',
        ))->setName('delete-user');

        $router->add('/admin/user/{id:(\d+)}/edit', array(
            'module'     => 'admin',
            'controller' => 'admin-user',
            'action'     => 'edit',
        ))->setName('edit-user');

        return $router;

    }

}