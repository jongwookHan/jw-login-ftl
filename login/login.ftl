<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>
    <#elseif section = "form">
        <div class="box-container">
            <div class="login-header">
                <span class="login-title">Login</span>
                <p>안녕하세요. Jonathan입니다.<br/>서비스 이용을 위해 가입하신 이메일 주소로 로그인해 주세요.</p>
            </div>
        <#if realm.password>
            <div>
               <form id="kc-form-login" class="form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="input-container">
                        <i class="fa fa-envelope-o icon"></i>
                        <input id="username" class="input-field login-field" type="text" placeholder="이메일 주소" name="username" tabindex="1">
                    </div>
                    <#--  <div>
                        <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                    </div>  -->
                    <div class="input-container">
                        <i class="fa fa-lock icon"></i>
                        <input id="password" class="input-field login-field" type="password" placeholder="비밀번호" name="password" tabindex="2">
                    </div>
                    <p class="err-msg">아이디 및 비밀번호가 일치하지 않습니다.</p>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="">
                        <label class="form-check-label" for="inlineCheckbox1">로그인 상태 유지</label>
                    </div>
                    <input class="submit" type="submit" value="로그인" tabindex="3">
                    <div class="button-container">
                        <a class="link-button"><span class="link-button-inner">가입하기</span></a> | 
                        <a class="link-button"><span class="link-button-inner">아이디 찾기</span></a> | 
                        <a class="link-button"><span class="link-button-inner">비밀번호 찾기</span></a>
                    </div>
                </form>
            </div>
        </#if>
        <#if social.providers??>
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>
        <div>
            <p class="copyright">&copy; © 2020 Acryl inc. All rights reserved.</p>
        </div>
    </#if>
</@layout.registrationLayout>
