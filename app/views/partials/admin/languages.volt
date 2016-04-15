{% set languages = helper.languages() %}
{% if languages|length > 1 %}
    <ul class="nav nav-tabs" role="tablist">
        {% for lang in languages %}
            <li role="presentation" class="{% if lang['iso'] == helper.constant('LANG') %} active{% endif %}">
                <a href="?lang={{ lang['iso'] }}">{{ lang['name'] }}</a>
            </li>
        {% endfor %}
    </ul>
{% endif %}