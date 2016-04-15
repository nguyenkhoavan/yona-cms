<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>{{ helper.title().get()|escape }}</title>
  <link href="{{ url.path() }}favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon">

  {{ helper.meta().get('description') }}
  {{ helper.meta().get('keywords') }}
  {{ helper.meta().get('seo-manager') }}

  {#<meta name="fb:app_id" content="1725798137648732">#}

  {{ helper.meta().get('og:title') }}
  {{ helper.meta().get('og:url') }}
  {{ helper.meta().get('og:type') }}
  {{ helper.meta().get('og:description') }}
  {{ helper.meta().get('og:image') }}


  {{ stylesheet_link('/vendor/font-awesome-4.2.0/css/font-awesome.min.css') }}
  {{ stylesheet_link('https://fonts.googleapis.com/css?family=Noticia+Text:400,400italic,700,700italic') }}
  <!-- page css assets -->
  {{ assets.outputCss() }}
  <!-- /end page css assets -->



  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

  <![endif]-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

  <script>
    var ENVIRONMENT = "{{ constant('APPLICATION_ENV') }}";
    var LANG = "{{ constant('LANG') }}";
    var DATE_FORMAT = {vi: 'D/M/YYYY', en: 'M/D/YYYY'}; // Using in momentjs
  </script>

  {{ helper.javascript('head') }}

</head>

<body class="{{ bodyClass|default('home') }}">

  {{content()}}

  {{ helper.javascript('body') }}

  <!-- page js assets -->
  {{ assets.outputJs() }}
  <!-- /end page js assets -->

  {% set datepickerLanguageFileName =  '/bower_components/bootstrap-datepicker/js/locales/bootstrap-datepicker.' ~ constant('LANG') ~'.js'%}
  {{ javascript_include(datepickerLanguageFileName) }}
  {% set momentLanguageFileName =  '/bower_components/moment/locale/' ~ constant('LANG') ~'.js'%}
  {{ javascript_include(momentLanguageFileName) }}


  {{ javascript_include('static/js/main.js') }}

</body>
</html>
