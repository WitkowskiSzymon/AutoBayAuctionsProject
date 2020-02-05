<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Zaloguj się</title>

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
                    <a class="nav-link" href="/"><h4>Strona główna</h4></a>
                </li>
            </ul>
        </div>

    </nav>

    <div class="container">
        <form method="POST" action="${contextPath}/login" class="form-signin">
            <span><h3 style="text-align: center">${message}</h3></span>
            &nbsp
            <div class="form-group ${error != null ? 'has-error' : ''}">
                <input name="username" type="text" class="form-control" placeholder="Login"
                       autofocus="true"/>
                <input name="password" type="password" class="form-control" placeholder="Hasło"/>
                <span><h2>${error}</h2></span>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <button class="btn btn-lg btn-primary btn-block" type="submit"><h3>Zaloguj</h3></button>
                <br><h4 class="text-center"><a href="/registration">Utwórz konto</a></h4>
            </div>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<%@ include file="/footer.jsp" %>

</html>
