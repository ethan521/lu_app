/**
 * Created by caochengyuan672 on 2016/8/10.
 */

jQuery(document).ready(function(){

    showChangedLoginStatus();
    //alert(jQuery("a[href='user/logout']").html());
    //getProductInfoList();
    jQuery("#user_info").click(function(){
        //alert("确定注销？");
        //href="user/logout"
        window.location.href = "#";
    });
    jQuery("#logout").click(function(){
        //alert("确定注销？");
        if(confirm("确定注销？"))
        {
            jQuery.ajax({url:"user/logout",async:false, success:function(){

                //alert(arguments[1]);

                if("success"==arguments[1]){
                    alert(arguments[0].message);
                }
            }
            })

        }
        //href="user/logout"
        jQuery("#not_login").show();
        jQuery("#have_login").hide();
        window.location.href = "/register";



    });

    jQuery("#rechargeBtn").click(function(){
        //alert("充值");
        var rechargeValue = jQuery("#rechargeValue").val().trim();
        //alert(rechargeValue);
        var userName = jQuery("#user-info").html().trim();
        //alert(userName);
        //alert(rechargeValue);

        $.ajax({
            type: "POST",
            url: "../router/rest",
            data: JSON.stringify({
                userName:userName ,
                rechargeMoney:rechargeValue,
                method: "lu.app.book.recharge",
                appId: "pmwlid",
                eventTime: "1470385431201",
                sign: "AD24265E21175277FAA736642644D2D4"
            }),
            dataType: "JSON",
            contentType: "application/json; charset=utf-8",
            success: function () {
                //alert(arguments[1]);
                if("success"==arguments[1]){
                    //alert(arguments[0].message);
                    //var proList = arguments[0].proList;
                    //alert("产品数量为："+proList.length);
                    alert(arguments[0].message);


                }

            }

        });



    });

    jQuery("#buyBtn").click(function(){
        //alert("充值");
        var bookMoney = jQuery("#buyValue").val().trim();
        //alert(rechargeValue);
        var userName = jQuery("#user-info").html().trim();

        var productName = jQuery("#productName").html().trim();

        //alert(userName);
        //alert(rechargeValue);

        $.ajax({
            type: "POST",
            url: "../router/rest",
            data: JSON.stringify({
                userName:userName ,
                bookMoney:bookMoney,
                productName:productName,
                method: "lu.app.book.apply",
                appId: "pmwlid",
                eventTime: "1470385431201",
                sign: "AD24265E21175277FAA736642644D2D4"
            }),
            dataType: "JSON",
            contentType: "application/json; charset=utf-8",
            success: function () {
                //alert(arguments[1]);
                if("success"==arguments[1]){
                    //alert(arguments[0].message);
                    //var proList = arguments[0].proList;
                    //alert("产品数量为："+proList.length);
                    alert(arguments[0].message);


                }

            }

        });



    });


});

function showChangedLoginStatus(){
    var userName = jQuery("#user-info").html().trim();
    //alert(have_login_lab_cont);
    //alert("用户名："+userName);
    //var userName = have_login_lab_cont.split(",")[1].split("/")[0].trim();
    if (null == userName || 0 == userName.length )
    {
        //alert("用户名为空");
        jQuery("#not_login").show();
        jQuery("#have_login").hide();

    } else
    {
        //("用户名为:"+userName);
        jQuery("#have_login").show();
        jQuery("#not_login").hide();

    }
}

function getProductInfoList(){
    /*
    jQuery.ajax({url:"product/searchByStatus",async:false, success:function(){

        //alert(arguments[1]);

        if("success"==arguments[1]){
            alert(arguments[0].message);
        }
    }
    });*/

    $.ajax({
        type: "POST",
        url: "router/rest",
        data: JSON.stringify({
            productStatus: '1',
            "method": "lu.app.lzd.product.searchByStatus",
            "appId": "pmwlid",
            "eventTime": "1470385431201",
            "sign": "AD24265E21175277FAA736642644D2D4"
        }),
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        success: function () {

            if("success"==arguments[1]){
                //alert(arguments[0].message);
                var proList = arguments[0].proList;
                alert("产品数量为："+proList.length);
                for (var i=0;i<proList.length;i++){
                    //alert(proList[i]);
                    for ( var key in proList[i]){
                        alert("key:"+key+","+"value:"+proList[i][key]);
                    }

                }

            }

        }
    });
}
