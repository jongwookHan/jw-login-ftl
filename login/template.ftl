<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
        .header img {
            width: 60px;
            height: 60px;
            margin-left: 36px;
            margin-top: 36px
        }
   </style>
</head>

	<body>
        <#nested "header">
        <div class="header">
            <img src="${url.resourcesPath}/img/jonathan-logo.svg">
        </div>
        <div class="login-content">
            <div class="box">
                <#if displayMessage && message?has_content>
                <div class="alert alert-${message.type}">
                    <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                    <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                    <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                    <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                    <span class="message-text">${message.summary?no_esc}</span>
                </div>
                </#if>
                <#nested "form">
            </div> 
        </div>
	</body>
</html>
</#macro>
