{# Created by PhpStorm #}
{# User: @VanNguyen: nguyenkhoavan@outlook.com #}
{# Date: 3/4/2016 #}
{# Time: 2:00 PM #}

{% for item in entries %}
    {% set link = url.get(['for': 'edit-page', 'id': item.getId()]) %}
    {% set cover = helper.image(['id': item.getId(),'type':item.getImgFolder('cover_photo'),'width':100]) %}
    {% set image = helper.image(['id': item.getId(),'type':item.getImgFolder('thumbnail_photo'),'width':100]) %}

    <tr data-widget="magnific-popup">
        <td><a href="{{ link }}?lang={{ constant('LANG') }}">{{ item.getTitle() }}</a></td>
        <td>
            {% if cover.isExists() %}
                <a data-title="{{ item.getTitle() ~ ' - Cover image' }}" class="mfp-gallery" href="{% if cover.originalRelPath() %} {{ '/'~ cover.originalRelPath() }}  {% endif %}">{{ cover.imageHTML() }}</a>
            {% endif %}
        </td>
        <td>
            {% if image.isExists() %}
                <a data-title="{{ item.getTitle() ~ ' - Thumbnail image' }}" class="mfp-gallery" href="{% if image.originalRelPath() %} {{ '/'~ image.originalRelPath() }}  {% endif %}">{{ image.imageHTML() }}</a>
            {% endif %}
        </td>
        <td>
            {{ helper.announce(item.getText()) }}
        </td>
        <td>
            {% set url = helper.langUrl(['for':'page', 'slug':item.getSlug()]) %}
            <a href="{{ url }}" target="_blank">{{ url }}</a>
        </td>
        <td width="130px">
            <a class="btn btn-primary btn-xs" href="{{ url.get(['for': 'edit-page', 'id': item.getId()]) }}"><i class="fa fa-pencil-square-o"></i> Edit</a>
            <a class="btn btn-danger btn-xs" href="{{ url.get(['for': 'delete-page', 'id': item.getId()]) }}"><i class="fa fa-trash"></i> Delete</a>
        </td>
    </tr>
{% endfor %}