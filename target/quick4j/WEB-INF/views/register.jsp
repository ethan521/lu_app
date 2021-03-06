<%--
  Created by IntelliJ IDEA.
  User: hucheng626
  Date: 2016/8/5
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登陆/注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="../../statics/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../../statics/js/login.js"></script>
    <link href="../../statics/css/login2.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/statics/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/sweetalert.css"/>
</head>
<body>
<h1>   &nbsp;</h1>

<div class="login" style="margin-top:30px;">

    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);"
                                           tabindex="7">登录</a>
            <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">注册</a>

            <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: -17px;"></div>
        </div>
    </div>


    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">

        <!--登录-->
        <div class="web_login" id="web_login">
            <div class="login-box">
                <div class="login_form">
                    <form action="#" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm"
                          method="post"><input type="hidden" name="did" value="0"/>
                        <input id="hhhh" type="hidden" name="to" value="log"/>

                        <div class="uinArea" id="uinArea">
                            <div id="loshow" class="cue"></div>
                            <label class="input-tips" for="u">帐号：</label>

                            <div class="inputOuter" id="uArea">

                                <input id="userName" type="text" id="u" name="username" class="inputstyle"/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips" for="p">密码：</label>

                            <div class="inputOuter" id="pArea">

                                <input id="password" type="password" id="p" name="p" class="inputstyle"/>
                            </div>
                        </div>
                        <i style="padding-left:150px; "><a href="javascript:void(0);" id="rebutton">还没有账号？去注册</a> </i>

                        <div style="padding-left:50px;margin-top:20px;"><input id="login" value="登 录"
                                                                               style="width:150px;"
                                                                               class="button_blue"/></div>
                    </form>
                </div>

            </div>

        </div>
        <!--登录end-->
    </div>

    <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">

        <div class="web_login">
            <form name="form2" id="regUser" accept-charset="utf-8" action="#" method="post">
                <input type="hidden" name="to" value="reg"/>
                <input type="hidden" name="did" value="0"/>
                <ul class="reg_form" id="reg-ul">
                    <div id="userCue" class="cue"></div>
                    <li>

                        <label for="user" class="input-tips2">用户名：</label>

                        <div class="inputOuter2">
                            <input type="text" id="user" name="user" maxlength="16" class="inputstyle2"/>
                            <i>用户名位4-16字符</i>

                        </div>

                    </li>

                    <li>
                        <label for="passwd" class="input-tips2">密码：</label>

                        <div class="inputOuter2">
                            <input type="password" id="passwd" name="passwd" maxlength="16" class="inputstyle2"/>
                            <i>密码6-16位字符</i>
                        </div>

                    </li>
                    <li>
                        <label for="passwd2" class="input-tips2">确认密码：</label>

                        <div class="inputOuter2">
                            <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2"/>
                            <i>与密码保持一致</i>
                        </div>

                    </li>

                    <li>
                        <label for="phone" class="input-tips2">手机号码：</label>

                        <div class="inputOuter2">
                            <input type="text" id="phone" name="phone" maxlength="11" class="inputstyle2"/>
                        </div>

                    </li>
                    <li>
                        <div class="check">
                            <input type="checkbox" name="q3" id="agree" checked="checked"><i>我已阅读声明</i>
                        </div>
                    </li>
                    <li/>
                    <div class="inputArea">
                        <input type="button" id="reg" style="margin-top:10px;margin-left:85px;" class="button_blue"
                               value="同意协议并注册" onclick="checkjuc();"/> <a href="javascript:;" onclick="popup();"
                                                                          class="zcxy">注册协议</a>
                    </div>

                    </li>
                </ul>
            </form>


        </div>


    </div>
    <!--注册end-->
</div>
<!--协议-->
<div class="rule">
    <div class="showrule">
        <h2>注册声明</h2>

        <p>1.
            本网站只在法律允许的国家中提供本网站所述的产品及服务，所发布的资料无意提供给受法律发布限制的国家的人士或居民使用。本网站提供的产品与服务在法律不允许的国家不构成向任何人士要约邀请，购买投资产品或其他产品服务的邀请。</p>

        <p>2.
            本公司对本网站中所示的任何商标、公司标志及服务标志拥有所有权。未经本公司的书面批准，任何人不得使用。本网站所刊登的资料受版权保护。未经本公司书面同意，该资料任何部分均不得修改、复制、储存于检索系统、传送、抄袭、分发，或用于任何商业或公开用途。</p>

        <p>3.
            本网站为用户提供专业的投资服务，需要对客户资质进行评估，并非所有的客户都可以获得所有产品和服务。您是否符合享受产品和服务的条件，最终的解释权归本网站。我们保留对该网站包含的信息和资料及其显示的条款、条件和说明变更的权利。</p>

        <p>4. 任何在本网站出现的信息包括但不限于评论、预测、图表、指标、理论、直接的或暗示的指示均只作为参考，您须对任何自主决定的行为负责。</p>

        <p>5. 本网站提供的有关评论、投资分析报告、
            预测文章信息等仅供参考。本网站所提供之公司资料等信息，力求但不保证数据的准确性，如有错漏，请以国家指定机构的公示信息为准。本网站不对因本网资料全部或部分内容产生的或因依赖该资料而引致的任何损失承担任何责任。</p>
    </div>
    <div class="inputArea">
        <input type="button" name="q3" id="reg1" style="margin-bottom:20px;margin-left:163px;" class="button_blue"
               value="已知道"/>
    </div>
</div>

<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
<div id="backpa"></div>
</body>
</html>