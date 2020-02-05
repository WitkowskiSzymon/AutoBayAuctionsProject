<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Admin</title>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-blue bg-dark">

        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/"><h4>Strona glowna </h4></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="auction/add" style="color: yellow"><h4>Dodaj aukcje </h4></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact"><h4>Kontakt </h4></a>
                </li>
                <li class="nav-item">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <a class="nav-link" href="/auction/all"><h4>Lista aukcji</h4></a>
                    </c:if>
                </li>
            </ul>
        </div>

        <div class="logout">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <h4 style="color: yellow">Witaj ${pageContext.request.userPrincipal.name}&nbsp<a
                        href="/login?logout" class="signup-btn" onclick="document.forms['logoutForm'].submit()"> Wyloguj
                    sie</a>
                </h4>
            </c:if>
        </div>
    </nav>
    <div class="container">
        <div>
            <h1>Admin</h1>
        </div>
        <br><br><br>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<%@ include file="../footer.jsp" %>
</html>
