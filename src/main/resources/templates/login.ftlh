<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Авторизація</h1>
    <hr>
    <form action="/login" method="post">
        <div class="form-group">
            <label for="email">Електронна пошта</label>
            <input type="email" class="form-control <#if RequestParameters?exists && RequestParameters.error?exists>is-invalid</#if>" id="email" name="username">
            <div id="email" class="invalid-feedback">
                Електронна пошта невірна
            </div>
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control <#if RequestParameters?exists && RequestParameters.error?exists>is-invalid</#if>" id="password" name="password">
            <div id="password" class="invalid-feedback">
                Невірний пароль
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Увійти</button>
    </form>
    <hr>
    <h2>Досі не маєте акаунту в нашій крамничці? <a href="/registration">Зареєструйтеся!)</a></h2>
</@t.template>