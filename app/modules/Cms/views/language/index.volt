<!--controls-->
<div class="well well-sm">

    <a href="{{ url.get() }}cms/language/add" class="btn btn-primary">
        <i class="fa fa-plus"></i> Add New
    </a>

</div>
<!--/end controls-->

<table class="table table-hover table-bordered table-striped very compact celled">
    <thead>
    <tr>
        <th>Name</th>
        <th>Code</th>
        <th>ISO</th>
        <th>Locale</th>
        <th>URL</th>
        <th>Sort order</th>
        <th>Main</th>
    </tr>
    </thead>
    <tbody>
    {% for item in entries %}
        <tr>
            <td><a href="{{ url.get() }}cms/language/edit/{{ item.getId() }}">{{ item.getName() }}</a></td>
            <td>{{ item.getShort_name() }}</td>
            <td>{{ item.getIso() }}</td>
            <td>{{ item.getLocale() }}</td>

            {% set url = url.get() %}
            {% if item.getUrl() and not item.getPrimary() %}{% set url = url.get() ~ item.getUrl() ~ '/' %}{% endif %}
            <td><a href="{{ url }}" target="_blank">{{ url }}</a></td>
            <td>{{ item.getSortorder() }}</td>
            <td>{% if item.getPrimary() %}<i class="fa fa-plus"></i>{% endif %}</td>
        </tr>
    {% endfor %}
    </tbody>
</table>