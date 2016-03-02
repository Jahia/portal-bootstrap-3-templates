<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="javascript" resources="portal/vendor/angular-bootstrap-colorpicker.js"/>
<template:addResources type="javascript" resources="portal/app/twitterWidget.js"/>
<template:addResources type="css" resources="twitterWidget.css"/>
<template:addResources type="css" resources="commonsWidget.css"/>
<template:addResources type="css" resources="colorpicker.css"/>

<c:set var="properties" value="${currentNode.properties}"/>

<div id="twitter-widget-${currentNode.identifier}" ng-controller="twitter-edit-ctrl"
     ng-init="init('twitter-widget-${currentNode.identifier}')" class="widget-edit">

    <h2>
        <fmt:message key="jnt_twitterWidget"/>
        <a onclick="return false;" data-placement="right" data-toggle="tooltip"
           title="<fmt:message key="jnt_twitterWidget_description"/>">
            <i class="glyphicon glyphicon-info-sign"></i>
        </a>
    </h2>
    
    <div class="box-1">
        <form name="twitter_form">
        
            <div class="form-group form-group-sm">
                <label><fmt:message key="title"/></label>
                <input type="text" class="form-control" required name="jcr:title" ng-model="twitter['jcr:title']" />
            </div>

            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.widgetId"/>
                    <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                       title="<fmt:message key="jnt_twitterWidget.widgetId.ui.tooltip"/>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <input type="text" class="form-control" required name="widgetId" ng-model="twitter.widgetId"/>
                <div ng-show="twitter_form.widgetId.$invalid">Invalid:
                    <span ng-show="twitter_form.widgetId.$error.required">Tell us your widgetId.</span>
                </div>
            </div>
            
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.theme"/>
                    <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                       title="<fmt:message key="jnt_twitterWidget.theme.ui.tooltip"/>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <select name="theme" class="form-control">
                    <option value="dark" <c:if test="${properties.theme.string eq 'dark'}">selected="selected"</c:if>>dark</option>
                    <option value="light" <c:if test="${properties.theme.string eq 'light'}">selected="selected"</c:if>>light</option>
                </select>
            </div>
            
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.height"/>
                </label>
                <input type="number" class="form-control" name="height" ng-model="twitter.height" />
            </div>
            
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.linkcolor"/>
                    <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                       title="<fmt:message key="jnt_twitterWidget.linkcolor.ui.tooltip"/>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <input colorpicker type="text" class="form-control" name="linkcolor" ng-model="twitter.linkcolor"/>
            </div>
            
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.bordercolor"/>
                    <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                       title="<fmt:message key="jnt_twitterWidget.bordercolor.ui.tooltip"/>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <input colorpicker type="text" class="form-control" name="bordercolor" ng-model="twitter.bordercolor" />
            </div>
            
            <div class="form-group form-group-sm">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="noheader" ng-model="twitter.noheader" value="true" />
                        <fmt:message key="jnt_twitterWidget.noheader"/>
                        <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                           title="<fmt:message key="jnt_twitterWidget.noheader.ui.tooltip"/>">
                            <i class="glyphicon glyphicon-info-sign"></i>
                        </a>
                    </label>
                </div>
            </div>
            
            <div class="form-group form-group-sm">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="nofooter" ng-model="twitter.nofooter" value="true" />
                        <fmt:message key="jnt_twitterWidget.nofooter"/>
                        <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                           title="<fmt:message key="jnt_twitterWidget.nofooter.ui.tooltip"/>">
                            <i class="glyphicon glyphicon-info-sign"></i>
                        </a>
                    </label>
                </div>
            </div>

            <div class="form-group form-group-sm">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="noborders" ng-model="twitter.noborders" value="true" />
                        <fmt:message key="jnt_twitterWidget.noborders"/>
                        <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                           title="<fmt:message key="jnt_twitterWidget.noborders.ui.tooltip"/>">
                            <i class="glyphicon glyphicon-info-sign"></i>
                        </a>
                    </label>
                </div>
            </div>
            
            <div class="form-group form-group-sm">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="noscrollbar" ng-model="twitter.noscrollbar" value="true" />
                        <fmt:message key="jnt_twitterWidget.noscrollbar"/>
                        <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                           title="<fmt:message key="jnt_twitterWidget.noscrollbar.ui.tooltip"/>">
                            <i class="glyphicon glyphicon-info-sign"></i>
                        </a>
                    </label>
                </div>
            </div>
            
            <div class="form-group form-group-sm">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="transparent" ng-model="twitter.transparent" value="true" />
                        <fmt:message key="jnt_twitterWidget.transparant"/>
                        <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                           title="<fmt:message key="jnt_twitterWidget.transparant.ui.tooltip"/>">
                            <i class="glyphicon glyphicon-info-sign"></i>
                        </a>
                    </label>
                </div>
            </div>
            
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.language"/>
                    <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                       title="<fmt:message key="jnt_twitterWidget.language.ui.tooltip"/>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <input type="text" class="form-control" name="language" ng-model="twitter.language" />
            </div>
            
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.related"/>
                    <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                       title="<fmt:message key="jnt_twitterWidget.related.ui.tooltip"/>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <input type="text" class="form-control" name="related" ng-model="twitter.related" />
            </div>
            
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.tweetlimit"/>
                    <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                       title="<fmt:message key="jnt_twitterWidget.tweetlimit.ui.tooltip"/>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <input type="number" class="form-control" name="tweetlimit" ng-model="twitter.tweetlimit" min="1" max="20"/>
            </div>
            
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_twitterWidget.ariapolite"/>
                    <a href="#" onclick="return false;" data-placement="right" data-toggle="tooltip"
                       title="<fmt:message key="jnt_twitterWidget.ariapolite.ui.tooltip"/>">
                        <i class="glyphicon glyphicon-info-sign"></i>
                    </a>
                </label>
                <select name="ariapolite" class="form-control">
                    <option value="assertive" <c:if test="${properties.ariapolite.string eq 'assertive'}">selected="selected"</c:if>>assertive</option>
                    <option value="polite" <c:if test="${properties.ariapolite.string eq 'polite'}">selected="selected"</c:if>>polite</option>
                </select>
            </div>
            
            <div class="form-group form-group-sm">
                <button type="button" class="btn btn-sm btn-default" ng-click="cancel()"><fmt:message key="cancel"/></button>
                <button type="button" class="btn btn-sm btn-primary" ng-disabled="twitter_form.$invalid" ng-click="update()">
                    <fmt:message key="save"/>
                </button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    if (typeof scope == 'undefined') {
        var scope = { };
    }
    scope['twitter-widget-${currentNode.identifier}'] = {};
    scope['twitter-widget-${currentNode.identifier}'].twitter = {};
    scope['twitter-widget-${currentNode.identifier}'].twitter['jcr:title'] = '${functions:escapeJavaScript(currentNode.displayableName)}';
    <c:if test="${not empty properties.widgetId}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.widgetId = '${functions:escapeJavaScript(properties.widgetId.string)}';
    </c:if>
    <c:if test="${not empty properties.height}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.height = ${properties.height.long}
    </c:if>
    <c:if test="${not empty properties.linkcolor}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.linkcolor = '${functions:escapeJavaScript(properties.linkcolor.string)}'
    </c:if>
    <c:if test="${not empty properties.bordercolor}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.bordercolor = '${functions:escapeJavaScript(properties.bordercolor.string)}'
    </c:if>
    <c:if test="${not empty properties.noheader}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.noheader = ${properties.noheader.boolean}
    </c:if>
    <c:if test="${not empty properties.nofooter}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.nofooter = ${properties.nofooter.boolean}
    </c:if>
    <c:if test="${not empty properties.noborders}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.noborders = ${properties.noborders.boolean}
    </c:if>
    <c:if test="${not empty properties.noscrollbar}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.noscrollbar = ${properties.noscrollbar.boolean}
    </c:if>
    <c:if test="${not empty properties.transparent}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.transparent = ${properties.transparent.boolean}
    </c:if>
    <c:if test="${not empty properties.language}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.language = '${functions:escapeJavaScript(properties.language.string)}'
    </c:if>
    <c:if test="${not empty properties.tweetlimit}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.tweetlimit = ${properties.tweetlimit.long}
    </c:if>
    <c:if test="${not empty properties.related}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.related = '${functions:escapeJavaScript(properties.related.string)}'
    </c:if>

    // Boostrap app
    $(document).ready(function () {
        angular.bootstrap(document.getElementById("twitter-widget-${currentNode.identifier}"), ['twitterWidgetApp']);
    });
</script>
