
$(document).ready(function () {
    $('#addPro').click(function () {
        $.ajax({
            type: "POST",
            url: "../router/rest",
            data: JSON.stringify({
                productName: $('#productName').val(),
                productInfo: $('#producInfo').val(),
                projectName: $('#projectName').val(),
                securityLevel: $('#securityLevel').val(),
                expectedReturn: $('#expectedReturn').val(),
                productLife: $('#productLife').val(),
                incomeStyle: $('#incomeStyle').val(),
                valueDate: $('#valueDate').val(),
                saleTime: $('#saleTime').datebox('getValue'),
                productChannel: $('#productChannel').val(),
                removeTime: $('#removeTime').datebox('getValue'),
                totalAmount: $('#totalAmount').val(),
                startMoney: $('#startMoney').val(),
                incrementCount: $('#incrementCount').val(),
                "appId": "pmwlid",
                "eventTime": "1470385431201",
                "sign": "AD24265E21175277FAA736642644D2D4",
                method: "lu.app.product.write"
            }),
            dataType: "JSON",
            success: function (res) {
                if (res.status == "1") {
                    sweetAlert("", "添加产品成功", "success");

                } else {
                    sweetAlert("", res.mes, "error");
                }
            }
        });

    })
})



