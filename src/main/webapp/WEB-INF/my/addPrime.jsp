<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>新增货架</title>
    <meta name="decorator" content="default"/>
    <link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>

    <script type="text/javascript">
    function addPrime() {
        $.ajax({
            type: "post",
            url: '${ctx}/my/addPrime',
            data: new FormData($('#uploadForm')[0]),//https://developer.mozilla.org/zh-CN/docs/Web/API/FormData/Using_FormData_Objects
            processData: false,//不希望转换的信息  https://segmentfault.com/q/1010000007410014
            contentType: false,//默认情况下会将发送的数据序列化contentType = "application/x-www-form-urlencoded"https://segmentfault.com/q/1010000007410014
            success: function (data) {
                if (self.frameElement && self.frameElement.tagName == "IFRAME") {
                    parent.location.reload();
                }
            }

        });
    }

</script>
</head>
<body >
    
    <body style="background:#efeeec;">
<div class="pagebody6" style="padding:0px;">
        <form action="${ctx}/my/addPrime" enctype="multipart/form-data" method="post" id="uploadForm" >
        <h1 style="font-size:30px;"><span style="margin-left:150px">新增商品</span></h1>
        <div class="margin1 padding3"><span>精品类别</span>
                <select class="xinzeng" id="partId" name="carpartsId" onchange="carPartsChange()">
                        <option value="">请选择</option>
                        <c:forEach var="cp" items="${primeList}">
                                <option value="${cp.id}">${cp.name}</option>
                        </c:forEach>
                </select>
        </div>
        <div class="margin1 padding3"><span>商品标题</span>
                <input type="text" id="title" class="xinzeng" name="title" />
        </div>
        <div class="margin1 padding3"><span>图片路径</span>
                <input class="xinzeng" type="file" name="file" id="button" value="选择上传" />
        </div>
        <div class="margin1 padding3">
                <span class="padding4">货物描述</span>
                <textarea id="content" name="content" class="miaoshu"></textarea>
        </div>
        <input  type="button" class="tianjia" value="添加到我的货架" onclick="addPrime()" />
    </div>
</body>
</body>
</html>
