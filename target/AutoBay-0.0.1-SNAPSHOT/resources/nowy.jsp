<%--
  Created by IntelliJ IDEA.
  User: szymon
  Date: 02.11.2019
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%--duze zdjecie --%>


<img class="bigImage landscape" data-nr="0" data-tracking="gallery_open"
     onload="(this.className+=this.clientWidth>this.clientHeight?' landscape':' portrait')"
     alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 12" style="opacity: 1;"
     src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6IjB5dnp3dW1wZnYyMy1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.3mMlnM_sOD4gvdijcQS5AKlU23eyDgAXP2e0soAKCic/image;s=1080x720;cars_;/936567013_;slot=12;filename=eyJmbiI6IjB5dnp3dW1wZnYyMy1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.3mMlnM+sOD4gvdijcQS5AKlU23eyDgAXP2e0soAKCic_rev001.jpg">

<%--ikonki pod duzym zdjeciem --%>

<div class="slick-list draggable">
    <div class="slick-track" style="opacity: 1; width: 4862px; transform: translate3d(-858px, 0px, 0px);">
        <div class="slick-slide slick-cloned" data-slick-index="-6" aria-hidden="true" style="width: 143px;"
             tabindex="-1">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6ImU0cGM5ZTI2aW9hbjMtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.1-wbx5xgr9zYnV_2cIVNH2TycbS1DOWHPh1esakALvE/image;s=148x110;cars_;/936567013_;slot=21;filename=eyJmbiI6ImU0cGM5ZTI2aW9hbjMtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.1-wbx5xgr9zYnV+2cIVNH2TycbS1DOWHPh1esakALvE_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 21">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-cloned" data-slick-index="-5" aria-hidden="true" style="width: 143px;"
             tabindex="-1">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6IjZxamptbWN0YXR1aTEtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.V7_gmNpUE7gJkx13-5H1FAacecNzGnrzc8oNWnZIilI/image;s=148x110;cars_;/936567013_;slot=22;filename=eyJmbiI6IjZxamptbWN0YXR1aTEtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.V7+gmNpUE7gJkx13-5H1FAacecNzGnrzc8oNWnZIilI_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 22">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-cloned" data-slick-index="-4" aria-hidden="true" style="width: 143px;"
             tabindex="-1">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6InZ1czYzcmljdDJxNC1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.q_jT2K_Rnp-9kiqXPSHlG-yWPvxEk1vS0YRCmBagXXY/image;s=148x110;cars_;/936567013_;slot=24;filename=eyJmbiI6InZ1czYzcmljdDJxNC1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.q+jT2K+Rnp-9kiqXPSHlG-yWPvxEk1vS0YRCmBagXXY_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 24">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-cloned" data-slick-index="-3" aria-hidden="true" style="width: 143px;"
             tabindex="-1">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6IjJic2g5ZzRydXVlZDItT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.uNkb9OfG20ZxjkPzy3dTKm01zzF0YBJxy_5Eh1mMJL8/image;s=148x110;cars_;/936567013_;slot=25;filename=eyJmbiI6IjJic2g5ZzRydXVlZDItT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.uNkb9OfG20ZxjkPzy3dTKm01zzF0YBJxy+5Eh1mMJL8_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 25">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-cloned" data-slick-index="-2" aria-hidden="true" style="width: 143px;"
             tabindex="-1">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6InFyeG96aGRib2c5dy1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.dEpgXG5Q7jvhTBF-4fiVVNv7vtCdeMqBSF0gyEO3Ykc/image;s=148x110;cars_;/936567013_;slot=26;filename=eyJmbiI6InFyeG96aGRib2c5dy1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.dEpgXG5Q7jvhTBF-4fiVVNv7vtCdeMqBSF0gyEO3Ykc_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 26">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" style="width: 143px;"
             tabindex="-1">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6InhzN2hiNm1ocHY2ZDEtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.t1NVjHpslqvFZnjeNlGXLbN95S42Y-zssstTZQqxTl8/image;s=148x110;cars_;/936567013_;slot=27;filename=eyJmbiI6InhzN2hiNm1ocHY2ZDEtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.t1NVjHpslqvFZnjeNlGXLbN95S42Y-zssstTZQqxTl8_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 27">
                </li>
            </div>
        </div>

        <%--        pierwsza miniatura index 0--%>
        <div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false"
             style="width: 143px;">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6IjB5dnp3dW1wZnYyMy1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.3mMlnM_sOD4gvdijcQS5AKlU23eyDgAXP2e0soAKCic/image;s=148x110;cars_;/936567013_;slot=12;filename=eyJmbiI6IjB5dnp3dW1wZnYyMy1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.3mMlnM+sOD4gvdijcQS5AKlU23eyDgAXP2e0soAKCic_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 12">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-active" data-slick-index="1" aria-hidden="false" style="width: 143px;">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6InBxNjZvZzV2Mzk0cjMtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.OBkTyXqHAtQTFtGnffxCD2IGZAs5GifKrLDrcsb-lc8/image;s=148x110;cars_;/936567013_;slot=13;filename=eyJmbiI6InBxNjZvZzV2Mzk0cjMtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.OBkTyXqHAtQTFtGnffxCD2IGZAs5GifKrLDrcsb-lc8_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 13">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-active" data-slick-index="2" aria-hidden="false" style="width: 143px;">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6IjNjOGx4amJjeDY4ZTItT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.-vQZgQsURVR2IgHzmh21Z3boDmX5aZtIUBKr7hgUo5w/image;s=148x110;cars_;/936567013_;slot=14;filename=eyJmbiI6IjNjOGx4amJjeDY4ZTItT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.-vQZgQsURVR2IgHzmh21Z3boDmX5aZtIUBKr7hgUo5w_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 14">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-active" data-slick-index="3" aria-hidden="false" style="width: 143px;">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6InI2MzlpbGo4eWI4ay1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.2GxbMleFx9CS7OSTHHvZVm7u5HTYamuE3HZ4uXsVsrE/image;s=148x110;cars_;/936567013_;slot=15;filename=eyJmbiI6InI2MzlpbGo4eWI4ay1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.2GxbMleFx9CS7OSTHHvZVm7u5HTYamuE3HZ4uXsVsrE_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 15">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-active" data-slick-index="4" aria-hidden="false" style="width: 143px;">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6Im5jbDFyOThld205YS1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.uA0uBg3oW76Ng9lp8lxDIb4MyFRMCgCPSxWinBA7e0k/image;s=148x110;cars_;/936567013_;slot=17;filename=eyJmbiI6Im5jbDFyOThld205YS1PVE9NT1RPUEwiLCJ3IjpbeyJmbiI6IndnNGducXA2eTFmLU9UT01PVE9QTCIsInMiOiIxNiIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.uA0uBg3oW76Ng9lp8lxDIb4MyFRMCgCPSxWinBA7e0k_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 17">
                </li>
            </div>
        </div>
        <div class="slick-slide slick-active" data-slick-index="5" aria-hidden="false" style="width: 143px;">
            <div>
                <li class="offer-photos-thumbs__item" style="width: 100%; display: inline-block;">
                    <img src="https://apollo-ireland.akamaized.net/v1/files/eyJmbiI6IjRqYnk5YmpzMDVmcDEtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.RP6-xjRAIzcmmte0MQfSk16Tm_GsHLfrih6mb2Rl76k/image;s=148x110;cars_;/936567013_;slot=18;filename=eyJmbiI6IjRqYnk5YmpzMDVmcDEtT1RPTU9UT1BMIiwidyI6W3siZm4iOiJ3ZzRnbnFwNnkxZi1PVE9NT1RPUEwiLCJzIjoiMTYiLCJwIjoiMTAsLTEwIiwiYSI6IjAifV19.RP6-xjRAIzcmmte0MQfSk16Tm+GsHLfrih6mb2Rl76k_rev001.jpg"
                         alt="Volkswagen Beetle 1,2Pb * Panorama * Led * Tempomat * Piękny * Zarejestrowany w PL - 18">
                </li>
            </div>
        </div>
    </div>
</div>

</body>
</html>
