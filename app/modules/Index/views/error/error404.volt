{{ stylesheet_link('/static/css/main.bootstrap/main.bootstrap.min.css') }}
{{ stylesheet_link('/static/css/404.css') }}

<div class="wrap">
    <!---start-header---->
    <div class="header">
        <div class="logo">
            <h1><a href="#">Ohh</a></h1>
        </div>
    </div>
    <!---728x90--->

    <!---End-header---->
    <!--start-content------>
    <div class="content">
        <img src="/static/images/404/404.png" title="error">
        <!---728x90--->

        <p><span><label>O</label>hh.....</span>{{ helper.translate('You Requested the page that is no longer There') }}.</p>

        <a class="btn btn-primary btn-lg" href="{{ url.get('/') }}">{{ helper.translate('Back To Home') }}</a>

        {% if registry.cms['DEBUG_MODE'] %}
            <p>--------------------------<br>Debug mode error details:</p>
            {% if e is defined %}
                <p>{{ e.getMessage() }}</p>
                <p>{{ e.getFile() }}::{{ e.getLine() }}</p>
                <pre>{{ e.getTraceAsString() }}</pre>
            {% endif %}
            {% if message %}
                {{ message }}
            {% endif %}
        {% endif %}

        <!---728x90--->
        {#<div class="copy-right">#}
            {#<p>© 2013 Ohh. All Rights Reserved | Design by <a href="http://w3layouts.com/">W3Layouts</a></p>#}
        {#</div>#}
    </div>
    <!--End-Content------>
</div>