<?php

return [
    'base_path' => '/',
    //'base_path' => 'http://localhost/yona-cms/web/',

    'database' => [
        'adapter' => 'Mysql',
        'host' => getenv('DB_HOST'),
        'username' => getenv('DB_USER'),
        'password' => getenv('DB_PASS'),
        'dbname' => getenv('DB_NAME'),
        'charset' => 'utf8',
    ],

    'memcache'  => [
        'host' => 'localhost',
        'port' => 11211,
    ],

    'cache'     => 'file',
    //'cache'     => 'memcache',
];