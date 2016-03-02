<%@ page import="org.jahia.modules.portal.PortalConstants" %>
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
<%--@elvariable id="skin" type="org.jahia.services.render.View"--%>

<c:set var="portalTabNT" value="<%= PortalConstants.JNT_PORTAL_TAB %>"/>
<c:set var="portalTabNode" value="${jcr:getParentOfType(currentNode, portalTabNT)}"/>

<template:addResources type="javascript" resources="portal/app/bookmarksWidget.js" />
<template:addResources type="css" resources="commonsWidget.css"/>

<div class="widget-edit" id="bookmarks-${currentNode.identifier}" ng-controller="bookmarks-edit-ctrl"
         ng-init="init('bookmarks-${currentNode.identifier}')">
    <h2>
        <fmt:message key="jnt_bookmarksWidget"/>
    </h2>

    <div class="box-1">
        <form name="bookarm_form" class="form-horizontal">
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="title"/>
                </label>
                <input class="form-control" type="text" name="jcr:title" ng-model="bookmark['jcr:title']" />
            </div>

            <div class="form-group form-group-sm">
                <label>
                    <span><fmt:message key="jnt_googleFeedWidget.nbEntries"/></span>
                </label>
                <input class="form-control" type="number" name="numberOfBookmarksPerPage" ng-model="bookmark.numberOfBookmarksPerPage" required />
            </div>

            <div class="form-group form-group-sm">
                <button type="button" class="btn btn-sm btn-default" ng-click="cancel()"><fmt:message key="cancel"/></button>
                <button type="button" class="btn btn-sm btn-primary" ng-disabled="bookarm_form.$invalid" ng-click="update()">
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
    scope['bookmarks-${currentNode.identifier}'] = {};
    scope['bookmarks-${currentNode.identifier}'].bookmark = {};
    scope['bookmarks-${currentNode.identifier}'].bookmark['jcr:title'] = '${functions:escapeJavaScript(currentNode.displayableName)}';
    scope['bookmarks-${currentNode.identifier}'].bookmark.numberOfBookmarksPerPage = ${currentNode.properties['numberOfBookmarksPerPage'].long};

    // Boostrap app
    $(document).ready(function(){
        angular.bootstrap(document.getElementById("bookmarks-${currentNode.identifier}"), ['bookmarksWidgetApp']);
    });
</script>