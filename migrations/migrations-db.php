<?php
/**
 * Created by PhpStorm.
 * User: thinhvoxuan
 * Date: 8/23/15
 * Time: 3:03 PM
 */

return [
    'driver'        => 'pdo_mysql',
    'host' 			=> 'localhost',
    'user' 		    => 'root',
    'password' 		=> 'vagrant',
    'dbname' 		=> 'cis',
    'charset'       => 'utf8',
    'mapping_types' => [
        'enum' => 'string'
    ]
];