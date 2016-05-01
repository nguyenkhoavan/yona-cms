<form method="post" class="ui form" action="" enctype="multipart/form-data">

    <!--controls-->
    <div class="well well-sm">

        <a href="{{ url.get() }}publication/type?lang={{ constant('LANG') }}" class="btn btn-info">
            <i class="fa fa-arrow-left"></i> Back
        </a>

        <button type="submit" class="btn btn-primary">
            <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
        </button>

        {% if model.getId() %}

            <a href="{{ url.get() }}publication/type/delete/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-danger">
                <i class="fa fa-trash"></i> Delete
            </a>

            {% if model.getId() %}
                <a class="btn btn-info" target="_blank"
                   href="{{ helper.langUrl(['for':'publications','type':model.getSlug()]) }}">
                    See section on site
                </a>
            {% endif %}

        {% endif %}

    </div>
    <!--end controls-->

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    {{ form.renderDecorated('title') }}
                    {#{{ form.renderDecorated('parent_id') }}#}
                    {{ form.renderDecorated('slug') }}
                    <div class="row">
                        <div class="col-sm-6 col-xs-12">
                            {{ form.renderDecorated('limit') }}
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            {{ form.renderDecorated('format') }}
                        </div>
                    </div>
                    {{ form.renderDecorated('display_date') }}
                </div>
                <div class="col-sm-6 col-xs-12">
                    {{ form.renderDecorated('head_title') }}
                    {{ form.renderDecorated('meta_description') }}
                    {{ form.renderDecorated('meta_keywords') }}
                    {{ form.renderDecorated('seo_text') }}
                </div>
            </div>
        </div>
    </div>


</form>

<!--ui semantic-->
<script>
    $('.ui.form').form({
        fields: {
            title: {
                identifier: 'title',
                rules: [
                    {type: 'empty'}
                ]
            },
            slug: {
                identifier: 'slug',
                rules: [
                    {type: 'empty'}
                ]
            }
        }
    });
</script><!--/end ui semantic-->