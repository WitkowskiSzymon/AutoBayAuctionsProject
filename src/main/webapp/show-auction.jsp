<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Szczegóły aukcji</title>
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
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <a class="nav-link" href="/auction/add" style="color: yellow"><h4>Dodaj aukcję </h4></a>
                    </c:if>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact"><h4>Kontakt </h4></a>
                </li>
                <li class="nav-item">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
                            <a class="nav-link" href="/auction/my-auctions"><h4>Moje aukcje </h4></a>
                        </c:if>
                    </c:if>
                </li>
                <li class="nav-item">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
                            <a class="nav-link" href="/auction/bought-auctions"><h4>Wygrane aukcje</h4></a>
                        </c:if>
                    </c:if>
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
        <h2>Szczegóły aukcji</h2><br>
        <div class="row row-1" style="padding-left:8px">
            <c:if test="${auction.user.username == pageContext.request.userPrincipal.name}">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
                        &nbsp<a class="nav-link" href="/auction/my-auctions"><h4>Wróć</h4></a>
                    </c:if>
                </c:if>
            </c:if>

            <c:if test="${auction.user.username != pageContext.request.userPrincipal.name && auction.auctionFinished != true}">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <c:if test="${!pageContext.request.isUserInRole('ROLE_ADMIN')}">
                        &nbsp<a class="nav-link" href="/"><h4>Wróć</h4></a>
                    </c:if>
                </c:if>
            </c:if>

            <c:if test="${auction.user.username != pageContext.request.userPrincipal.name && auction.auctionFinished == true}">
                <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
                        &nbsp<a class="nav-link" href="/auction/bought-auctions"><h4>Wróć</h4></a>
                </c:if>
            </c:if>

            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                <a class="nav-link" href="/admin"><h4>Wróć</h4></a>
            </c:if>

            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <a class="nav-link" href="/"><h4>Wróć</h4></a>
            </c:if>
        </div>

        <div class="row row-30">
            <div class="col-md-4 col-xl-3">
                <img class="bigImage landscape" alt="img" src="data:image/jpeg;base64,${auction.base64Image}"
                     width="600px" height="400px"/>
            </div>
            <div class="col-md4 col-xl-3"></div>

            <div class="col-md-offset-1 col-xl-3">
                <b>Marka </b><h5>${auction.make}</h5>
                <b>Model </b><h5>${auction.model}</h5>
                <b>Rocznik </b><h5>${auction.year}</h5>
                <b>Paliwo </b><h5>${auction.fuel}</h5>
                <b>Cena </b><h5>${auction.price} PLN</h5>
                <b>Opis </b><h5>${auction.description}</h5>

                <c:if test="${auction.auctionFinished != true}">
                    <b>Początek aukcji </b><h5>${auction.startTime}</h5>
                    <b>Koniec aukcji </b><h5>${auction.finishTime}</h5>
                </c:if>

                <br>
                <br>
                <c:if test="${auction.auctionFinished != true}">
                    <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
                        <c:if test="${auction.user.username != pageContext.request.userPrincipal.name}">
                            <form id="buyerForm" method="GET" action="/buy">
                                <input type="hidden" name="auctionId" value="${auction.id}"/>
                                <input type="submit" style="color: yellow" class="btn btn-info"
                                       value="Kup ten samochód"/>
                            </form>
                        </c:if>
                    </c:if>
                </c:if>
            </div>
            <br>
            <br>
        </div>
    </div>
</div>
</body>
<%@ include file="/footer.jsp" %>
</html>
