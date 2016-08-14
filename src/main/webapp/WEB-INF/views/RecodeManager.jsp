<%--
  Created by IntelliJ IDEA.
  User: junming.qi
  Date: 2015/11/19
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="./common/common.jsp"></jsp:include>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/backstage/ProListManager.js"></script>
    <style>
        body {
            background: #fff;
            overflow: auto;
        }

        * {
            margin: 0px;
            padding: 0px;
        }

        .sub-con a {
            line-height: 40px
        }

        .sub-con p {
            text-align: center
        }
    </style>
    <style type="text/css">
        #triggers {
            width: 100%;
            margin: 0px;
            border-collapse: collapse;
            table-layout: fixed;
        }

        #triggers td, #triggers th {
            font-size: 12px;
            border: 1px solid #CC33AE;
            padding: 3px 7px 2px 7px;
        }

        #triggers th {
            font-size: 1.1em;
            text-align: center;
            padding-top: 5px;
            padding-bottom: 4px;
            background-color: #FCADEC;
            color: #ffffff;
        }

        #triggers tr.alt td {
            color: #000000;
            background-color: #FDF0FB;
        }

        .center {
            text-align: center;
        }
    </style>
</head>
<body>
<table id="triggers">
    <tr>

        <th class="center" style="width: 7%">用户</th>
        <th style="width: 12%">产品名称</th>
        <th style="width: 12%">购买金额</th>
        <th class="center" style="width: 12%">购买时间</th>
    </tr>
    <c:forEach items="${list}" var="var" >
        <tr>

            <td>${var.userName}</td>
            <td>${var.productName}</td>
            <td>${var.bookMoney}</td>
            <td class="center">${var.bookTime}</td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
