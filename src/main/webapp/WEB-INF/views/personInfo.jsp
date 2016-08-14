<%@ page import="com.model.UserInfo" %>
<%@ page import="com.model.BookList" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: zhengxiaojie252
  Date: 2016/8/10
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
  <!DOCTYPE HTML>
  <html>
  <head>
    <title>LU.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../statics/css/style-3.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../../statics/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
    <script src="../../statics/js/jquery1.min.js"></script>
    <script src="../../statics/js/highcharts.js"></script>
    <!-- start menu -->
    <link href="../../statics/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="../../statics/js/megamenu.js"></script>
    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
    <script type="text/javascript" src="../../statics/js/jquery.jscrollpane.min.js"></script>
    <!-- start details -->
    <script src="../../statics/js/slides.min.jquery.js"></script>
    <script>
      $(function(){
        $('#products').slides({
          preload: true,
          preloadImage: 'img/loading.gif',
          effect: 'slide, fade',
          crossfade: true,
          slideSpeed: 350,
          fadeSpeed: 500,
          generateNextPrev: true,
          generatePagination: false
        });
      })
    </script>
    <!-- start zoom -->
    <link rel="stylesheet" href="../../statics/css/zoome-min.css" />
    <script type="text/javascript" src="../../statics/js/zoome-e.js"></script>
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
          <li class="active" id="have_login" style="display:none"><label><a href="#" id="user-info"><%= userName %></a>  <a href="#" id="logout">注销登录</a></label></li>
          <li class="active" id="not_login"  style="display:none"><a href="register" id="user-show"><label >您好 , 欢迎来到陆金所! 登录/注册</label></a></li>
          <!--<li><a href="register.html">注册</a></li>-->
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
  <div class="clear"></div>
  </div>
  </div>
  <div class="mens">
    <div class="main">
      <div class="wrap">
        <ul class="breadcrumb breadcrumb__t"><a class="home" href="product.html">首页</a>  / 个人信息</ul>
        <div class="cont span_2_of_3">
          <!--<span class="m_link"><a href="#">login to save in wishlist</a> </span>-->
          <div class="clear"></div>
          <div class="progress-content">
            <div class="progress-content">
              <!--<div class="progress-sum">-->
              <!--<h3 class="progress-sum-title">产品概述:</h3>-->
              <!--<p class="progress-sum-details">“****”是上海陆家嘴国际金融资产交易市场股份有限公司及上海陆金所互联网金融信息服务有限公司（以下合称“陆金所”）于其网站平台上向投资方（投资人，即出借人）和融资方（借款人）推出的个人投融资服务。借贷双方通过“稳盈-安e+”服务可以快捷方便地达成借款交易并完成资金的借出和借入。“稳盈-安e+”服务仅向符合中华人民共和国有关法律法规及陆金所相关规定的合格投资人和借款人提供。</p>-->
              <!--</div>-->
              <%
                UserInfo userInfo = (UserInfo)request.getAttribute("userInfo");
                List<BookList> bookList = (List<BookList>)request.getAttribute("bookList");
              %>
              <div class="progress-details">
                <h3 class="progress-details-title">个人信息：</h3>
                <table class="progress-details-det Tc MT5" cellpadding="0" border="0">
                  <tbody>
                  <tr>
                    <td class="prod-1">用户名</td>
                    <td class="prod-3"><%= userInfo.getUserName()%></td>
                    <td class="prod-1">姓名</td>
                    <td class="prod-3"><%= userInfo.getUserName()%></td>
                  </tr>
                  <tr>
                    <td class="prod-1">账户余额</td>
                    <td class="prod-3"><%= userInfo.getBalance()%></td>
                    <td class="prod-1">生日</td>
                    <td class="prod-3"><%= userInfo.getBirthday()%></td>

                  </tr>
                  <tr>
                    <td class="prod-1">手机号</td>
                    <td class="prod-3"><%= userInfo.getMobileNumber()%></td>
                    <td class="prod-1">邮箱</td>
                    <td class="prod-3"><%= userInfo.getEmail()%></td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="progress-details">
                <h3 class="progress-details-title">投资记录：</h3>
                <div class="progress-details-det Tc MT5" cellpadding="0" border="0">
                  <table>
                    <%
                    int bookListLen = bookList.size();
                      if (0==bookListLen)
                      {%>
                        还没有投资记录
                      <%}else{%>
                        <th>
                        <td>产品名称</td>
                        <td>购买金额</td>
                        <td>购买时间</td>
                        </th>
                      <%
                        for(BookList book : bookList){%>
                          <tr>
                            <td><%=book.getProductName()%></td>
                            <td><%=book.getBookMoney()%></td>
                            <td><%=book.getBookTime()%></td>
                          </tr>
                        <%}
                      }%>
                    </table>
                </div>
              </div>
            </div>
          </div>
          <h3 class="progress-state">
            <span class="progress-state-red">免责声明：</span>
            “本网站所有资讯与说明文字仅供参考，不作为投资依据，如有与本公司相关公告及信托法律文件不符，以相关公告及信托法律文件为准。”
          </h3>
        </div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer-top">
      <div class="wrap">
        <div class="section group example">
          <div class="col_1_of_2 span_1_of_2">
            <ul class="f-list">
              <li><img src="../../statics/pic/3.png"><span class="f-text">Call us! 666-555-6666 </span><div class="clear"></div></li>
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
  </div>
  </div>
  <div class="footer-bottom">
    <div class="wrap">
      <div class="copy">
        <p>
          版权所有 © 上海###########股份有限公司 沪 ICP 证 **-*******号   沪 ICP 备 ********
        </p>
        <br>
        <p>Copyright &copy; 2016.shanghai###### All rights reserved.</p>
      </div>
      <!--<div class="f-list2">-->
      <!--<ul>-->
      <!--<li class="active"><a href="about.html">About Us</a></li> |-->
      <!--<li><a href="delivery.html">Delivery & Returns</a></li> |-->
      <!--<li><a href="delivery.html">Terms & Conditions</a></li> |-->
      <!--<li><a href="contact.html">Contact Us</a></li> -->
      <!--</ul>-->
      <!--</div>-->
      <div class="clear"></div>
    </div>
  </div>
  </div>
  </body>
  </html>
