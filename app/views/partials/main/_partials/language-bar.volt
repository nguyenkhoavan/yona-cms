{# Created by PhpStorm #}
{# User: @VanNguyen: nguyenkhoavan@outlook.com #}
{# Date: 3/29/2016 #}
{# Time: 11:13 AM #}

{% set languages = helper.languages() %}
{% if languages|length > 1 %}
    <div class="languages">
        {% for language in languages %}
            <div class="lang">
                {{ helper.langSwitcher(language['iso'], language['short_name']|upper) }}
            </div>
        {% endfor %}
    </div>
{% endif %}