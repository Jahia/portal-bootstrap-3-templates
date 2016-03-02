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

<template:addResources type="javascript" resources="portal/app/googleFeedWidget.js"/>
<template:addResources type="css" resources="commonsWidget.css"/>

<div id="google-feed-${currentNode.identifier}" ng-controller="google-feed-edit-ctrl"
     ng-init="init('google-feed-${currentNode.identifier}')" class="widget-edit">
    <h2>
        <fmt:message key="jnt_googleFeedWidget"/>
    </h2>

    <div class="box-1">
        <form name="feed_form">
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="title"/>
                </label>
                <input class="form-control" type="text" name="jcr:title" ng-model="feed['jcr:title']" />
            </div>

            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_googleFeedWidget.url"/>
                </label>
                <input class="form-control" type="text" name="url" ng-model="feed.url" required/>
            </div>

            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="jnt_googleFeedWidget.nbEntries"/>
                </label>
                <input class="form-control" type="number" name="nbEntries" ng-model="feed.nbEntries" />
            </div>

            <div class="form-group form-group-sm">
                <button type="button" class="btn btn-sm btn-default" ng-click="cancel()"><fmt:message key="cancel"/></button>
                <button type="button" class="btn btn-sm btn-primary" ng-click="update(feed)">
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
    scope['google-feed-${currentNode.identifier}'] = {};
    scope['google-feed-${currentNode.identifier}'].feed = {};
    scope['google-feed-${currentNode.identifier}'].feed['jcr:title'] = '${functions:escapeJavaScript(currentNode.displayableName)}';
    scope['google-feed-${currentNode.identifier}'].feed.url = '${functions:escapeJavaScript(currentNode.properties['url'].string)}';
    scope['google-feed-${currentNode.identifier}'].feed.nbEntries = ${currentNode.properties['nbEntries'].long};

    // Boostrap app
    angular.bootstrap(document.getElementById("google-feed-${currentNode.identifier}"), ['googleFeedWidgetApp']);
</script>
