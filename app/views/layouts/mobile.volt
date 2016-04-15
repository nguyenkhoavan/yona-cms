{# Created by PhpStorm #}
{# User: @VanNguyen: nguyenkhoavan@outlook.com #}
{# Date: 3/24/2016 #}
{# Time: 2:13 PM #}

<div id="affix" data-spy="affix" data-offset-top="123" data-offset-bottom="0">
    <header class="head-section">
        {{ partial('main/mobile/header') }}
    </header>

    <div class="main-menu">
        {{ partial('main/mobile/menu') }}
    </div>
</div>

<!-- main content -->
{{ content() }}
<!-- end of content -->

{% if seo_text is defined and seo_text_inner is not defined %}
    <div class="container seo" style="display:none">
        {{ seo_text }}
    </div>
{% endif %}

{{ partial('main/footer') }}
