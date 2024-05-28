<#import "blocks/template.ftlh" as t>
<@t.template user>
    `<h1 style="text-align: center">Панель адміністратора</h1><hr>
    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Email</th>
            <th scope="col">Номер телефону</th>
            <th scope="col">Активність</th>
            <th scope="col">Ролі</th>
            <th scope="col">Бан</th>
            <th scope="col">Редагування</th>
            <th scope="col">Деталі</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.email}</th>
                <th>${user.phoneNumber}</th>
                <th><#if user.active>true<#else>false</#if></th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Бан">
                    </form>
                </th>
                <th><a href="/admin/user/edit/${user.id}">Редагування</a></th>
                <th><a href="/user/${user.id}">Детальна інформація</a></th>
            </tr>
        <#else>
            <h3>Користувачів не знайдено</h3>
        </#list>
    </table>
</@t.template>