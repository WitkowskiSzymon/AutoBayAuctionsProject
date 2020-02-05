<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Aktualizuj aukcje</title>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script>
        function confirmDelete(id) {
            if (confirm("Czy na pewno chcesz usunąć aukcje \"" + id + "\"")) {
                window.location.href = "/auction/delete/" + id;
            }
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-blue bg-dark">
        <c:if test="${pageContext.request.isUserInRole('ADMIN')}">
            <div class="login2">
                <a href="/admin" class="login_btn"><i class="fa fa-user"></i><span class="d-none d-lg-inline-block"
                                                                                   style="padding-right: inherit"><h4>Admin</h4></span></a>
            </div>
        </c:if>

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
            </ul>
        </div>

        <div class="login">
            <c:if test="${pageContext.request.userPrincipal.name == null}">

            <a href="/login" class="login_btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block"
                                                                               style="padding-right: inherit"><h4>Zaloguj sie </h4></span></a>
        </div>
        &nbsp&nbsp
        <div class="signin">
            <a href="/registration" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block"><h4>Zarejestruj sie</h4></span></a>
        </div>
        </c:if>

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

        <form:form method="post" modelAttribute="auction">

            <label for="makeId">Marka</label>
            <form:input type="text" path="make" id="makeId" readonly="true"/>
            <form:errors path="make" element="div"/>
            <br/>

            <label for="modelId">Model</label>
            <form:input type="text" path="model" id="modelId" readonly="true"/>
            <form:errors path="model" element="div"/>
            <br>

            <label for="priceId">Cena</label>
            <form:input type="text" path="price" id="priceId"/>
            <form:errors path="price" element="div"/>
            <br>
            <label for="mileageId">Przebieg</label>
            <form:input type="text" path="mileage" id="mileageId" readonly="true"/>
            <form:errors path="mileage" element="div"/>

            <%--            <br>--%>
            <%--            <label for="mileageId">Opis</label>--%>
            <%--            <form:input type="text" path="mileage" id="mileageId"/>--%>
            <%--            <form:errors path="mileage" element="div"/>--%>

            <br>
            <br>
            <input type="submit" value="zapisz">
        </form:form>
    </div>
</div>

</body>
<%@ include file="../footer.jsp" %>
</html>