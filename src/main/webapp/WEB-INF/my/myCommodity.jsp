<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修配连汽配市场</title>
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<!--滚动-->
<script type="text/javascript"  src="${ctx}/js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="${ctx}/js/bxCarousel.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/layer/layer.min.js" type="text/javascript"></script>
<style>
.pagebody1 ul li{display:inline;} 
</style>
<script type="text/javascript">
            $(function() {
                $('.flexslider').flexslider({
                    directionNav: true,
                    pauseOnAction: false
                });
                $('#demo').bxCarousel({
                    display_num: 4,
                    move: 1,
                    auto: true,
                    speed: 1000
                });
				$(".newsfr li").mouseover(function(){
					$(this).addClass("current");
					var href = $(this).find("a").attr("href");
					var title = $(this).find("a").html();
					var pic = $(this).find("input").val();
					var htmls="";
					htmls+="<a href='"+href+"'><img src='"+pic+"' width='401' height='223' /></a>";
					htmls+="<div class='newsname'><a href='"+href+"'>· "+title+"</a></div>";
					$(".newsfl").html(htmls);
				})
				
				$(".newsfr li").mouseout(function(){
					$(this).removeClass("current");
				})
            });
</script>       
<script type="text/javascript">
    
	function mygoods(id) {

        var url = "${ctx}/my/toEdit?id="+id;
        $.layer({
            type : 2,
            title : false,//关闭按钮
            shadeClose : false,
            shade : [ 0.6, '#000' ],//遮罩
            border : [ 0, 0, '#ccc' ],//边框
            area : [ '500px', '450px' ],//宽高
            iframe : {
                src : '' + url + ''
            },
            shift : [ "top" ], //从下面动画弹出
            end : function() {
                window.location.reload();
            }
        });
	} 

    function deleteById(id,picUrl){

        if(confirm("确定要删除吗?")){
            var url = "${ctx}/my/deleteItemById?id="+id+"&picUrl="+picUrl;
            $.ajax({
                url:url,    //请求的url地址
                async:true,//请求是否异步，默认为异步，这也是ajax重要特性
                type:"post",   //请求方式
                success:function(data){
                    window.location.reload();
                }
            });
        }
    }

</script>
<script type="text/javascript">
	function history() {

        var url = "${ctx}/my/toAddPrime";
        $.layer({
            type : 2,
            title : false,//关闭按钮
            shadeClose : false,
            shade : [ 0.6, '#000' ],//遮罩
            border : [ 0, 0, '#ccc' ],//边框
            area : [ '500px', '450px' ],//宽高
            iframe : {
                src : '' + url + ''
            },
            shift : [ "top" ], //从下面动画弹出
            end : function() {
                window.location.reload();
            }
        });
	}
    // 如果在框架中，则跳转刷新上级页面

</script>
</head>
<body>
	
        <div class="bg_color1">
    <div class="pagebody1">
    	<div class="wid">
                <ul class="ht1">
                    <li class="big3"><a href="${ctx}/salecommodityAction.do?method=myList">我的货架</a></li>
                    <li class="big4"><a href="${ctx}/salecollectionAction.do?method=myCollection">我的收藏</a></li>
                    <li class="small">共<span>${totalRows}</span>个商品</li>
                    <li><button class="new1" onclick="history();" style="cursor:pointer;">新增货架</button></li>
                </ul>
                <div class="clear"></div>
        </div>
        <div class="wid">  
        <div class="pagebody10"><!--图片滚动1-->
        	<div class="wid2">
                    <ul id="demo">
                        <c:forEach var="items" items="${page.list}" >
                            <li  >
                                <dt onclick="<c:if test="${empty items.title}">history('${userFlag}');</c:if><c:if test="${not empty items.title}">productgroupedit('${items.id}');</c:if>"><a href="#"><c:if test="${not empty items.picUrl}"><img src="${items.picUrl}"/></c:if>
                                
                                <c:if test="${empty items.picUrl}"><img src="${items}/images/tu007.png"/></c:if>
                                
                                
                                </a></dt>
                                <c:if test="${not empty items.title}">
                                    <dd>
                                            <h3>
                                                <a class="a2" onclick="deleteById('${items.id}','${items.picUrl}')"  href="#">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                                <a class="a1" onclick="mygoods('${items.id}');" href="#">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                                <span title="${items.title}" style="cursor:pointer;">
                                                        ${items.title}
                                                    <br/>

                                           </span>

                                                </p>
                                            </h3>
                                            <p>${items.updateTime}</p>
                                    </dd>
                                </c:if>
                            </li>
                        </c:forEach>
                        <div class="clear"></div>
                    </ul>
                    </div>
                </div><!--图片滚动1-->
	<div class="scrollcon mar3"><!--图片滚动2-->
    <div class="wid">
		<div class="LeftBotton" onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()"></div>
		<div class="Cont" id="ISL_Cont">
			<div class="ScrCont">



				<div id="List2"></div>
			</div>
        </div>
		<div class="RightBotton" onmousedown="ISL_GoDown()" onmouseup="ISL_StopDown()" onmouseout="ISL_StopDown()"></div>
        </div>
            <!--翻页按钮-->
        <div class="pageTab"><!--翻页按钮-->
            <ul class="page">
                <c:forEach begin="1" end="${page.pages}" var="pageNo">
                    <c:choose>
                        <c:when test="${pageNo==page.pageNum}">
                            <a href="${ctx}/my/myItems?pageNo=${pageNo}&pageSize=8" style="background: #C30D23 none repeat scroll 0% 0%;color:#ffffff;">${pageNo}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${ctx}/my/myItems?pageNo=${pageNo}&pageSize=8" >${pageNo}</a>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </ul>
            <div class="clear"></div>
        </div><!--翻页按钮-->

    </div><!--图片滚动2-->


        </div>


