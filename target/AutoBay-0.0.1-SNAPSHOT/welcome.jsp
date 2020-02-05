<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Witaj</title>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <a class="nav-link" href="/auction/add" style="color: yellow "><h4>Dodaj aukcje </h4></a>
                    </c:if>
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

        <div class="login">
            <c:if test="${pageContext.request.userPrincipal.name == null}">

            <a href="/login" class="login_btn"><i class="fa fa-user"></i>
                <span class="d-none d-md-inline-block" style="padding-right: inherit"><h4>Zaloguj sie</h4></span>
            </a>
        </div>
        &nbsp&nbsp
        <div class="signin">
            <a href="/registration" class="signup-btn"><i class="fa fa-user"></i>
                <span class="d-none d-md-inline-block"><h4>Zarejestruj sie</h4></span>
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
                    sie</a>
                </h4>
            </c:if>
        </div>
    </nav>

    <div class="container">

        <h1>AutoBay</h1>

        <br><br><br>
        <div class="row">
            <br><br><br>

            <div class="col-sm-4">
                <a><h2>Szukaj pojazdu</h2></a><br><br>
                <form:form method="post" action="find">
                    <fieldset>
                        <label>Marka
                            <select name="make">
                                <option selected="selected"> -- Wybierz marke --</option>
                                <c:forEach items="${make}" var="makeValue">
                                    <option value="${makeValue}">
                                            ${makeValue}
                                    </option>
                                </c:forEach>
                            </select>
                        </label>
                        <label>Model
                            <select name="model">
                                <option selected="selected"> -- Wybierz model --</option>
                                <c:forEach items="${model}" var="modelValue">
                                    <option value="${modelValue}">
                                            ${modelValue}
                                    </option>
                                </c:forEach>
                            </select>
                        </label>
                        <label>Rodzaj paliwa
                            <select name="fuel">
                                <option selected="selected"> -- Wybierz paliwo --</option>
                                <c:forEach items="${fuel}" var="fuelType">
                                    <option value="${fuelType}">
                                            ${fuelType}
                                    </option>
                                </c:forEach>
                            </select>
                        </label>
                        <br><br><input type="submit" value="Szukaj">
                    </fieldset>
                </form:form>
            </div>

            <div class="col-sm-8">
                <h2>Dostepne aukcje</h2>

                <table border="1px" style="position: center">
                    <thead>
                    <tr class="row-name">
                        <th>Marka</th>
                        <th>Model</th>
                        <th>Cena</th>
                        <th>Przebieg</th>
                        <th>Paliwo</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="row-content">
                        <c:forEach var="auction" items="${auctions}">
                    <tr>
                        <td>${auction.make}</td>
                        <td>${auction.model}</td>
                        <td>${auction.price}</td>
                        <td>${auction.mileage}</td>
                        <td>${auction.fuel}</td>
                        &nbsp
                        <td>
                            <a class="btn btn-info edit" href="/show/${auction.id}">Otworz
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </a>
                        </td>

                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<%@ include file="../footer.jsp" %>
</html>


