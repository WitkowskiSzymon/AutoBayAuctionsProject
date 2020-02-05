<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Kontakt</title>
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
                        <a class="nav-link" href="/auction/add" style="color: yellow"><h4>Dodaj aukcje </h4></a>
                    </c:if>
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

        <div>
            <h1>Skontaktuj sie</h1>
        </div>
        <br><br><br>

        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4996.60819775503!2d22.63151465383085!3d51.23189412203473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x472256eae4754c1d%3A0x2d866284218a02f4!2sO%C5%9Brodek+Doskonalenia+Techniki+Jazdy+WORD+w+Lublinie!5e0!3m2!1spl!2spl!4v1547567206607"
                width="600" height="450" frameborder="0" style="float: inherit" allowfullscreen></iframe>
        <div class="col-md-4" style="float: right">
            <h5>Informacje</h5>
            <dl class="contact-list">
                <dt>Organizacja:</dt>
                <dd>AutoBay Auctions Co. Ltd.</dd>
            </dl>
            <dl class="contact-list">
                <dt>Adres:</dt>
                <dd>20-262 Lublin ul. B.Grygowej 30</dd>
            </dl>
            <dl class="contact-list">
                <dt>E-mail:</dt>
                <dd><a href="mailto:szymon_witkowski@tlen.pl">support@autobay.com</a></dd>
            </dl>
            <dl class="contact-list">
                <dt>Telefon:</dt>
                <dd><a href="tel:#">888 987 654</a>
                </dd>
            </dl>
        </div>
    </div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<%@ include file="../footer.jsp" %>
</html>
