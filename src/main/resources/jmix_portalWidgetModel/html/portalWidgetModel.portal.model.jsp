<%@ page import="org.jahia.modules.portal.PortalConstants" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<template:addResources type="css" resources="portal-widget-model.css"/>
<template:addResources type="javascript" resources="portal/app/portalWidgetModelCtrl.js"/>

<div class="widget-model">
    <h2>
        Widget model properties: ${currentNode.displayableName}
    </h2>

    <div class="box-1">
        <div class="alert alert-success model-saved-message" style="display: none">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <fmt:message key="portalWidgetModel.saved.success"/>
        </div>

        <form action="#" method="POST" class="widgetModelForm">
            <div class="row">
                <div class="col-md-12">
                    <label>
                        <span><fmt:message key="portalWidgetModel.behavior"/>:</span>
                        <select name="j:behavior">
                            <option value="copy"
                                    <c:if test="${currentNode.properties['j:behavior'].string eq 'copy'}">selected="selected"</c:if>>
                                <fmt:message key="portalWidgetModel.behavior.copy"/>
                            </option>
                            <option value="ref"
                                    <c:if test="${currentNode.properties['j:behavior'].string eq 'ref'}">selected="selected"</c:if>>
                                <fmt:message key="portalWidgetModel.behavior.ref"/>
                            </option>
                        </select>
                    </label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <button class="btn btn-sm btn-default cancel"><fmt:message key="cancel"/></button>
                    <button class="btn btn-sm btn-primary submit"><fmt:message key="save"/></button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    // skin javascript controller
    $(document).ready(function(){
        new Jahia.Portal.WidgetModelCtrl("${currentNode.identifier}");
    });
</script>