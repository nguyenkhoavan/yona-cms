<!--controls-->
<div class="well well-sm">
    <a href="{{ url.get() }}page/admin/add" class="btn btn-primary">
        <i class="fa fa-plus"></i> Add New
    </a>
</div>
<!--/end controls-->

<div class="table-responsive">
    <table class="table table-hover table-bordered table-striped" data-widget="tree-grid">
        <thead>
        <tr>
            <th>Title</th>
            <th>Cover</th>
            <th>Thumbnail</th>
            <th width="400">Short Content</th>
            <th>Url</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        {{ helper.modulePartial('admin/_partials/grid', ['entries': entries], 'page') }}
        </tbody>
    </table>
</div>
