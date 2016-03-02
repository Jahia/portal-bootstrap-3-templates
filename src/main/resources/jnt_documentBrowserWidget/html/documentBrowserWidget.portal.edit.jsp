<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib"%>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="javascript" resources="portal/app/documentBrowserWidget.js" />
<template:addResources type="css" resources="commonsWidget.css"/>
<template:addResources type="css" resources="docBrowserWidget.css"/>

<div class="docBrowserWidget widget-edit" id="document-browser-${currentNode.identifier}" ng-controller="document-browser-edit-ctrl"
     ng-init="init('document-browser-${currentNode.identifier}'
     , '<c:url value="${url.base}${currentNode.path}"/>')">

    <h2><fmt:message key="jnt_documentBrowserWidget.portal.edit.title"/></h2>

    <div class="box-1">
        <form name="feed_form">
            <div class="form-group form-group-sm">
                <label>
                    <fmt:message key="title"/>
                </label>
                <input class="form-control" type="text" name="jcr:title" ng-model="doc['jcr:title']" />
            </div>

            <div class="form-group form-group-sm">
                <label>
                    Root path
                </label>
                <input class="form-control" type="text" name="rootPath" ng-model="doc.rootPath" id="rootPath_${currentNode.identifier}" />
            </div>

            <div class="form-group form-group-sm">
                <script type="text/ng-template" id="treeItem.html">
                    <span ng-click="load(item)" ng-class="isSelected(item) ? 'selected' : ''"><i ng-class="getIcon(item)"></i> {{item.title}}</span>
                    <a ng-if="isFile(item)" href="{{item.url}}" download><i class="icon-download-alt"></i>download</a>

                    <ul ng-show="item.displayed">
                        <li ng-repeat="item in item.childs" ng-include="'treeItem.html'" class="parent_li">
                        </li>
                    </ul>
                </script>

                <div class="tree well">
                    <ul>
                        <li class="parent_li">
                            <span ng-click="load(root)"><i ng-class="getIcon(root)"></i> {{root.title}}</span>
                            <ul ng-show="root.displayed">
                                <li ng-repeat="item in root.childs" ng-include="'treeItem.html'" class="parent_li">

                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
			</div>

            <div class="form-group form-group-sm">
                <button type="button" class="btn btn-sm btn-default" ng-click="cancel()"><fmt:message key="cancel"/></button>
                <button type="button" class="btn btn-sm btn-primary" ng-click="update()">
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
    scope['document-browser-${currentNode.identifier}'] = {};
    scope['document-browser-${currentNode.identifier}'].doc = {};
    scope['document-browser-${currentNode.identifier}'].doc['jcr:title'] = '${functions:escapeJavaScript(currentNode.displayableName)}';
    scope['document-browser-${currentNode.identifier}'].doc.rootPath = '${functions:escapeJavaScript(currentNode.properties['rootPath'].string)}';

    // Boostrap app
    angular.bootstrap(document.getElementById("document-browser-${currentNode.identifier}"), ['documentBrowserWidgetApp']);
</script>