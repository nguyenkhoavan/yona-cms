{# Created by PhpStorm #}
{# User: @VanNguyen: nguyenkhoavan@outlook.com #}
{# Date: 3/5/2016 #}
{# Time: 8:07 PM #}

<div class="well well-sm">
    <!--controls-->
    <a href="{{ url.get(['for': 'publications_admin', 'type': type]) }}?lang={{ constant('LANG') }}" class="btn btn-info">
        <i class="fa fa-arrow-left"></i> {{ helper.at('Back') }}
    </a>

    <button type="submit" class="btn btn-primary">
        <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
    </button>

    {% if model.getId() %}

        <a href="{{ url.get() }}publication/admin/delete/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-danger">
            <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
        </a>

        {% if model.getId() %}
            <a class="btn btn-info" target="_blank"
               href="{{ helper.langUrl(['for':'publication','type':model.getTypeSlug(), 'slug':model.getSlug()]) }}">
                {{ helper.at('View Online') }}
            </a>
        {% endif %}

    {% endif %}

</div>
<!--end controls-->