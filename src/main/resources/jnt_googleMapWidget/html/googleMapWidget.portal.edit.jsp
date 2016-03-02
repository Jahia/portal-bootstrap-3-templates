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

<template:addResources type="javascript" resources="portal/app/googleMapWidget.js"/>
<template:addResources type="css" resources="commonsWidget.css"/>

<div id="google-map-${currentNode.identifier}" ng-controller="google-map-edit-ctrl"
     ng-init="init('google-map-${currentNode.identifier}')" class="widget-edit">
    <h2>
        <fmt:message key="jnt_googleMapWidget"/>
    </h2>

    <div class="box-1">
        <form name="feed_form" class="form-horizontal">
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label"><fmt:message key="title"/></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="jcr:title" ng-model="map['jcr:title']" />
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label"><fmt:message key="label.height"/></label>
                <div class="col-sm-9">
                    <input type="number" class="form-control" name="j:height" ng-model="map['j:height']" required/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label"><fmt:message key="jnt_googleMapWidget.lat"/></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="j:lat" ng-model="map['j:lat']" required/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label"><fmt:message key="jnt_googleMapWidget.lng"/></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="j:lng" ng-model="map['j:lng']" required/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-sm-9 col-sm-offset-3">
                    <button type="button" class="btn btn-sm btn-default" ng-click="cancel()">
                        <fmt:message key="cancel"/>
                    </button>
                    <button type="button" class="btn btn-sm btn-primary" ng-click="update(map)">
                        <fmt:message key="save"/>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    if (typeof scope == 'undefined') {
        var scope = { };
    }
    scope['google-map-${currentNode.identifier}'] = {};
    scope['google-map-${currentNode.identifier}'].map = {};
    scope['google-map-${currentNode.identifier}'].map['jcr:title'] = '${functions:escapeJavaScript(currentNode.displayableName)}';
    scope['google-map-${currentNode.identifier}'].map['j:height'] = ${currentNode.properties['j:height'].long};
    scope['google-map-${currentNode.identifier}'].map['j:lat'] = ${currentNode.properties['j:lat'].double};
    scope['google-map-${currentNode.identifier}'].map['j:lng'] = ${currentNode.properties['j:lng'].double};

    // Boostrap app
    angular.bootstrap(document.getElementById("google-map-${currentNode.identifier}"),['googleMapWidgetApp']);
</script>