<script>
var Speed = 0.001;//速度(毫秒)
var Space = 1;//每次移动(px)
var PageWidth = 254;//翻页宽度
var fill = 0;//整体移位
var MoveLock = false;
var MoveTimeObj;
var Comp = 0;
var AutoPlayObj = null;
GetObj("List2").innerHTML = GetObj("List1").innerHTML;
GetObj('ISL_Cont').scrollLeft = fill;
GetObj("ISL_Cont").onmouseover = function(){
	clearInterval(AutoPlayObj);
}
GetObj("ISL_Cont").onmouseout = function(){
	AutoPlay();
}

AutoPlay();

function GetObj(objName){
	if(document.getElementById){
		return eval('document.getElementById("'+objName+'")')
	}else{
		return eval('document.all.'+objName)
	}
}

function AutoPlay(){ //自动滚动
	clearInterval(AutoPlayObj);
	AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();',6000);//间隔时间
}

function ISL_GoUp(){ //上翻开始
	if(MoveLock) return;
	clearInterval(AutoPlayObj);
	MoveLock = true;
	MoveTimeObj = setInterval('ISL_ScrUp();',Speed);
}

function ISL_StopUp(){ //上翻停止
	clearInterval(MoveTimeObj);
	if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0){
		Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
		CompScr();
	}else{
		MoveLock = false;
	}
	AutoPlay();
}

function ISL_ScrUp(){ //上翻动作
	if(GetObj('ISL_Cont').scrollLeft <= 0){
		GetObj('ISL_Cont').scrollLeft = GetObj('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth
	}
		GetObj('ISL_Cont').scrollLeft -= Space ;
}

function ISL_GoDown(){ //下翻
	clearInterval(MoveTimeObj);
	if(MoveLock) return;
	clearInterval(AutoPlayObj);
	MoveLock = true;
	ISL_ScrDown();
	MoveTimeObj = setInterval('ISL_ScrDown()',Speed);
}
function ISL_StopDown(){ //下翻停止
	clearInterval(MoveTimeObj);
	if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0 ){
		Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth + fill;
		CompScr();
	}else{
		MoveLock = false;
	}
	AutoPlay();
}

function ISL_ScrDown(){ //下翻动作
	if(GetObj('ISL_Cont').scrollLeft >= GetObj('List1').scrollWidth){
		GetObj('ISL_Cont').scrollLeft = GetObj('ISL_Cont').scrollLeft - GetObj('List1').scrollWidth;
	}
	GetObj('ISL_Cont').scrollLeft += Space ;
}

function CompScr(){
	var num;
	if(Comp == 0){
		MoveLock = false;return;
	}
	if(Comp < 0){ //上翻
		if(Comp < -Space){
			Comp += Space;
			num = Space;
		}else{
			num = -Comp;
			Comp = 0;
		}
		GetObj('ISL_Cont').scrollLeft -= num;
		setTimeout('CompScr()',Speed);
	}else{ //下翻
		if(Comp > Space){
			Comp -= Space;
			num = Space;
		}else{
			num = Comp;
			Comp = 0;
		}
		GetObj('ISL_Cont').scrollLeft += num;
		setTimeout('CompScr()',Speed);
	}
}


    
	function productgroupedit(id) {
			$.jBox("iframe:${ctx}/salecommodityAction.do?method=toMyDetail&id="+id, {
			title : "查看原图",
			width : 1020,
			height : 700,
			buttons : { /*'关闭': true*/}
		});
	} 
</script>
        <div class="clear"></div>
    </div>
    </div>
    <div class="bg_color2">
    	<div class="footer wid">Copyright © 2014-2024 www.xiupeilian.com  All Rights Reserved. 修配连 版权所有</div>
    </div>

</body>
</html>

