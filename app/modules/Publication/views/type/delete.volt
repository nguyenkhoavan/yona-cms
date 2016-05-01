<div class="well well-sm">
    <a href="{{ url.get() }}publication/type/edit/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-info">
        <i class="fa fa-arrow-left"></i> Back
    </a>
</div>

<form method="post" class="ui negative message form" action="">
    <div class="alert alert-danger">
        <p>Delete Category: <b>{{ model.getTitle() }}</b>?</p>
    </div>
    <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</button>
</form>