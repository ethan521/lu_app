<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>产品管理</title>
    <jsp:include page="common/common.jsp"></jsp:include>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/backstage/index.js"></script>

    <!--图标样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/backstage/bootstrap.min.css"/>

    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/backstage/style.css"/>
    <script type="text/javascript">
        $(function () {
            $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
            $('.tree li.parent_li > span').on('click', function (e) {
                var children = $(this).parent('li.parent_li').find(' > ul > li');
                if (children.is(":visible")) {
                    children.hide('fast');
                    $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
                } else {
                    children.show('fast');
                    $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
                }
                e.stopPropagation();
            });
        });
    </script>
    <style>
        a {
            text-decoration: none;
            color: #000000;
        }
    </style>
</head>
<body class="easyui-layout" background="">
<div data-options="region:'north',border:false" style="height:16%;background:lightblue;padding:15px">
    <img src="${pageContext.request.contextPath}/statics/pic/head.png" style="margin-top:-0.5%;margin-left: 1%">
    <img src="${pageContext.request.contextPath}/statics/pic/pmwl.png" style="margin-top:-1.5%;margin-left: 0.5%">
</div>
<div data-options="region:'west',title:''" style="width:240px;margin-left: -7%">

    <div class="tree">
        <ul>
            <li>
                <span style="margin-left: -10%;width: 100%"><i class="icon-calendar"></i> &nbsp;&nbsp;&nbsp;募集产品后台管理</span>
                <ul>
                    <li>
                        <span class="badge badge-success"><i class="icon-minus-sign"></i> 上架管理</span>
                        <ul>
                            <li>
                                <a href="#" id="toSelect"
                                   onclick="addTab('上架产品管理','${pageContext.request.contextPath}/backstage/proManager')"><span>
                                    <i class="badge badge-warning"></i>产品上架</span> </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <span class="badge badge-success"><i class="icon-minus-sign"></i>产品列表</span>
                        <ul>
                            <li>
                                <a href="#" id="as"
                                   onclick="addTab('产品列表','${pageContext.request.contextPath}/backstage/proListManager')"><span><i
                                        class="badge badge-warning"></i>列表查询</span> </a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <span class="badge badge-success"><i class="icon-minus-sign"></i>交易记录</span>
                        <ul>
                            <li>
                                <a href="#" id="df"
                                   onclick="addTab('交易记录','${pageContext.request.contextPath}/backstage/recodeManager')"><span><i
                                        class="badge badge-warning"></i>记录查询</span> </a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <span class="badge badge-important"><i class="icon-minus-sign"></i>敬请期待...</span>

                    </li>
                </ul>
            </li>
        </ul>
        </li>
        </ul>
    </div>
</div>

<div data-options="region:'south',border:false" style="height:50px;background:lightblue;padding:10px;">
    <div style="margin-left: 50%">@lu.com</div>
</div>
<div data-options="region:'center',title:''">
    <div class="easyui-tabs" id="main-tabs" data-options="fit:true,border:false,plain:true">
    </div>

</div>
</body>
</html>
