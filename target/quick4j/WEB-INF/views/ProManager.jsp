<%--
  Created by IntelliJ IDEA.
  User: junming.qi
  Date: 2015/11/19
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="common/common.jsp"></jsp:include>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/backstage/proManager.js"></script>
    <script type="text/javascript">
        function myformatter(date) {
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();
            var h = date.getHours();
            var M = date.getMinutes();
            var s = date.getSeconds();
            return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d) + ' ' + (h < 10 ? ('0' + h) : h) + ':' + (M < 10 ? ('0' + M) : M) + ':' + (s < 10 ? ('0' + s) : s);
        }
        function myparser(s) {
            if (!s) return new Date();
            var ss = (s.split(' '));
            ssa = ss[0].split('-')
            var y = parseInt(ssa[0], 10);
            var m = parseInt(ssa[1], 10);
            var d = parseInt(ssa[2], 10);
            var ssb = (ss[1].split(':'));
            var h = parseInt(ssb[0], 10);
            var M = parseInt(ssb[1], 10);
            var s = parseInt(ssb[2], 10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d) && !isNaN(h) && !isNaN(M) && !isNaN(s)) {
                return new Date(y, m - 1, d, h, M, s);
            } else {
                return new Date();
            }
        }
    </script>
</head>
<body>
<div id="level" style="padding:5px;height:auto">
    产品名称: <input class="easyui-textbox" id="productName" data-options="prompt:'输入产品名称'" style="width:260px;height:25px"><font style="color: #ff0000">*</font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    产品信息: <input class="easyui-textbox" id="producInfo" data-options="prompt:'输入产品信息'" style="width:260px;height:25px"><font style="color: #ff0000">*</font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    项目名称: <input class="easyui-textbox" id="projectName" data-options="prompt:'输入项目名称'" style="width:260px;height:25px"><font style="color: #ff0000">*</font>
    &nbsp;&nbsp;&nbsp;&nbsp;<div>
    <div id="leve2l" style="padding:5px;height:auto">

    安全等级: <select class="easyui-combobox" panelHeight="auto" style="width:250px" id="securityLevel">
    <option value="保守型">保守型</option>
    <option value="稳健型">稳健型</option>
    <option value="平衡型">平衡型</option>
    <option value="成长型">成长型</option>
    <option value="进取型">进取型</option>
</select><font style="color: #ff0000">*</font>
    &nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    产品渠道: <select class="easyui-combobox" panelHeight="auto" style="width:250px" id="productChannel">
    <option value="网站和移动端">网站和移动端</option>
    <option value="仅网站">仅网站</option>
    <option value="仅移动端">仅移动端</option>
</select><font style="color: #ff0000">*</font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    年化利率: <input class="easyui-textbox" id="expectedReturn" data-options="prompt:'输入年化利率'" style="width:260px;height:25px"><font style="color: #ff0000">*</font>
        &nbsp;&nbsp;&nbsp;
    </div>  <div id="lev2e2l" style="padding:5px;height:auto">

        收益方式: <input class="easyui-textbox" id="incomeStyle" data-options="prompt:'输入收益方式'" style="width:250px;height:25px"><font style="color: #ff0000">*</font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    产品期限: <input class="easyui-textbox" id="productLife" data-options="prompt:'输入产品期限'" style="width:250px;height:25px"><font style="color: #ff0000">*</font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    起投金额: <input class="easyui-textbox" id="startMoney" data-options="prompt:'输入起投金额 '" style="width:250px;height:25px"><font style="color: #ff0000">*</font>
</div>
<div id="le3ve21l" style="padding:5px;height:auto">

    总金额: <input class="easyui-textbox" id="totalAmount" data-options="prompt:'输入总金额 '" style="width:250px;height:25px"><font style="color: #ff0000">*</font>

    &nbsp;&nbsp;&nbsp;
    递增金额: <input class="easyui-textbox" id="incrementCount" data-options="prompt:'递增金额 '" style="width:250px;height:25px"><font style="color: #ff0000">*</font>

</div>
<div id="tb" style="padding:5px;height:auto">
    上架日期: <input class="easyui-datetimebox" style="width:180px" id="saleTime"
                 data-options="formatter:myformatter,parser:myparser,prompt:'请选择上架日期'">
    &nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


    下架日期 <input class="easyui-datetimebox" style="width:180px" id="removeTime"
                data-options="formatter:myformatter,parser:myparser,prompt:'请选择下架日期'">
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" id="addPro">添加</a>
</div>
<div id="messageWin">
</div>
</body>
</html>
