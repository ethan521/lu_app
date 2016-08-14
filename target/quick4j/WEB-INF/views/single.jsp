<%@ page import="com.model.UserInfo" %>
<%@ page import="com.model.ProductInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mapper.ProductInfoMapper" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.biz.product.Product" %>
<%@ page import="com.dto.ProSearchResponseDto" %>
<%--
  Created by IntelliJ IDEA.
  User: zhengxiaojie252
  Date: 2016/8/10
  Time: 21:03
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
    <script type="text/javascript" id="sourcecode">
      $(function()
      {
        $('.scroll-pane').jScrollPane();
      });
      $(function()
      {
        $('.circle').each(function(index, el)
        {
          var num = $(this).find('span').text() * 3.6;
          if (num<=180)
          {
            $(this).find('.right').css('transform', "rotate(" + num + "deg)");
          }
          else
          {
            $(this).find('.right').css('transform', "rotate(180deg)");
            $(this).find('.left').css('transform', "rotate(" + (num - 180) + "deg)");
          };
        });
      });
    </script>
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


      $(function () {
        $('#container').highcharts({
          title: {
            text: '   ',
            style: {
              fontSize: "18px",
              fontFamily: "Microsoft Yahei"
            }
          },
          xAxis: {
            title:{
              text:'日期'
            },
            categories: ['15-08', '15-09', '15-10', '15-11', '15-12', '16-01', '16-02', '16-03', '16-04', '16-05', '16-06', '16-07']
          },
          yAxis:{
            title:{
              text:'收益率（%）'
            }
          },
          series: [{
            name:'近年月均收益回顾',
            style: {
              fontSize: "18px",
              fontFamily: "Microsoft Yahei"
            },
            data: [-3.03, -1.26, -0.32, 1.32, 4.50, 2.76, 3.76, 4.85, 2.47, 4.41, 3.66, 4.14]
          }]
//			}, function (chart) { // on complete
//				chart.renderer.text(' <span style="color: red">***私募基金第二期</span> and <a href="http://example.com">linked</a>', 150, 80)
//						.css({
//							color: '#4572A7',
//							fontSize: '16px'
//						})
//						.add();
//			});
        });
      });

    </script>
    <!-- start zoom -->
    <link rel="stylesheet" href="../../statics/css/zoome-min.css" />
    <script type="text/javascript" src="../../statics/js/zoome-e.js"></script>
    <script type="text/javascript">
      $(function(){
        $('#img1,#img2,#img3,#img4').zoome({showZoomState:true,magnifierSize:[250,250]});
      });
    </script>
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
        <ul class="breadcrumb breadcrumb__t"><a class="home" href="product.html">首页</a>  / 产品详情</ul>
        <div class="cont span_2_of_3">
          <div class="product-detail-head">
            <div class="product-name-info">
              <i class="product-logo">项目名称：${list.projectName}</i>
              <p class=" product-c">上架日期：${list.saleTime}</p>
            </div>
          </div>
          <ul class="rate-list-left">
            <li class="rate-col">
              <p class="p1">预期年化利率</p>
              <p class="p2">
                <strong>${list.expectedReturn}</strong>
              </p>
            </li>
            <li class="date-col">
              <p class="p1">期限</p>
              <p class="p2">
                <strong>${list.productLife}日</strong>
              </p>
            </li>
            <li class="collection-col">
              <p class="p1">收益方式</p>
              <p class="p2">
                <strong>每月等额本息</strong>
              </p>
            </li>
            <li class="last-col">
              <p class="p1">起息日</p>
              <p class="p2">
                <strong>T+1日</strong>
              </p>
            </li>
            <li class="safety-col">
              <p class="p1">安全等级</p>
              <p class="p2">${list.securityLevel}</p>
            </li>
          </ul>
          <ul class="btn_form">
            <form>
              <a href="javascript:;" onclick="buypop1();"><input type="button" value="充值"></a>
            </form>
            <form>
              <a href="javascript:;" onclick="buypop2();"><input type="button" value="购买"></a>
            </form>
          </ul>
          <div class="rate-list-left-con">
            <div class="progress-box">
              <p class="progress-title">项目进度：</p>
              <div class="circle">
                <div class="pie_left"><div class="left"></div></div>
                <div class="pie_right"><div class="right"></div></div>
                <div class="mask"><span>${list.perc}</span>%</div>
              </div>
            </div>
          </div>
          <!--<span class="m_link"><a href="#">login to save in wishlist</a> </span>-->
          <div class="clear"></div>
          <div class="progress-content">
            <div class="progress-sum">
              <h3 class="progress-sum-title">产品概述:</h3>
              <p class="progress-sum-details">“${list.productName}”是上海陆家嘴国际金融资产交易市场股份有限公司及上海陆金所互联网金融信息服务有限公司（以下合称“陆金所”）于其网站平台上向投资方（投资人，即出借人）和融资方（借款人）推出的个人投融资服务。借贷双方通过“稳盈-安e+”服务可以快捷方便地达成借款交易并完成资金的借出和借入。“稳盈-安e+”服务仅向符合中华人民共和国有关法律法规及陆金所相关规定的合格投资人和借款人提供。</p>
            </div>
            <div class="progress-details">
              <h3 class="progress-details-title">产品详情：</h3>
              <table class="progress-details-det Tc MT5" cellpadding="0" border="0">
                <tbody>
                <tr>
                  <td class="prod-1">产品名称</td>
                  <td class="prod-2" id="productName">${list.productName}</td>
                </tr>
                <tr>
                  <td class="prod-1">上架日期</td>
                  <td class="prod-3">${list.saleTime}</td>
                  <td class="prod-1">项目名称</td>
                  <td class="prod-3">${list.saleTime}</td>
                </tr>
                <tr>
                  <td class="prod-1">投资策略</td>
                  <td class="prod-3">股票投资</td>
                  <td class="prod-1">受托人</td>
                  <td class="prod-3">陆金所</td>
                </tr>
                <tr>
                  <td class="prod-1">募集金额</td>
                  <td class="prod-3">${list.totalAmount}</td>
                  <td class="prod-1">起投金额</td>
                  <td class="prod-3">${list.startMoney}</td>
                </tr>
                <tr>
                  <td class="prod-1">递增金额</td>
                  <td class="prod-3">${list.incrementCount}</td>
                  <td class="prod-1">认购费率</td>
                  <td class="prod-3">0.12%</td>
                </tr>
                <tr>
                  <td class="prod-1">赎回费率</td>
                  <td class="prod-3">0.22%</td>
                  <td class="prod-1">管理费率</td>
                  <td class="prod-3">0.14%</td>
                </tr>
                </tbody>
              </table>
            </div>
            <div id="container" style="min-width:400px;height:400px"></div>
          </div>
          <h3 class="progress-state">
            <span class="progress-state-red">免责声明：</span>
            “本网站所有资讯与说明文字仅供参考，不作为投资依据，如有与本公司相关公告及信托法律文件不符，以相关公告及信托法律文件为准。”
          </h3>
          <div class="clients">
            <script type="text/javascript">
              $(window).load(function() {
                $("#flexiselDemo1").flexisel();
                $("#flexiselDemo2").flexisel({
                  enableResponsiveBreakpoints: true,
                  responsiveBreakpoints: {
                    portrait: {
                      changePoint:480,
                      visibleItems: 1
                    },
                    landscape: {
                      changePoint:640,
                      visibleItems: 2
                    },
                    tablet: {
                      changePoint:768,
                      visibleItems: 3
                    }
                  }
                });

                $("#flexiselDemo3").flexisel({
                  visibleItems: 5,
                  animationSpeed: 1000,
                  autoPlay: true,
                  autoPlaySpeed: 3000,
                  pauseOnHover: true,
                  enableResponsiveBreakpoints: true,
                  responsiveBreakpoints: {
                    portrait: {
                      changePoint:480,
                      visibleItems: 1
                    },
                    landscape: {
                      changePoint:640,
                      visibleItems: 2
                    },
                    tablet: {
                      changePoint:768,
                      visibleItems: 3
                    }
                  }
                });

              });
            </script>
            <script type="text/javascript" src="../../statics/js/jquery.flexisel.js"></script>
          </div>
        </div>
        <div class="right-list">
          <div class="progress-problem">
            <div class="pb-head">
              <span class="pb-title">常见问题</span>
              <a href="help.html" class="pb-more" target="_blank" data-sk="">more</a>
            </div>
            <ul class="pb-list">
              <li class="list-term">
                <a href="help.html" target="_blank">取现多久可以到账</a>
              </li>
              <li class="list-term">
                <a href="help.html" target="_blank">赎回费率多少</a>
              </li>
              <li class="list-term">
                <a href="help.html" target="_blank">忘记密码怎么办</a>
              </li>
              <li class="list-term">
                <a href="help.html" target="_blank">投资券怎么使用</a>
              </li>
            </ul>
          </div>
          <div class="ad-img2">
            <a href="product.html" target="_blank" >
              <img src="../../statics/pic/ad-2.png" alt style="width: 100%;">
            </a>
          </div>
          <div class="ad-img3">
            <a href="product.html" target="_blank" >
              <img src="../../statics/pic/ad-3.png" alt style="width: 100%;">
            </a>
          </div>
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
  <div class="buy1">
    <div class="banner"><span>充值</span></div>
    <div class="cz">充值金额：<input type="text" id="rechargeValue"/>元</div>
    <div class="cz2"><input type="button" value="充值" id="rechargeBtn"></div>
    <div class="close">
      <img src="../../statics/pic/close.PNG">
    </div>
  </div>
  <div id="backpa"></div>

  <div class="buy2">
    <div class="banner"><span>购买</span></div>
    <div class="cz">购买金额：<input type="text" id="buyValue"/>元<i class="cz4">（剩余${list.remainAmount}>元）</i> <p class="cz3">(起投金额${list.startMoney}元,递增金额${list.incrementCount}元)</p></div>
    <div class="cz2"><input type="button" value="购买" id="buyBtn"></div>
    <div class="close">
      <img src="../../statics/pic/close.PNG">
    </div>
  </div>
  <div id="ba1ckpa"></div>
  </body>
  <script>
    $(function(){
      $(".cz2 input").button();
      $(".close").click(function(){
        $(".buy1").attr("display","none");
      });
    });
    function buypop1(){
      $(".buy1,#backpa").show();
      $(".close,#backpa").click(function(){
        $(".buy1,#backpa").hide();

      });
    };
    $(function(){
      $(".cz2 input").button();
      $(".close").click(function(){
        $(".buy2").attr("display","none");
      });
    });
    function buypop2(){
      $(".buy2,#backpa").show();
      $(".close,#backpa").click(function(){
        $(".buy2,#backpa").hide();

      });
    };
  </script>
  </html>
