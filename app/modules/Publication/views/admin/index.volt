<!--controls-->
<div class="well well-sm">
    <a href="{{ url.get() }}publication/type" class="btn btn-info">
        <i class="fa fa-list-ol"></i> {{ helper.at('Categories Manager') }}
    </a>
</div>
<!--/end controls-->

{% set languages = helper.languages() %}
{% if languages|length > 1 %}
    <ul class="nav nav-tabs" role="tablist">
        {% for type_el in types %}
            <li role="presentation" class="{% if type_el.getId() == type_id %} active{% endif %}">
                <a href="{{ url(['for':'publications_admin','type':type_el.getSlug()]) }}?lang={{ constant('LANG') }}">
                    {{ type_el.getTitle() }}
                </a>
            </li>
        {% endfor %}
    </ul>
{% endif %}

<div class="well well-sm">
    <a href="{{ url.get(['for': 'add-publication', 'type': type]) }}" class="btn btn-primary">
        <i class="fa fa-plus"></i> {{ helper.at('New ' ~ type) }}
    </a>
</div>

{% if paginate.total_items > 0 %}
    <div class="table-responsive">
        <table class="table table-hover table-bordered table-striped">
            <thead>
            <tr>
                <th width="100"></th>
                <th width="300">{{ helper.at('Title') }}</th>
                <th width="50">{{ helper.at('Cover') }}</th>
                <th style="width: 50px;">{{ helper.at('Thumbnail') }}</th>
                <th>{{ helper.at('Thumbs Inside') }}</th>
                <th width="150">{{ helper.at('Publication Date') }}</th>
                <th>{{ helper.at('Url') }}</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            {% for item in paginate.items %}
                {% set link = url.get(['for': 'edit-publication', 'id': item.getId(), 'type': item.getTypeSlug()]) %}
                {% set cover = helper.image(['id': item.getId(),'type':item.getImgFolder('cover_photo'),'width':100], ['title': item.getTitle()]) %}
                {% set image = helper.image(['id': item.getId(),'type':item.getImgFolder('preview_src'),'width':100], ['title': item.getTitle()]) %}
                <tr data-widget="magnific-popup">
                    <td>
                        <a title="test" href="{{ link }}?lang={{ constant('LANG') }}" class="btn btn-primary btn-sm"><i class="fa fa-pencil-square-o"></i> id = {{ item.getId() }}</a>
                    </td>
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
                    <td align="center">
                        {% if item.getPreview_Inner() %}<h1><i class="fa fa-check text-success"></i></h1>{% endif %}
                    </td>
                    <td>{{ item.getDate() }}</td>
                    <td>
                        {% set url = helper.langUrl(['for':'publication', 'type':item.getTypeSlug(), 'slug':item.getSlug()]) %}
                        <a href="{{ url }}" target="_blank">{{ url }}</a>
                    </td>
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ url.get(['for': 'edit-publication', 'id': item.getId(), 'type_id': type_id]) }}"><i class="fa fa-pencil-square-o"></i> Edit</a>
                        <a class="btn btn-danger btn-xs" href="{{ url.get(['for': 'delete-publication', 'id': item.getId()]) }}"><i class="fa fa-trash"></i> Delete</a>
                    </td>
                </tr>
            {% endfor %}
            </tbody>
        </table>
    </div>
{% else %}
    <p>{{ helper.at('Entries not found') }}</p>
{% endif %}

{% if paginate.total_pages > 1 %}
    <div class="pagination">
        {{ partial('admin/pagination', ['paginate':paginate] ) }}
    </div>
{% endif %}
