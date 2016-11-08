<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../taglib.jsp" %>
<html>
<head>
    <title>千寻</title>
    <link rel="stylesheet" href="${path}/layui/css/layui.css">
</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item"><a href="">最新活动</a></li>
</ul>

<div id="menu">
    <ul class="layui-nav layui-nav-tree layui-nav-side" style="margin-top: 57px;">
        <li class="layui-nav-item"><a href="javascript:void (0);">最新活动</a></li>
        <li class="layui-nav-item"><a href="javascript:void (0);">产品</a></li>
        <li class="layui-nav-item"><a href="javascript:void (0);">解决方案</a></li>
        <li class="layui-nav-item"><a href="javascript:void (0);" onclick="changePage('/test/toform.do');">表单</a></li>
        <li class="layui-nav-item"><a href="javascript:void (0);" onclick="changePage('/test/toImage.do');">表格</a></li>
    </ul>
</div>

<div id="main">
    <div id="welcome" style="margin-top: 57px; margin-left: 200px;">
        <h4>欢迎!</h4>
    </div>
    <div id="content" style="display: none;">

    </div>
</div>

<script src="${path}/assets/js/jquery-1.8.2.min.js"></script>
<script src="${path}/layui/layui.js"></script>
<script src="${path}/layui/lay/dest/layui.all.js"></script>

<script type="text/javascript">
    function changePage(url) {
        $('#welcome').hide();
        $('#content').show();
        $('#main').load('${path}'+url);
    }
    $('#menu ul li').mousedown(function(e){
        if(e.which == 1){
            $(this).siblings().removeClass("layui-this");
            $(this).addClass("layui-this");
        }
    });

</script>
</body>
</html>