<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../../taglib.jsp" %>
<html>
<head>
    <title>千寻</title>
</head>
<body>
    <form class="layui-form" action="" style="margin-top: 100px; margin-left: 200px;">
        <table>
            <tr>
                <td>编号</td>
                <td>名称</td>
                <td>存放路径</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${userEntities}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.imageName}</td>
                    <td>${item.imagePath}</td>
                    <td><a href="/showImage.do?filename=${item.imageName}">查看大图</a></td>
                </tr>
            </c:forEach>
        </table>
        <div id="demo1"></div>
    </form>

<script type="text/javascript">
    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
                , layer = layui.layer;
        /*laypage({
            cont: 'demo1'
            ,pages: 100 //总页数
            ,groups: 5 //连续显示分页数
        });*/

        //调用分页
        //LoginInfoController/realnameCheckList.do?pageNo='+page
        laypage({
            cont: 'demo1'
            ,pages: Math.ceil(${pageInfo.total}) //得到总页数
            ,jump: function(obj,first){
                alert('${pageInfo.pageNo}')
                var curr = '${pageInfo.pageNo}';
                if(first == true){
                    curr = '${pageInfo.pageNo}';
                }else{
                    curr = obj.curr;
                    $('#main').load('${path}/test/toImage.do?pageNo='+curr);
                }
                //$('#main').load('${path}/test/toImage.do?pageNo='+curr);
            }
        });
    });
</script>
</body>
</html>
