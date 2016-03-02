<%@ page import="org.jahia.modules.portal.PortalConstants" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="skin" type="org.jahia.services.render.View"--%>
<%--@elvariable id="portalContext" type="org.jahia.modules.portal.service.bean.PortalContext"--%>

<c:set var="portalTabNT" value="<%= PortalConstants.JNT_PORTAL_TAB %>"/>
<c:set var="portalMix" value="<%= PortalConstants.JMIX_PORTAL %>"/>
<c:set var="portalWidgetMix" value="<%= PortalConstants.JMIX_PORTAL_WIDGET %>"/>
<c:set var="widgetSkinProp" value="<%= PortalConstants.J_WIDGET_SKIN %>"/>
<c:set var="portalTabNode" value="${jcr:getParentOfType(currentNode, portalTabNT)}"/>
<c:set var="portalNode" value="${jcr:getParentOfType(currentNode, portalMix)}"/>
<c:set var="currentWidgetSkin" value="${currentNode.properties[widgetSkinProp].string}"/>

<template:addResources type="css" resources="commonsWidget.css"/>

<div class="widget-edit">
    <h2>
        Edit: ${currentNode.displayableName}
    </h2>

    <div class="box-1">
        <form action="<c:url value="${url.base}${currentNode.path}"/>" method="POST" class="form-horizontal">
            <input type="hidden" name="jcrRedirectTo" value="<c:url value="${url.base}${portalTabNode.path}"/>">
            <input type="hidden" name="jcrNodeType" value="${currentNode.primaryNodeTypeName}"/>
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label"><fmt:message key="title"/></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="jcr:title" value="<c:out value="${currentNode.displayableName}"/>"/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <label class="col-sm-3 control-label">portlet</label>
                <div class="col-sm-9">
                    <input type="hidden" id="${currentNode.identifier}_node" name="j:node" value="${not empty currentNode.properties['j:node'] ? currentNode.properties['j:node'].node.identifier : ''}"/>
                    <input type="text" class="form-control" id="${currentNode.identifier}_nodeDecoy" readonly="readonly" value="${not empty currentNode.properties['j:node'] ? currentNode.properties['j:node'].node.displayableName : ''}"/>
                    <ui:treeItemSelector fieldId="${currentNode.identifier}_node"
                                         displayFieldId="${currentNode.identifier}_nodeDecoy"
                                         root="${renderContext.site.path}/portlets"
                                         displayIncludeChildren="false"
                                         selectableNodeTypes="jnt:portlet"
                                         includeChildren="true"
                                         valueType="identifier"/>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-sm-9 col-sm-offset-3">
                    <button class="btn btn-sm btn-primary" type="submit">
                        <fmt:message key="save"/>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>