<?php

return [
    'loader'         => [
        'namespaces' => [
            // Here you can setup your new vendor namespace, example:
            // 'Zend' => APPLICATION_PATH . '/../vendor/zendframework/zendframework/library/Zend',
        ],
    ],

    'assets'         => [
        // Admin side Assets
        'admin_js' =>[
            'vendor/bootstrap/dist/js/bootstrap.min.js',
            'bower_components/moment/moment.js',
            'vendor/semantic-2.1/semantic.min.js',

            // Add components
            'vendor/bootstrap/jasny-bootstrap/js/jasny-bootstrap.min.js',
            'vendor/js/jquery.address.js',
            'vendor/noty/packaged/jquery.noty.packaged.min.js',
            'bower_components/select2/dist/js/select2.full.min.js',
            'bower_components/switchery/dist/switchery.js',
            'bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js',
            'bower_components/jquery-slimscroll/jquery.slimscroll.min.js',
            'bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js',
            'bower_components/magnific-popup/dist/jquery.magnific-popup.min.js',

            'static/js/admin/Component.js',
            'static/js/admin/admin.js',

        ],
        'admin_css' =>[
            'vendor/animate.css',
            // Add Bootstrap Css
            'static/css/admin.bootstrap/admin.bootstrap.min.css',
            // Add Bootstrap theme
            'static/css/admin.bootstrap.theme/admin.bootstrap.theme.min.css',

            // Add Components
            'bower_components/select2/dist/css/select2.min.css',
            'bower_components/switchery/dist/switchery.min.css',
            'bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css',
            'bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css',
            'bower_components/magnific-popup/dist/magnific-popup.css',

            // Application css
            'static/css/admin/admin.min.css',

        ],


        // Client side Assets
        'js' => [
            'vendor/bootstrap/dist/js/bootstrap.min.js',
            'bower_components/moment/moment.js',
            'static/js/library.js',
            'static/js/rotation.js',
            // just comment two lines below if you don't need pages transitions via AJAX
            'vendor/history/native.history.js',
            'static/js/ajax.js',
            'bower_components/bxslider-4/dist/jquery.bxslider.min.js',
            'bower_components/jquery-slimscroll/jquery.slimscroll.min.js',
            'bower_components/icheck/icheck.min.js',
            'bower_components/select2/dist/js/select2.full.min.js',


            'bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js',
            'static/js/admin/Component.js',
        ],
        'css' => [
            'static/css/main.bootstrap/main.bootstrap.min.css',
            'static/css/animate.css',
            'static/icons/icons.css',
            'static/css/fonts.css',
            'bower_components/bxslider-4/dist/jquery.bxslider.min.css',
            'bower_components/icheck/skins/flat/red.css',
            'bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css',
            'bower_components/select2/dist/css/select2.min.css',
            'static/css/main/main.min.css',

        ]
    ],

    // Language for admin dashboard.
    // Values: ru, en.
    // All translations contains in /app/modules/Cms/admin_translations in files with names ru.php, en.php.
    // To add another language you can create in this directory new file with name de.php and set 'admin_language' => 'de' it will works.
    'admin_language' => 'en',

    'mandrill' => [
        'key' => '2ib_1XQAxEtJa5lpRiiSyQ',
        'fromEmail' => [
            'email' => 'support@demo.ciss.com',
            'name'  => 'Support'
        ]
    ],

    'date_format' => [
        'vi' => 'd/m/Y',
        'en' => 'm/d/Y',
    ]
];