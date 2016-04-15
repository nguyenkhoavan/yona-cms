<header class="head-section">
  {{ partial('main/header') }}
</header>

<div class="main-menu">
  {{ partial('main/menu') }}
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


{#{% if registry.cms['PROFILER'] %}#}
{#{{ helper.dbProfiler() }}#}
{#{% endif %}#}
