$(document).ready(function () {
        $.ajax({
            type: "POST",
            url: "../router/rest",
            data: JSON.stringify({
                "appId": "pmwlid",
                "eventTime": "1470385431201",
                "sign": "AD24265E21175277FAA736642644D2D4",
                method: "lu.app.product.search"
            }),
            dataType: "JSON",
            success: function (res) {
                if (res.status == "1") {
                } else {
                    sweetAlert("", res.message, "error");
                }
            }
        });

})