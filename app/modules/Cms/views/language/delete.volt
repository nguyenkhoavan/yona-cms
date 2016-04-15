<div class="well well-sm">
    <a href="{{ url.get() }}cms/language/edit/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-info">
        <i class="fa fa-arrow-left"></i> Back
    </a>

    <form method="post" class="ui negative message form" action="">
        <p>Delete language <b>{{ model.getName() }} - {{ model.getIso() }}</b>?</p>
        <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</button>
    </form>

</div>