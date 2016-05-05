{# Created by PhpStorm #}
{# User: @VanNguyen: nguyenkhoavan@outlook.com #}
{# Date: 3/29/2016 #}
{# Time: 11:13 AM #}

{% set languages = helper.languages() %}
{% if languages|length > 1 %}
    <ul class="languages nav navbar-nav navbar-right">
        {% for language in languages %}
            <li class="lang">
                {{ helper.langSwitcher(language['iso'], language['short_name']|upper) }}
            </li>
        {% endfor %}
    </ul>
{% endif %}
