<div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
</div>

<div class="collapse navbar-collapse" id="navbar">
    {{ partial('main/_partials/search') }}

    {{ partial('main/_partials/language-bar') }}
    <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#">{{ helper.translate('Photos') }}</a></li>
        <li><a href="#">{{ helper.translate('Videos') }}</a></li>
        <li><a href="#">{{ helper.translate('CISS Journey') }}</a></li>
        <li><a href="#">{{ helper.translate('Calendar') }}</a></li>
        <li><a href="#">{{ helper.translate('Announcements') }}</a></li>
        <li><a href="#">{{ helper.translate('Contacts') }}</a></li>
    </ul>
</div>
