<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Dodaj aukcję</title>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript">
        var imageURLs = [
            "http://ujeb.se/HJ8Wi"
            , "http://ujeb.se/6Y7XN"
            , "http://ujeb.se/5rZuo"
            , "http://ujeb.se/oV5BS"
            , "http://ujeb.se/vGnH6"
            , "http://ujeb.se/ilWdg"
        ];

        function getImageTag() {
            var img = '<img src=\"';
            var randomIndex = Math.floor(Math.random() * imageURLs.length);
            img += imageURLs[randomIndex];
            img += '\" alt=\"image\" width=\"720px\" height=\"576px\" />';
            return img;
        }
    </script>
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
                    <a class="nav-link" href="/contact"><h4>Kontakt </h4></a>
                </li>
                <li class="nav-item">
                    <c:if test="${pageContext.request.isUserInRole('ROLE_USER')}">
                        <a class="nav-link" href="/auction/my-auctions"><h4>Moje aukcje </h4></a>
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
        <div><h1>Nowa aukcja</h1></div>
        <div class="row">
            <br><br><br>
            <div class="col-sm-4">
                <form:form method="post" enctype="multipart/form-data" modelAttribute="auctionForm">
                    <label for="makeChooser">Marka</label><br>
                    <form:select class="form-control" path="make" name="make" id="makeChooser" cssStyle="width: 170px;"
                                 onchange="DynamicallyChangeModel()">
                        <option selected="selected"> -- Wybierz markę --</option>
                        <c:forEach items="${make}" var="makeValue">
                            <option value="${makeValue}">
                                    ${makeValue}
                            </option>
                        </c:forEach>
                    </form:select>
                    <br>
                    <spring:bind path="model1">
                        <label for="modelChooser">Model</label><br>
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:select path="model1" id="modelChooser" cssStyle="width: 170px;"
                                        class="form-control"><option selected="selected"> -- Wybierz model --</option>-->
                            </form:select>
                            <form:errors path="model1"></form:errors>
                        </div>
                    </spring:bind>
                    <br>

                    <label for="fuelId">Rodzaj paliwa</label><br>
                    <form:select class="form-control" path="fuel" id="fuelId" cssStyle="width: 170px;">
                        <option selected="selected"> -- Wybierz paliwo --</option>-->
                        <c:forEach items="${fuel}" var="fuelValue">
                            <option value="${fuelValue}">
                                    ${fuelValue}
                            </option>
                        </c:forEach>
                    </form:select>
                    <form:errors path="fuel" element="div"/>
                    <br>

                    <spring:bind path="year">
                        <label for="yearId">Rocznik</label><br>
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="text" maxlength="4" path="year" id="yearId" cssStyle="width: 170px;"
                                        class="form-control"></form:input>
                            <form:errors path="year"></form:errors>
                        </div>
                    </spring:bind>

                    <spring:bind path="mileage">
                        <label for="mileageId">Przebieg</label><br>
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="text" maxlength="6" path="mileage" id="mileageId" cssStyle="width: 170px;"
                                        class="form-control"></form:input>
                            <form:errors path="mileage"></form:errors>
                        </div>
                    </spring:bind>

                    <spring:bind path="price">
                        <label for="priceId">Cena</label><br>
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="text" maxlength="10" path="price" id="priceId" cssStyle="width: 170px;"
                                        class="form-control" placeholder="format 35000.00"></form:input>
                            <form:errors path="price"></form:errors>
                        </div>
                    </spring:bind>

                    <spring:bind path="description">
                        <label for="descriptionId">Opis</label><br>
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:textarea class="form-control" path="description" id="descriptionId" rows="1"
                                           cssStyle="width: 170px; height: auto"></form:textarea>
                            <form:errors path="description" element="div" cssClass="error"></form:errors>
                        </div>
                    </spring:bind>
                    <br><br>

                    <label for="picture">Dodaj zdjęcie</label><br>
                    <input type="file" name="file" id="picture"/>

                    <br>
                    <br>
                    <input class="btn btn-info" type="submit" value="Zapisz">
                </form:form>
            </div>

            <div class="col-sm-8">
                <script type="text/javascript">
                    document.write(getImageTag());
                </script>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script>
    var makeAndModels = {};

    makeAndModels['${make[0]}'] = ['${model[0]}', '${model[1]}', '${model[2]}', '${model[3]}', '${model[4]}'];
    makeAndModels['${make[1]}'] = ['${model[5]}', '${model[6]}', '${model[7]}', '${model[8]}', '${model[9]}'];
    makeAndModels['${make[2]}'] = ['${model[10]}', '${model[11]}', '${model[12]}', '${model[13]}', '${model[14]}'];
    makeAndModels['${make[3]}'] = ['${model[15]}', '${model[16]}', '${model[17]}', '${model[18]}', '${model[19]}'];
    makeAndModels['${make[4]}'] = ['${model[20]}', '${model[21]}', '${model[22]}', '${model[23]}', '${model[24]}'];
    makeAndModels['${make[5]}'] = ['${model[25]}', '${model[26]}', '${model[27]}', '${model[28]}', '${model[29]}'];
    makeAndModels['${make[6]}'] = ['${model[30]}', '${model[31]}', '${model[32]}', '${model[33]}', '${model[34]}'];
    makeAndModels['${make[7]}'] = ['${model[35]}', '${model[36]}', '${model[37]}', '${model[38]}', '${model[39]}'];
    makeAndModels['${make[8]}'] = ['${model[40]}', '${model[41]}', '${model[42]}', '${model[43]}', '${model[44]}'];
    makeAndModels['${make[9]}'] = ['${model[45]}', '${model[46]}', '${model[47]}', '${model[48]}', '${model[49]}'];
    makeAndModels['${make[10]}'] = ['${model[50]}', '${model[51]}', '${model[52]}', '${model[53]}', '${model[54]}'];
    makeAndModels['${make[11]}'] = ['${model[55]}', '${model[56]}', '${model[57]}', '${model[58]}', '${model[59]}'];
    makeAndModels['${make[12]}'] = ['${model[60]}', '${model[61]}', '${model[62]}', '${model[63]}', '${model[64]}'];
    makeAndModels['${make[13]}'] = ['${model[65]}', '${model[66]}', '${model[67]}', '${model[68]}', '${model[69]}'];
    makeAndModels['${make[14]}'] = ['${model[70]}', '${model[71]}', '${model[72]}', '${model[73]}', '${model[74]}'];
    makeAndModels['${make[15]}'] = ['${model[75]}', '${model[76]}', '${model[77]}', '${model[78]}', '${model[79]}'];
    makeAndModels['${make[16]}'] = ['${model[80]}', '${model[81]}', '${model[82]}', '${model[83]}', '${model[84]}'];
    makeAndModels['${make[17]}'] = ['${model[85]}', '${model[86]}', '${model[87]}', '${model[88]}', '${model[89]}'];
    makeAndModels['${make[18]}'] = ['${model[90]}', '${model[91]}', '${model[92]}', '${model[93]}', '${model[94]}'];
    makeAndModels['${make[19]}'] = ['${model[95]}', '${model[96]}', '${model[97]}', '${model[98]}', '${model[99]}'];
    makeAndModels['${make[20]}'] = ['${model[100]}', '${model[101]}', '${model[102]}', '${model[103]}', '${model[104]}'];
    makeAndModels['${make[21]}'] = ['${model[105]}', '${model[106]}', '${model[107]}', '${model[108]}', '${model[109]}'];
    makeAndModels['${make[22]}'] = ['${model[110]}', '${model[111]}', '${model[112]}', '${model[113]}', '${model[114]}'];
    makeAndModels['${make[23]}'] = ['${model[115]}', '${model[116]}', '${model[117]}', '${model[118]}', '${model[119]}'];
    makeAndModels['${make[24]}'] = ['${model[120]}', '${model[121]}', '${model[122]}', '${model[123]}', '${model[124]}'];
    makeAndModels['${make[25]}'] = ['${model[125]}', '${model[126]}', '${model[127]}', '${model[128]}', '${model[129]}'];
    makeAndModels['${make[26]}'] = ['${model[130]}', '${model[131]}', '${model[132]}', '${model[133]}', '${model[134]}'];
    makeAndModels['${make[27]}'] = ['${model[135]}', '${model[136]}', '${model[137]}', '${model[138]}', '${model[139]}'];
    makeAndModels['${make[28]}'] = ['${model[140]}', '${model[141]}', '${model[142]}', '${model[143]}', '${model[144]}'];
    makeAndModels['${make[29]}'] = ['${model[145]}', '${model[146]}', '${model[147]}', '${model[148]}', '${model[149]}'];
    makeAndModels['${make[30]}'] = ['${model[150]}', '${model[151]}', '${model[152]}', '${model[153]}', '${model[154]}'];
    makeAndModels['${make[31]}'] = ['${model[155]}', '${model[156]}', '${model[157]}', '${model[158]}', '${model[159]}'];
    makeAndModels['${make[32]}'] = ['${model[160]}', '${model[161]}', '${model[162]}', '${model[163]}', '${model[164]}'];
    makeAndModels['${make[33]}'] = ['${model[165]}', '${model[166]}', '${model[167]}', '${model[168]}', '${model[169]}'];
    makeAndModels['${make[34]}'] = ['${model[170]}', '${model[171]}', '${model[172]}', '${model[173]}', '${model[174]}'];
    makeAndModels['${make[35]}'] = ['${model[175]}', '${model[176]}', '${model[177]}', '${model[178]}', '${model[179]}'];
    makeAndModels['${make[36]}'] = ['${model[180]}', '${model[181]}', '${model[182]}', '${model[183]}', '${model[184]}'];
    makeAndModels['${make[37]}'] = ['${model[185]}', '${model[186]}', '${model[187]}', '${model[188]}', '${model[189]}'];
    makeAndModels['${make[38]}'] = ['${model[190]}', '${model[191]}', '${model[192]}', '${model[193]}', '${model[194]}'];
    makeAndModels['${make[39]}'] = ['${model[195]}', '${model[196]}', '${model[197]}', '${model[198]}', '${model[199]}'];
    makeAndModels['${make[40]}'] = ['${model[200]}', '${model[201]}', '${model[202]}', '${model[203]}', '${model[204]}'];
    makeAndModels['${make[41]}'] = ['${model[205]}', '${model[206]}', '${model[207]}', '${model[208]}', '${model[209]}'];
    makeAndModels['${make[42]}'] = ['${model[210]}', '${model[211]}', '${model[212]}', '${model[213]}', '${model[214]}'];
    makeAndModels['${make[43]}'] = ['${model[215]}', '${model[216]}', '${model[217]}', '${model[218]}', '${model[219]}'];

    function DynamicallyChangeModel() {
        var makeList = document.getElementById("makeChooser");
        var modelList = document.getElementById("modelChooser");
        var selection = makeList.options[makeList.selectedIndex].value;
        while (modelList.options.length) {
            modelList.remove(0);
        }
        var model = makeAndModels[selection];
        if (model) {
            var i;
            for (i = 0; i < model.length; i++) {
                var element = new Option(model[i], i);
                element.value = element.text;
                modelList.options.add(element);
            }
        }
    }
</script>
</body>
<%@ include file="/footer.jsp" %>
</html>