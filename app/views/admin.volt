<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>{{ helper.title().append('Administrative Panel') }}{{ helper.title().get() }}</title>

    <link href="{{ url.path() }}favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon">
    <link href="{{ url.path() }}vendor/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="{{ url.path() }}vendor/js/jquery-1.11.0.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="{{ url.path() }}vendor/js/html5shiv.js"></script>
    <script src="{{ url.path() }}vendor/js/respond.min.js"></script>
    <![endif]-->

    <!-- page css assets -->
    {{ assets.outputCss('admin_css') }}
    <!-- /end page css assets -->

    <script>
        var ENVIRONMENT = "{{ constant('APPLICATION_ENV') }}";
        var LANG = "{{ constant('LANG') }}";
        var DATE_FORMAT = {vi: 'dd/mm/YYYY', en: 'mm/dd/yyyy'}; // Using in momentjs
    </script>
</head>
<body>

    {% if registry.cms['TECHNICAL_WORKS'] %}
        <div class="ui red inverted segment">
            The site under maintenance.<br>
            Please do not perform any action until the work is completed.
        </div>
    {% else %}
        <div class="left_col">
            {{ partial('admin/nav') }}
        </div>

        <div class="right_col">
            {% if title is defined %}
                <div class="page-title">
                    <strong class="animated bounceInDown">{{ title }}</strong>
                </div>
            {% endif %}

            <div class="container-fluid main">
                {% if languages_disabled is not defined %}
                    <div class="language-bar">
                        {{ partial('admin/languages') }}
                    </div>
                {% endif %}

                {{ flash.output() }}

                {{ content() }}
            </div>
        </div>
    {% endif %}

{{ assets.outputJs('admin_js') }}
{{ assets.outputJs('modules-admin-js') }}

</body>
</html>