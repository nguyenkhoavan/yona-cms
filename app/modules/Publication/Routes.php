<?php

/**
 * Routes
 * @copyright Copyright (c) 2011 - 2014 Aleksandr Torosh (http://wezoom.com.ua)
 * @author Aleksandr Torosh <webtorua@gmail.com>
 */

namespace Publication;

use Publication\Model\Type;

class Routes
{

    public function init($router)
    {
        $types_keys = array_keys(Type::types());
        $types_regex = '(' . implode('|', $types_keys) . ')';

        $router->add('/admin/publication', array(
            'module' => 'publication',
            'controller' => 'admin',
            'action' => 'index'
        ))->setName('publications_admin_all');

        $router->add('/admin/publication/{type:' . $types_regex . '}', array(
            'module'        => 'publication',
            'controller'    => 'admin',
            'action'        => 'index'
        ))->setName('publications_admin');

        $router->add('/admin/publication/{id:(\d+)}/delete', array(
            'module'     => 'publication',
            'controller' => 'admin',
            'action'     => 'delete',
        ))->setName('delete-publication');

        $router->add('/admin/publication/{type:([a-zA-Z0-9_]+)}/{id:(\d+)}/edit', array(
            'module'        => 'publication',
            'controller'    => 'admin',
            'action'        => 'edit',
            'id'            => 2,
            'type'          => 1,
        ))->setName('edit-publication');

        $router->add('/admin/publication/{type:([a-zA-Z0-9_]+)}/add', array(
            'module'     => 'publication',
            'controller' => 'admin',
            'action'     => 'add',
        ))->setName('add-publication');

        /* ------------------- Front-End ----------------------- */
        $router->addML('/{type:' . $types_regex . '}', array(
            'module' => 'publication',
            'controller' => 'index',
            'action' => 'index'
        ), 'publications');

        $router->addML('/{type:' . $types_regex . '}/{slug:[a-zA-Z0-9_-]+}.html', array(
            'module' => 'publication',
            'controller' => 'index',
            'action' => 'publication'
        ), 'publication');

        return $router;

    }

}