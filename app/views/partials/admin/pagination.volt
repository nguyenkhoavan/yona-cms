{% set link = url.get() ~ substr(router.getRewriteUri(), 1) %}
{% if (params is not defined) %}
    {% set params = '' %}
{% endif %}
<nav>
    <ul class="pagination">
        <li class="{% if paginate.current == 1 %} disabled {% endif %}">
            <a href="{{ link }}?{{ params }}page={{ paginate.before }}" aria-label="Previous"><span aria-hidden="true">{{ helper.translate('Prev') }}</span></a>
        </li>
        {% if paginate.total_pages > 10 %}
            {% if paginate.current > 5 %}
                {% for i in paginate.current-4..paginate.current+5 %}
                    {% if i <= paginate.total_pages %}
                        <li class="{% if paginate.current == i %} active{% endif %}">
                            <a href="{{ link }}?{{ params }}page={{ i }}">{{ i }}</a>
                        </li>
                    {% endif %}
                {% endfor %}
            {% else %}
                {% for i in 1..10 %}
                    <li class="{% if paginate.current == i %} active{% endif %}">
                        <a href="{{ link }}?{{ params }}page={{ i }}">{{ i }}</a>
                    </li>
                {% endfor %}
            {% endif %}
        {% else %}
            {% for i in 1..paginate.total_pages %}
                <li class="{% if paginate.current == i %} active{% endif %}">
                    <a href="{{ link }}?{{ params }}page={{ i }}">{{ i }}</a>
                </li>
            {% endfor %}
        {% endif %}
        <li  class="{% if paginate.current == paginate.total_pages %} disabled {% endif %}">
            <a href="{{ link }}?{{ params }}page={{ paginate.next }}" aria-label="Next"><span aria-hidden="true">{{ helper.translate('Next') }}</span></a>
        </li>
    </ul>
</nav>