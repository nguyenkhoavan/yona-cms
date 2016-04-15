{# Created by PhpStorm #}
{# User: @VanNguyen: nguyenkhoavan@outlook.com #}
{# Date: 3/5/2016 #}
{# Time: 8:07 PM #}

<!--controls-->
<div class="well well-sm">

    <a href="{{ url.get() }}page/admin?lang={{ constant('LANG') }}" class="btn btn-info">
        <i class="fa fa-arrow-left"></i> {{ helper.at('Back') }}
    </a>

    <button type="submit" class="btn btn-primary">
        <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
    </button>

    {% if model.getId() %}

        <a href="{{ url.get() }}page/admin/delete/{{ model.getId() }}?lang={{ constant('LANG') }}"
           class="btn btn-danger">
            <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
        </a>

        {% if model.getId() %}
            <a class="btn btn-info" target="_blank"
               href="{{ helper.langUrl(['for':'page','slug':model.getSlug(), 'id': model.getId()]) }}">
                <i class="fa fa-globe"></i> {{ helper.at('View Online') }}
            </a>
        {% endif %}

        {#<a class="ui blue button" target="_blank"#}
        {#href="{{ model.getUrl() }}">#}
        {#{{ helper.at('View Online 2nd') }}#}
        {#</a>#}

        {#<a href="{{ url.get() }}page/admin/add" class="btn btn-primary pull-right">#}
            {#<i class="fa fa-plus"></i> Add New#}
        {#</a>#}
    {% endif %}

</div>
<!--end controls-->