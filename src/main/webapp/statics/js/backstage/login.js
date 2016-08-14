$('#loginSubmit').click(function () {
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
                sweetAlert("", "账号或密码错误", "error");
            }
        }
    });

})
