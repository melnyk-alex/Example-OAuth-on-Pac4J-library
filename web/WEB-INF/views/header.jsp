<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: human
  Date: 6/2/16
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <a href="/" class="navbar-brand">
                <i class="fa fa-eraser"></i> CodeFireUA
            </a>
        </div>

        <div class="navbar-left">
            <ul class="nav navbar-nav">
                <li><a href="/index">Index</a></li>
                <c:if test="${not empty profile}">
                    <li><a href="/downloads">Downlaods</a></li>
                </c:if>
            </ul>
        </div>

        <div class="navbar-right">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#" data-toggle="dropdown"><i
                            class="fa fa-user"></i> ${empty profile ? 'Guest' : profile.displayName} <i
                            class="fa fa-chevron-down"></i></a>
                    <c:choose>
                        <c:when test="${not empty profile}">
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Actions</li>
                                <li><a href="/profile"><i class="fa fa-user"></i> Profile</a></li>
                                <li class="divider"></li>
                                <li><a href="/logout"><i class="fa fa-sign-out"></i> Sing out</a></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="dropdown-menu">
                                <li><a href="/index"><i class="fa fa-sign-out"></i> Sign in</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>
</header>