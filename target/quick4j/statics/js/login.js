$(function () {

    $('#switch_qlogin').click(function () {
        $('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#switch_bottom').animate({left: '-17px', width: '70px'});
        $('#qlogin').css('display', 'none');
        $('#web_qr_login').css('display', 'block');

    });
    $('#switch_login').click(function () {

        $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#switch_bottom').animate({left: '102px', width: '70px'});

        $('#qlogin').css('display', 'block');
        $('#web_qr_login').css('display', 'none');
    });
    if (getParam("a") == '0') {
        $('#switch_login').trigger('click');
    };
    $('#rebutton').click(function () {

        $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#switch_bottom').animate({left: '102px', width: '70px'});

        $('#qlogin').css('display', 'block');
        $('#web_qr_login').css('display', 'none');
    });


});

function logintab() {
    scrollTo(0);
    $('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
    $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
    $('#switch_bottom').animate({left: '154px', width: '96px'});
    $('#qlogin').css('display', 'none');
    $('#web_qr_login').css('display', 'block');

}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) {
    var params = location.search.substr(1); // 获取参数
    var ArrParam = params.split('&');
    if (ArrParam.length == 1) {
        //只有一个参数的情况 
        return params.split('=')[1];
    }
    else {
        //多个参数参数的情况
        for (var i = 0; i < ArrParam.length; i++) {
            if (ArrParam[i].split('=')[0] == pname) {
                return ArrParam[i].split('=')[1];
            }
        }
    }
}


var reMethod = "GET",
    pwdmin = 6;

$(document).ready(function () {

    $('#userCue').html("<font color='red'><b></b></font>");
    $('#reg').click(function () {

        if ($('#user').val() == "") {
            $('#user').focus().css({
                border: "1px solid red",
                boxShadow: "0 0 2px red"
            });
            $('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
            return false;
        }


        if ($('#user').val().length < 4 || $('#user').val().length > 16) {

            $('#user').focus().css({
                border: "1px solid red",
                boxShadow: "0 0 2px red"
            });
            $('#userCue').html("<font color='red'><b>×用户名位4-16字符</b></font>");
            return false;

        }


        if ($('#passwd').val().length < pwdmin) {
            $('#passwd').focus();
            $('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
            return false;
        }
        if ($('#passwd2').val() != $('#passwd').val()) {
            $('#passwd2').focus();
            $('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
            return false;
        }


        if ($('#phone').val().length < 11) {
            $('#phone').focus().css({
                border: "1px solid red",
                boxShadow: "0 0 2px red"
            });
            $('#userCue').html("<font color='red'><b>手机号码格式不正确</b></font>");
            return false;
        } else {
            $('#phone').css({
                border: "1px solid #D7D7D7",
                boxShadow: "none"
            });

        }

        $.ajax({
            type: "POST",
            url: "router/rest",
            data: JSON.stringify({
                userName: $('#user').val(),
                password: $('#passwd').val(),
                mobileNumber: $('#phone').val(),
                "method": "lu.app.user.register",
                "appId": "pmwlid",
                "eventTime": "1470385431201",
                "sign": "AD24265E21175277FAA736642644D2D4"
            }),
            dataType: "JSON",
            contentType: "application/json; charset=utf-8",
            success: function (res) {
                if (res.status == "1") {
                    sweetAlert("", "恭喜你!注册成功,去登陆吧", "success");
                    setTimeout( function(){ window.location.href = "register";}, 3000);

                  //  window.location.href = "register";
                }else {
                    //显示message的错误信息    res.message
                    $("#userCue").html("<font color='red'><b>" + res.message + "</b></font>");
                }
            }
        });

        //$('#agree').ready(function () {
        //    if (this.checked) {
        //        $('[name=q3]:checkbox').attr("checked", true);
        //
        //    } else {
        //        $('[name=q3]:checkbox').attr("checked", false);
        //        $('#userCue').html("<font color='red'><b>请同意协议</b></font>");
        //        return false;
        //    }
        //});
            if($("#agree").attr("checked")=='checked'){
            }else{
                $('#userCue').html("<font color='red'><b>请同意协议</b></font>");
            };






    });

    $('#login').click(function () {
        $.ajax({
            type: "GET",
            url: "user/login",
            data: {
                userName: $('#userName').val(),
                passWord: $('#password').val()
            },
            dataType: "JSON",
            contentType: "application/json; charset=utf-8",
            success: function (res) {
                if (res.status == "1") {
                    window.location.href = "product";
                } else {
                    //显示message的错误信息    res.message
                    $("#loshow").html("<font color='red'><b>" + res.message + "</b></font>");
                }
            }
        });
    });


});

function popup() {
    $(".rule,#backpa").show();
    $("#reg1,#backpa").click(function () {
        $(".rule,#backpa").hide();

    });
}



