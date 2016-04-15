<div class="well well-sm">
    <div class="well well-sm">
        <a href="{{ url.get() }}page/admin/edit/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-info">
            <i class="fa fa-arrow-left"></i> {{ helper.at('Back') }}
        </a>
    </div>

    <form method="post" class="ui form segment negative message" action="">
        <div class="alert alert-danger">
            <p>{{ helper.at('Remove page') }} <b>{{ model.getTitle() }}</b>?</p>
        </div>

        <div class="well well-sm">
            <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i> {{ helper.at('Delete') }}</button>
        </div>
    </form>

</div>