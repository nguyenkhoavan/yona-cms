{%- macro parse_tags(tags) %}
    {% if tags is defined and tags is not false%}
        {% for tag in tags %}
            <a href="#" class="btn btn-info btn-xs">#{{ tag }}</a>
        {% endfor %}
    {% endif %}
{%- endmacro %}

<div class="well well-sm">
    <a href="{{ url.get(['for': 'add-widget']) }}" class="btn btn-primary">
        <i class="fa fa-plus"></i> {{ helper.at('Add New') }}
    </a>
</div>

<table class="table table-hover table-bordered table-striped widget">
    <thead>
    <tr>
        <th style="width:150px">{{ helper.at('ID') }}</th>
        <th style="width: 200px">{{ helper.at('Title') }}</th>
        <th>{{ helper.at('HTML') }}</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    {% for item in entries %}
        {% set link = url.get(['for': 'edit-widget', 'id': item.getId() ]) %}
        <tr>
            <td><a href="{{ link }}">{{ item.getId() }}</a></td>
            <td><a href="{{ link }}">{{ item.getTitle() }}</a></td>
            <td><textarea>{{ item.getHtml() }}</textarea></td>
            <td width="130px">
                <a class="btn btn-primary btn-xs" href="{{ link }}"><i class="fa fa-pencil-square-o"></i> Edit</a>
                <a class="btn btn-danger btn-xs" href="{{ url.get(['for': 'delete-widget', 'id': item.getId()]) }}"><i class="fa fa-trash"></i> Delete</a>
            </td>
        </tr>
    {% endfor %}
    </tbody>
</table>

<link rel="stylesheet" href="{{ url.get() }}vendor/codemirror-4.2/lib/codemirror.css">
<script src="{{ url.get() }}vendor/codemirror-4.2/codemirror-compressed.js"></script>

<script>
    $(function () {
        CodeMirror.fromTextArea(document.querySelector('textarea'), {
            lineNumbers: true,               // show line number
            matchBrackets: true,             // causes matching brackets to be highlighted whenever the cursor is next to them
            mode: "htmlmixed", // automatically load the modes that the mixed HTML mode depends on (XML, JavaScript, and CSS)
            indentUnit: 4,                    // How many spaces a block (whatever that means in the edited language) should be indented
            viewportMargin: Infinity,
            readOnly: true
        });
    });
</script>