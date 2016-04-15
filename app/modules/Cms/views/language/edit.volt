<form method="post" class="ui form" action="" enctype="multipart/form-data">

    <!--controls-->
    <div class="well well-sm">

        <a href="{{ url.get() }}cms/language" class="btn btn-info">
            <i class="fa fa-arrow-left"></i> Back
        </a>

        <button type="submit" class="btn btn-primary">
            <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
        </button>

        {% if model.getId() %}

            <a href="{{ url.get() }}cms/language/delete/{{ model.getId() }}" class="ui button red">
                <i class="fa fa-trash"></i> Delete
            </a>

        {% endif %}

    </div>
    <!--end controls-->

    <div class="well well-sm">
        {{ form.renderDecorated('iso') }}
        {{ form.renderDecorated('locale') }}
        {{ form.renderDecorated('name') }}
        {{ form.renderDecorated('short_name') }}
        {{ form.renderDecorated('url') }}
        {% if model.getId() %}
            {{ form.renderDecorated('sortorder') }}
            {{ form.renderDecorated('primary') }}
        {% endif %}
    </div>

</form>

<!--ui semantic-->
<script>
    $('.ui.form').form({
        fields: {
            iso: {
                identifier: 'iso',
                rules: [
                    {type: 'empty'}
                ]
            },
            locale: {
                identifier: 'locale',
                rules: [
                    {type: 'empty'}
                ]
            },
            name: {
                identifier: 'name',
                rules: [
                    {type: 'empty'}
                ]
            },
            short_name: {
                identifier: 'short_name',
                rules: [
                    {type: 'empty'}
                ]
            },
            url: {
                identifier: 'url',
                rules: [
                    {type: 'empty'}
                ]
            }
        }
    });
</script><!--/end ui semantic-->