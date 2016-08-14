<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width">
    <jsp:include page="common/common.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/fort.css">
    <link rel="stylesheet" href="http://dreamsky.github.io/main/blog/common/init.css">
    <style>
        .top-banner {
            background-color: #333;
        }

        .nav {
            margin-bottom: 30px;
        }

        .nav li.current a {
            background-color: #009DFF;
            color: #fff;
            padding: 10px;
        }

        .nav a {
            margin: 5px;
            color: #333;
            text-decoration: none;
        }

    </style>
    <script src="${pageContext.request.contextPath}/statics/js/backstage/fort.js"></script>
</head>
<body style=" background-image: url(${pageContext.request.contextPath}/statics/pic/backgroud.jpg);background-size: cover")>
<div style="float: left;margin-left: 3%"><img src="${pageContext.request.contextPath}/statics/pic/lu.png"></div>
<img src="${pageContext.request.contextPath}/statics/pic/title.png" style="margin-top:10%;margin-left: 58%">
<div style="margin-left: -2%;margin-top: -12%">

    <div class="form-wrapper">
        <div class="top">
            <div class="colors"></div>
        </div>
        <div style="width: 100%;margin-left: 80%;margin-top: 10%">
            <div style="float: left" class="form">
                <div style="float: left" class="form-item">

                <input id="userName" type="text" name="text" required="required" placeholder="Name" autocomplete="off">
                </div>
                <div class="form-item">
                    <input id="password" type="password" name="password" required="required" placeholder="Password" autocomplete="off">
                </div>
                <div class="button-panel">
                    <input type="submit" id="loginSubmit" class="button" title="Sign In" value="登录">
                </div>
            </div>
        </div>
</div>
    <div class="footer-banner" style="width:728px; margin:200px auto 0"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/backstage/login.js"></script>
<script>
    $(document).ready(function () {
        function doPost() {
            $.ajax({
                type: "POST",
                url: "login",
                data: {
                    userName: $('#userName').val(),
                    password: $('#password').val()
                },
                dataType: "JSON",
                success: function (res) {
                    if (res.status == "1") {
                        window.location.href = "index";
                    } else {
                        alert("账号或密码错误");
                    }
                }
            });
        }

        $("input[type!='button']").on('keydown', function (event) {
            if (event.keyCode == 13) {
                doPost();
            }
        });
    });

</script>
</body>
</html>
