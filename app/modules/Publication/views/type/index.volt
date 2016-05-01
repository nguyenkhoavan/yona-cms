<!--controls-->
<div class="well well-sm">

    <a href="{{ url.get() }}publication/admin?lang={{ constant('LANG') }}" class="btn btn-info">
        <i class="fa fa-arrow-left"></i> Manage Publications
    </a>

    <a href="{{ url.get() }}publication/type/add" class="btn btn-primary">
        <i class="fa fa-plus"></i> Add New
    </a>

</div>
<!--/end controls-->

<table class="table table-hover table-bordered table-striped very compact celled">
    <thead>
    <tr>
        <th style="width: 100px"></th>
        <th>Title</th>
        <th>URL</th>
        <th>Display Layout</th>
        <th>Thumbnail Inside</th>
    </tr>
    </thead>
    <tbody>
    {% for item in entries %}
        {% set link = url.get() ~ "publication/type/edit/" ~ item.getId() %}
        <tr>
            <td><a href="{{ link }}?lang={{ constant('LANG') }}" class="mini ui icon button"><i class="icon edit"></i>
                    id = {{ item.getId() }}</a></td>
            <td><a href="{{ link }}?lang={{ constant('LANG') }}">{{ item.getTitle() }}</a></td>

            {% set pub_link = helper.langUrl(['for':'publications', 'type': item.getSlug()]) %}
            <td><a href="{{ pub_link }}" target="_blank">{{ pub_link }}</a></td>
            <td>{{ item.getFormatTitle() }}</td>
            <td>{% if item.getDisplay_date() %}<i class="icon checkmark green"></i>{% endif %}</td>
        </tr>
    {% endfor %}
    </tbody>
</table>