<nav class="navbar navbar-default">
  <div id="header">
    <div class="container">
      <div class="row">
        {{ partial('main/header') }}
      </div>
    </div>
  </div>

  <div id="menu">
      {{ partial('main/menu') }}
  </div>
</nav>


<!-- main content -->
<main>
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        {{ content() }}
      </div>
    </div>
  </div>
</main>
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
