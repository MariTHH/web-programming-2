<%--
  Created by IntelliJ IDEA.
  User: tolst
  Date: 30.10.2023
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <%--    <link rel="shortcut icon" href="./media/favicon.ico?v=2" type="image/x-icon">--%>
    <title>lab2</title>
    <!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
    <script src="./js/Validator.js"></script>
    <script src="./js/Updater.js"></script>
    <script src="./js/ValueGetter.js"></script>
    <script src="./js/ClearTable.js"></script>
    <script src="./js/xButton.js"></script>
    <script src="./js/rButton.js"></script>
    <script src="./js/GraphHandler.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="./css/style.css">
    <meta charset="utf-8">
</head>

<body>
<div id="container">
    <div id="upper">
        <header>
            Толстых Мария Алексеевна <br> P3230 <br> Вариант 53180
        </header>

    </div>

    <div id="heading">
        <h2>Лабораторная работа 2 </h2>
    </div>


    <div id="content">
        <div id="graph">
            <svg width="300px" height="300px" onclick="svgHandler(event)" class="svgClass">
                <!-- Координатные оси -->
                <line x1="0" x2="300" y1="150" y2="150" stroke="#343548"></line>
                <line x1="150" x2="150" y1="0" y2="300" stroke="#343548"></line>
                <!--Стрелки-->
                <polygon points="150,0 145,10 155,10" stroke="#343548"></polygon>
                <polygon points="300,150 290,145 290,155" stroke="#343548"></polygon>
                <!--Четверть круга в первой четверти-->
                <%--                <path d="M150,50 A100,100 90 0,1 250,150 L 150,150 Z"></path>--%>
                <path d="M150,250 A100,100 90 0,1 50,150 L 150,150 Z"></path>
                <!--Прямоугольник в первой четверти-->
                <polygon points="150,150 150,50 200,50 200,150"></polygon>
                <!--Треугольник в четвертой четверти-->
                <polygon points="150,150 150,200 200,150"></polygon>
                !!-->

                <!-- Метки для значений R на оси X -->
                <line x1="50" x2="50" y1="145" y2="155" stroke="#343548"></line>
                <line x1="100" x2="100" y1="145" y2="155" stroke="#343548"></line>
                <line x1="200" x2="200" y1="145" y2="155" stroke="#343548"></line>
                <line x1="250" x2="250" y1="145" y2="155" stroke="#343548"></line>

                <!-- Метки для значений R на оси Y -->
                <line x1="145" x2="155" y1="50" y2="50" stroke="#343548"></line>
                <line x1="145" x2="155" y1="100" y2="100" stroke="#343548"></line>
                <line x1="145" x2="155" y1="200" y2="200" stroke="#343548"></line>
                <line x1="145" x2="155" y1="250" y2="250" stroke="#343548"></line>

                <!-- Подписи к осям -->
                <text x="290" y="140">X</text>
                <text x="155" y="10">Y</text>
                <!-- Значения R на оси X -->
                <text x="40" y="138">-R</text>
                <text x="85" y="138">-R/2</text>
                <text x="190" y="138">R/2</text>
                <text x="245" y="138">R</text>
                <!-- Значения R на оси Y -->
                <text x="162" y="54">R</text>
                <text x="162" y="104">R/2</text>
                <text x="162" y="204">-R/2</text>
                <text x="162" y="254">-R</text>
                <%--@elvariable id="shots" type="java.util.LinkedList"--%>
                <c:forEach items="${shots}" var="col">
                    <circle class="shot" cx="${150 + 50 * 2/col.getR() * col.getX()}"
                            fill = "${col.getStatus() ? '#98FB98' :  'orangered'}"
                            cy="${150 - 50 * 2/col.getR() * col.getY()}" r="2"
                            stroke-width="0"></circle>
                </c:forEach>
            </svg>
        </div>
        <form novalidate name="simpleForm" onsubmit="getDataFromForm(); return false;">
            <div id="form">
                <div id="values">
                    <div id="x-values">
                        <label for="x-value">Введите X (-3 ... 5):</label>
                        <input type="number" class="x-text" maxlength="14" id="x-value" name="x-value"
                               oninput="validateTextFieldX()" required> <br>
                    </div>
                    <div id="y-values">
                        <label for="y-value">Введите Y (-5 ... 3):</label>
                        <input type="number" class="y-text" maxlength="14" id="y-value" name="y-value"
                               oninput="validateTextFieldY()" required> <br>
                    </div>
                    <div id="r-values">
                        <label for="r-values">Выберите R:</label>
                        <input id="r-button" class="r-button" type="button" value="1">
                        <input class="r-button" type="button" value="1.5">
                        <input class="r-button" type="button" value="2">
                        <input class="r-button" type="button" value="2.5">
                        <input class="r-button" type="button" value="3">
                        <br>
                    </div>
                    <div id="formButtons">
                        <input type="submit" class="element" name="submit-btn" value="Подтвердить">
                        <button onClick="window.location.replace('./result.jsp');" type="reset" onclick="">Последний
                            результат
                        </button>
                    </div>
                </div>
            </div>
        </form>
        <section id="validationInfo" class="validationInfo">
        </section>
    </div>
</div>

<div id="tableInTotal">
    <input type="submit" class="element" id="clear-btn" value="Очистить"
           onclick="clearTable();">
    <table id="table">
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Время запроса</th>
            <th>Время работы скрипта (мс)</th>
            <th>Результат</th>
        </tr>
        <%--@elvariable id="shots" type="java.util.LinkedList"--%>
        <c:forEach items="${shots}" var="col">
            <tr>
            <td>${col.getX().toString().format("%.2f", col.getX()).replaceAll(",",".")}</td>
            <td>${col.getY().toString().format("%.2f", col.getY()).replaceAll(",",".")}</td>
            <td>${col.getR().toString().format("%.2f", col.getR()).replaceAll(",",".")}</td>
            <td>${col.getTime().toString()}</td>
            <td>${col.getScriptTime().toString()}</td>
            <td>${col.getStatus().toString()} </td>
            <tr>
            </tr>
            </tr>
        </c:forEach>
    </table>
</div>
</div>
</body>
</html>