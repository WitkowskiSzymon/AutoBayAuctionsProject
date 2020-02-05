<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Dodaj aukcje</title>
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
                    <a class="nav-link" href="/contact"><h4>Kontakt </h4></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/auction/all"><h4>Lista aukcji</h4></a>
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

    <%--    <label for="usernameId">Login:</label>--%>
    <%--    <form:input type="text" path="userName" id="usernameId" class="form-control"/>--%>
    <%--    <form:errors path="userName" element="div" cssClass="error"/>--%>

    <div class="container">
        <div><h1>Nowa aukcja</h1></div>
        <div class="row">
            <br><br><br>
            <form:form method="post" enctype="multipart/form-data" modelAttribute="auctionForm">
                <label for="makeId">Marka</label>
                <form:select path="make" id="makeId">
                    <c:forEach items="${make}" var="makeValue">
                        <option value="${makeValue}">
                                ${makeValue}
                        </option>
                    </c:forEach>
                </form:select>

                <br>
                <label for="modelId">Model</label>

                <form:select path="model" id="modelId">
                    <c:forEach items="${model}" var="modelValue">
                        <option value="${modelValue}">
                                ${modelValue}
                        </option>
                    </c:forEach>
                </form:select>

                <br>
                <label for="fuelId">Paliwo</label>
                <form:select path="fuel" id="fuelId">
                    <c:forEach items="${fuel}" var="fuelValue">
                        <option value="${fuelValue}">
                                ${fuelValue}
                        </option>
                    </c:forEach>
                </form:select>
                <form:errors path="fuel" element="div"/>

                <br>
                <spring:bind path="year">
                    <label for="yearId">Rocznik</label>
                    <form:input type="text" path="year" id="yearId"/>
                    <form:errors path="year" element="div" cssClass="error"/>
                </spring:bind>

                <br>

                <spring:bind path="mileage">
                    <label for="mileageId">Przebieg</label>
                    <form:input type="text" path="mileage" id="mileageId"/>
                    <form:errors path="mileage" element="div" cssClass="error"/>
                </spring:bind>

                <br>
                <spring:bind path="price">
                    <label for="priceId">Cena</label>
                    <form:input type="text" path="price" id="priceId"/>
                    <form:errors path="price" element="div" cssClass="error"/>
                </spring:bind>

                <br>
                <spring:bind path="description">
                    <label for="descriptionId">Opis</label>
                    <form:input type="text" path="description" id="descriptionId"/>
                    <form:errors path="description" element="div" cssClass="error"/>
                </spring:bind>

                <br>
                <br>
                <label for="picture">Dodaj zdjecie</label>
                <input type="file" name="file" id="picture"/>
                <br>
                <br>
                <input type="submit" value="Dodaj">
            </form:form>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<%@ include file="../footer.jsp" %>
</html>