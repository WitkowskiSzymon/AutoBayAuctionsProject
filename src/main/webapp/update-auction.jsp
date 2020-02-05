<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Aktualizuj aukcję</title>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-blue bg-dark">
        <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
            <div class="login2">
                <a href="/admin" class="login_btn"><i class="fa fa-user"></i><span class="d-none d-lg-inline-block"
                                                                                   style="padding-right: inherit"><h4>Admin</h4></span></a>
            </div>
        </c:if>

        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/"><h4>Strona główna </h4></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/auction/add" style="color: yellow"><h4>Dodaj aukcję </h4></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact"><h4>Kontakt </h4></a>
                </li>
            </ul>
        </div>

        <div class="login">
            <c:if test="${pageContext.request.userPrincipal.name == null}">

            <a href="/login" class="login_btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block"
                                                                               style="padding-right: inherit"><h4>Zaloguj się </h4></span></a>
        </div>
        &nbsp&nbsp
        <div class="signin">
            <a href="/registration" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block">
                <h4>Zarejestruj się</h4></span>
            </a>
        </div>
        </c:if>

        <div class="logout">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <h4 style="color: yellow">Witaj ${pageContext.request.userPrincipal.name}&nbsp<a
                        href="/login?logout" class="signup-btn" onclick="document.forms['logoutForm'].submit()"> Wyloguj
                    się</a>
                </h4>
            </c:if>
        </div>

    </nav>
    <div class="container">

        <form:form method="post" modelAttribute="auction">

            <label for="makeId">Marka</label><br>
            <form:input class="form-control" cssStyle="width: 200px; height: auto" type="text" path="make" id="makeId"
                        readonly="true"/>
            <form:errors path="make" element="div"/>
            <br/>

            <label for="modelId">Model</label><br>
            <form:input class="form-control" cssStyle="width: 200px; height: auto" type="text" path="model" id="modelId"
                        readonly="true"/>
            <form:errors path="model" element="div"/>
            <br>

            <label for="yearId">Rocznik</label><br>
            <form:input class="form-control" cssStyle="width: 200px; height: auto" type="text" path="year" id="yearId"
                        readonly="true"/>
            <form:errors path="year" element="div"/>
            <br>

            <label for="mileageId">Przebieg</label><br>
            <form:input class="form-control" cssStyle="width: 200px; height: auto" type="text" path="mileage"
                        id="mileageId" readonly="true"/>
            <form:errors path="mileage" element="div"/>
            <br>

            <spring:bind path="price">
                <label for="priceId" style="color: darkcyan">Cena</label><br>
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" maxlength="10" placeholder="format 35000.00"
                                cssStyle="width: 100px; height: auto" path="price" id="priceId"
                                class="form-control"></form:input>
                    <form:errors path="price" element="div"></form:errors>
                </div>
            </spring:bind>
            <br>
            <spring:bind path="description">
                <label for="descriptionId" style="color: darkcyan">Opis</label><br>
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:textarea class="form-control" path="description" id="descriptionId" rows="1"
                                   cssStyle="width: 200px; height: auto"></form:textarea>
                    <form:errors path="description" element="div" cssClass="error"></form:errors>
                </div>
            </spring:bind>
            <br>
            <br>
            <input class="btn btn-info" type="submit" value="Zapisz">

            &nbsp&nbsp&nbsp
            <a class="btn btn-info edit" href="/auction/my-auctions">Anuluj</a>
        </form:form>
    </div>
</div>

</body>
<%@ include file="/footer.jsp" %>
</html>