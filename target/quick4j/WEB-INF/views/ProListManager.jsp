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
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/statics/js/backstage/ProListManager.js"></script>
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

        <th class="center" style="width: 18%">产品名称</th>
        <th style="width: 12%">年化利率</th>
        <th class="center" style="width: 18%">起投金额</th>
        <th style="width: 12%">收益方式</th>
        <th style="width: 12%">安全等级</th>
        <th style="width: 12%">产品渠道</th>
        <th style="width: 12%">产品期限</th>
        <th style="width: 18%">总金额</th>
        <th class="center" style="width: 20%">上架日期</th>
        <th class="center" style="width: 20%">下架日期</th>
    </tr>
    <c:forEach items="${list}" var="var">
        <tr>

            <td>${var.productName}</td>
            <td>${var.expectedReturn}</td>
            <td class="center" style="font-weight: bold;">${var.startMoney}</td>
            <td class="center">${var.incomeStyle}</td>
            <td>${var.securityLevel}</td>
            <td>${var.productChannel}</td>
            <td>${var.productLife}</td>
            <td>${var.totalAmount}</td>
            <td class="center">${var.saleTime}</td>
            <td class="center">${var.removeTime}</td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
