<%@ page import="com.model.UserInfo" %>
<%@ page import="com.model.ProductInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mapper.ProductInfoMapper" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.biz.product.Product" %>
<%@ page import="com.dto.ProSearchResponseDto" %>
<%--
  Created by IntelliJ IDEA.
  User: hucheng626
  Date: 2016/8/5
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LU.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../statics/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../../statics/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="../../statics/css/jquery-ui.css">
    <link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="../../statics/js/jquery1.min.js"></script>
    <!-- start menu -->

    <!--start slider -->
    <link rel="stylesheet" href="../../statics/css/fwslider.css" media="all">
    <script src="../../statics/js/jquery-ui.min.js"></script>

    <script src="../../statics/js/fwslider.js"></script>
    <!--end slider -->
    <script src="../../statics/js/jquery.easydropdown.js"></script>
    <script src="../../statics/js/login/login_label.js"></script>
</head>
<body>
<div class="header-top">
    <div class="wrap">
        <div class="cssmenu">
            <ul>
                <%
                    UserInfo user = (UserInfo)request.getSession().getAttribute("user");
                    String userName;
                    if (null != user){
                        userName = user.getUserName();
                    }
                    else{
                        userName = "";
                    }
                %>
                <li class="active" id="have_login" style="display:none"><label><a href="personInfo?userName=<%= userName %>" id="user-info"><%= userName %></a>  <a href="#" id="logout">注销登录</a></label></li>
                <li class="active" id="not_login"  style="display:none"><a href="register" id="user-show"><label >您好 , 欢迎来到陆金所! 登录/注册</label></a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="header-bottom">
    <div class="wrap">
        <div class="header-bottom-left">
            <div class="logo">
                <a href="product.html"><img src="../../statics/pic/lu.png" alt=""/></a>
            </div>
            <div class="menu">
                <ul class="megamenu skyblue">
                    <li class="active-grid" style="margin-top: 33px;margin-left: 30px;"><a href="product.html">首页</a></li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- start slider -->
<div id="fwslider">
    <div class="slider_container">
        <div class="slide">
            <!-- Slide image -->
            <img src="../../statics/pic/idesk1.jpg" alt=""/>
        </div>
        <!-- /Duplicate to create more slides -->
        <div class="slide">
            <img src="../../statics/pic/idesk2.jpg" alt=""/>

        </div>
        <!--/slide -->
    </div>
    <div class="timers"></div>
    <div class="slidePrev"><span></span></div>
    <div class="slideNext"><span></span></div>
</div>
<!--/slider -->
<div class="main">
    <div class="wrap">
        <div class="product-show">
            <ul class="product_rows">
                <%
                    List<ProductInfo> productInfoList = (List<ProductInfo>)request.getAttribute("productInfoList");
                    int productNum = 0;

                    for(ProductInfo productInfo : productInfoList)
                    {
                        productNum+=1;
                %>

                <li class="product_item">

                    <a class="product-title"><%= productInfo.getProductName()%></a>
                    <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                    <ul class="product"+<%= productNum%>>
                        <li class="interest-rate">
                            <span class="year-interest-rate">预期年化利率</span>
                            <strong><p class="num-style" style="color:orangered;font-weight:bold;"><%= productInfo.getExpectedReturn()*100%>%</p></strong>
                        </li>
                        <li class="interest-period">
                            <span class="year-interest-period">投资期限</span>
                            <p><%= productInfo.getProductLife()%>天</p>
                        </li>
                        <li class="collection-mode">
                            <span class="property-name">收益方式</span>
                            <p class="collection-method"><%= productInfo.getIncomeStyle()%></p>
                        </li>
                        <li class="investment-amount">
                            <span class="investment-money">投资金额</span>
                            <p class="investment-money" style="color:orangered;font-weight:bold;"><%= productInfo.getTotalAmount()%>元</p>
                        </li>
                        <li class="move">
                            <a href="single/?productID=<%= productInfo.getId()%>"><input type="button" title="查看" value="查看详情" /></a>
                        </li>
                    </ul>
                <li class="edge"></li>
                <% }
                %>

            </ul>
        </div>
    </div>
</div>
<div class="footer">
    <div class="footer-top">
        <div class="wrap">
            <div class="section group example">
                <div class="col_1_of_2 span_1_of_2">
                    <ul class="f-list">
                        <li>
                            <img src="../../statics/pic/3.png"><span class="f-text">Call us! 666-555-6666 </span><div class="clear"></div></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="footer-middle">
        <div class="wrap">
            <div class="show-left">
                <ul>
                    <li><img src="../../statics/pic/link.png"><p>在线微服</p></li>
                    <li><img src="../../statics/pic/link2.png"><p>手机端下载</p></li>
                    <li><img src="../../statics/pic/link3.png"><p>在线微店</p><li>
                </ul>
            </div>
            <div class="col_1_of_f_2 span_1_of_f_2">
                <h3>Contact us</h3>
                <div class="company_address">
                    <p>永新广场10F,南京西路128号</p>
                    <p>黄浦区，上海市</p>
                    <p>上海，中国</p>
                    <p>Phone:(00) 666-555-6666</p>
                    <p>Fax: (000) 666-555-6666</p>
                    <p>Email: <span>***@lu.com</span></p>

                </div>

            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>

<div class="footer-bottom">
    <div class="wrap">
        <div class="copy">
            <p>
                版权所有 © 上海###########股份有限公司 沪 ICP 证 **-*******号   沪 ICP 备 ********
            </p>
            <p>Copyright &copy; 2016.shanghai###### All rights reserved.</p>
        </div>

        <div class="clear"></div>
    </div>
</div>
</body>
</html>