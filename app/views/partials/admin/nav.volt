<nav class="navbar navbar-inverse navbar-sidebar">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{{ url(['for': 'admin']) }}">
            GEEK Up CMS
        </a>
    </div>
    <div class="collapse navbar-collapse" id="navbar">
        <ul class="nav navbar-nav">
            <li class="divider"></li>

            <li class="{{ helper.activeMenu().activeClass('admin-page') }}">
                <a href="{{ url.get() }}page/admin">
                    {{ helper.at('Pages') }} <i class="fa fa-outdent"></i>
                </a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('admin-publication') }}">
                <a href="{{ url.get(['for': 'publications_admin_all']) }}">
                    {{ helper.at('Publications') }} <i class="fa fa-calendar"></i>
                </a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('admin-widget') }}">
                <a href="{{ url.get(['for' : 'static-widget'])  }}">Static Widget</a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('admin-fm') }}">
                <a href="{{ url.get() }}file-manager">
                    {{ helper.at('File Manager') }} <i class="fa fa-picture-o"></i>
                </a>
            </li>

            <li class="divider"></li>

            <li class="{{ helper.activeMenu().activeClass('seo-robots') }}">
                <a href="{{ url.get() }}seo/robots">Robots.txt <i class="fa fa-android"></i></a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('seo-sitemap') }}">
                <a href="{{ url.get() }}seo/sitemap">Sitemap.xml <i class="fa fa-sitemap"></i></a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('seo-manager') }}">
                <a href="{{ url.get() }}seo/manager">SEO Manager <i class="fa fa-lightbulb-o"></i></a>
            </li>

            <li class="divider"></li>

            <li class="{{ helper.activeMenu().activeClass('admin-user') }}">
                <a href="{{ url.get() }}admin/admin-user">{{ helper.at('Manage Users') }} <i class="fa fa-users"></i></a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('admin-cms') }}">
                <a href="{{ url.get() }}cms/configuration">{{ helper.at('CMS Configuration') }} <i class="fa fa-cogs"></i></a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('admin-language') }}">
                <a href="{{ url.get() }}cms/language">{{ helper.at('Languages') }} <i class="fa fa-globe"></i></a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('admin-translate') }}">
                <a href="{{ url.get() }}cms/translate">{{ helper.at('Translate') }} <i class="fa fa-book"></i></a>
            </li>
            <li class="{{ helper.activeMenu().activeClass('admin-javascript') }}">
                <a href="{{ url.get() }}cms/javascript">{{ '<head>, <body> javascript'|escape }} <i class="fa fa-code"></i></a>
            </li>

            <li class="divider"></li>
        </ul>

        <div class="clearfix"></div>

        <div class="navbar-footer">
            <a href="{{ url.get() }}" class="btn btn-primary" target="_blank">
                <i class="fa fa-home"></i> {{ helper.at('View Site') }}
            </a>
            <a href="javascript:void(0);" class="btn btn-danger" onclick="document.getElementById('logout-form').submit()">
                <i class="fa fa-power-off"></i> {{ helper.at('Logout') }}
            </a>

            <form action="{{ url.get() }}admin/index/logout" method="post" style="display: none;" id="logout-form">
                <input type="hidden" name="{{ security.getTokenKey() }}"
                       value="{{ security.getToken() }}">
            </form>
        </div>
    </div>
</nav>
