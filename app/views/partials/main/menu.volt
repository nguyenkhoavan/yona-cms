<div class="container">
    <div class="row">
        <div class="col-md-5 col-sm-4 col-xs-12">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="{{ url.get() }}" class="navbar-brand"><img src="/static/images/logo.png"></a>
            </div>
        </div>

        <div class="col-md-7 col-sm-8 col-xs-12">
            <div class="collapse navbar-collapse" id="navbar">
                <ul id="main_menu" class="list-unstyled">
                    <li>
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">{{ helper.translate("Home") }}</a></li>
                            <li><a href="#">{{ helper.translate("About CISS") }}</a></li>
                            <li><a href="#">{{ helper.translate("News") }}</a></li>
                            <li><a href="#">{{ helper.translate("Academic") }}</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="nav navbar-nav">
                            <li><a href="#">{{ helper.translate("Admissions") }}</a></li>
                            <li><a href="#">{{ helper.translate("Student Life") }}</a></li>
                            <li><a href="#">{{ helper.translate("Students Success") }}</a></li>
                            <li><a href="#">{{ helper.translate("Recruitment") }}</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
