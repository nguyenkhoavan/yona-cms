<!--controls-->
<div class="well well-sm">

    <a href="{{ url.get() }}admin/admin-user/add" class="btn btn-primary">
        <i class="fa fa-plus"></i> {{ helper.at('Add New') }}
    </a>

</div>
<!--/end controls-->

<table class="table table-hover table-bordered table-striped very compact celled">
    <thead>
    <tr>
        <th style="width: 100px"></th>
        <th>{{ helper.at('Login') }}</th>
        <th>{{ helper.at('Email') }}</th>
        <th>{{ helper.at('Name') }}</th>
        <th>{{ helper.at('Role') }}</th>
        <th>{{ helper.at('Active') }}</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    {% for user in entries %}
        <tr>
            {% set url = url.get() ~ 'admin/admin-user/edit/' ~ user.getId() %}
            <td><a href="{{ url }}" class="mini ui icon button"><i class="pencil icon"></i></a></td>
            <td><a href="{{ url }}">{{ user.getLogin() }}</a></td>
            <td>{{ user.getEmail() }}</td>
            <td>{{ user.getName() }}</td>
            <td>{{ user.getRoleTitle() }}</td>
            <td>{% if user.getActive() %}<i class="icon checkmark green"></i>{% endif %}</td>
            <td>
                <a class="btn btn-primary btn-xs" href="{{ url.get(['for': 'edit-user', 'id': user.getId()]) }}"><i class="fa fa-pencil-square-o"></i> Edit</a>
                <a class="btn btn-danger btn-xs" href="{{ url.get(['for': 'delete-user', 'id': user.getId()]) }}"><i class="fa fa-trash"></i> Delete</a>
            </td>
        </tr>
    {% endfor %}
    </tbody>
</table>