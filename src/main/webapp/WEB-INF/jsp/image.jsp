<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<head>
    <link href="${path}/h/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${path}/h/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/h/css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="${path}/h/css/animate.min.css" rel="stylesheet">
    <link href="${path}/h/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                                <thead>
                                    <tr>
                                        <td>编号</td>
                                        <td>名称</td>
                                        <td>存放路径</td>
                                        <td>操作</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userEntities}" var="item">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.imageName}</td>
                                            <td>${item.imagePath}</td>
                                            <td><a href="/showImage.do?filename=${item.imageName}">查看大图</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="5">
                                        <ul class="pagination pull-right"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src="${path}/h/js/jquery.min.js?v=2.1.4"></script>
    <script src="${path}/h/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${path}/h/js/plugins/footable/footable.all.min.js"></script>
    <script src="${path}/h/js/content.min.js?v=1.0.0"></script>
    <script>
        $(document).ready(function(){$(".footable").footable();$(".footable2").footable()});
    </script>
</body>
