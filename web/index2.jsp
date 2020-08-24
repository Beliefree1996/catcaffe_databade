<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bb.domain.User" %>
<%@ page import="com.bb.dao.UserDao" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
	<meta charset="UTF-8">
	<title>Cat Cafe Management System</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	    <link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
        <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
        <script src="static/js/bootstrap.min.js"></script>
        <script src="static/jQuery/jquery-3.1.1.min.js"></script>
            <script src="static/js/bootstrap-dropdown.min.js"></script>
              <script src="static/js/reader.js"></script>
              
             <script src="ajax-lib/ajaxutils.js"></script>
            <script src="static/js/readerUpdateInfo.js"></script>
             <script src="static/js/readerUpdatePwd.js"></script>

</head>


<body bgcolor="white" text="#FF0000" background="static/img/miao1.jpg">

<body bgcolor="#000000" onLoad="snow()">
<script language="JavaScript">
    <!--
    N = 40;
    Y = new Array();
    X = new Array();
    S = new Array();
    A = new Array();
    B = new Array();
    M = new Array();
    V = (document.layers)?1:0;
    iH=(document.layers)?window.innerHeight:window.document.body.clientHeight;
    iW=(document.layers)?window.innerWidth:window.document.body.clientWidth;
    for (i=0; i < N; i++){
        Y[i]=Math.round(Math.random()*iH);
        X[i]=Math.round(Math.random()*iW);
        S[i]=Math.round(Math.random()*5+2);
        A[i]=0;
        B[i]=Math.random()*0.1+0.1;
        M[i]=Math.round(Math.random()*1+1);
    }
    if (V){
        for (i = 0; i < N; i++)
        {document.write("<LAYER NAME='sn"+i+"' LEFT=0 TOP=0 BGCOLOR='#FFFFF0' CLIP='0,0,"+M[i]+","+M[i]+"'></LAYER>")}
    }
    else{
        document.write('<div style="position:absolute;top:0px;left:0px">');
        document.write('<div style="position:relative">');
        for (i = 0; i < N; i++)
        {document.write('<div id="si" style="position:absolute;top:0;left:0;width:'+M[i]+';height:'+M[i]+';background:#fffff0;font-size:'+M[i]+'"></div>')}
        document.write('</div></div>');
    }
    function snow(){
        var H=(document.layers)?window.innerHeight:window.document.body.clientHeight;
        var W=(document.layers)?window.innerWidth:window.document.body.clientWidth;
        var T=(document.layers)?window.pageYOffset:document.body.scrollTop;
        var L=(document.layers)?window.pageXOffset:document.body.scrollLeft;
        for (i=0; i < N; i++){
            sy=S[i]*Math.sin(90*Math.PI/180);
            sx=S[i]*Math.cos(A[i]);
            Y[i]+=sy;
            X[i]+=sx;
            if (Y[i] > H){
                Y[i]=-10;
                X[i]=Math.round(Math.random()*W);
                M[i]=Math.round(Math.random()*1+1);
                S[i]=Math.round(Math.random()*5+2);
            }
            if (V){document.layers['sn'+i].left=X[i];document.layers['sn'+i].top=Y[i]+T}
            else{si[i].style.pixelLeft=X[i];si[i].style.pixelTop=Y[i]+T}
            A[i]+=B[i];
        }
        setTimeout('snow()',10);
    }
    //-->
</script>
<script language="Javascript">
    <!--
    function selectAll(theField){
        var tempval=eval("document."+theField)
        tempval.focus()
        tempval.select()
    }
    //-->
</script>
</table>
</body>



<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>


<body class="bootstrap-admin-with-small-navbar">
<!-- 判断是否已经登录 -->
<%
User user = new User();
String id = (String)session.getAttribute("id");
UserDao userDao = new UserDao();
    User aidInfo2 = userDao.get_AidInfo2(id);
if (aidInfo2 == null || user == null) {
    response.sendRedirect("./index.jsp");
}
%>
<nav class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="collapse navbar-collapse main-navbar-collapse">
                    <a class="navbar-brand" href="#"><strong>Welcome to the Cat Cafe management system</strong></a>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" role="button" class="dropdown-toggle" data-hover="dropdown"> <i class="glyphicon glyphicon-user"></i>     Welcome，<s:property value="#session.reader.name"/><i class="caret"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="index.jsp">Quit</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <!-- left, vertical navbar -->
        <div class="col-md-2 bootstrap-admin-col-left">
            <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                <li>
                    <a href="${pageContext.request.contextPath}/employee-list.jsp"><i class="glyphicon glyphicon-chevron-right"></i> Employee</a>
                </li>
	            <li>
	                 <a href="${pageContext.request.contextPath}/cat-list.jsp"><i class="glyphicon glyphicon-chevron-right"></i> Cat</a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/product-list.jsp"><i class="glyphicon glyphicon-chevron-right"></i> Commodity</a>
	                </li>

            </ul>
        </div>

        <!-- content -->
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">Employee Management</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>You can intuitively add, delete, modify and check the employees of the Cat Cafe in this system.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        <!-- 判断用户是否登录 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">Cat Management</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>You can intuitively add, delete, modify and check the cats of the Cat Cafe in this system.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
         

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">Commodity Management</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>You can intuitively add, delete, modify and check the Commodities of the Cat Cafe in this system.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<audio src="static/music/13%20飛騨探訪.mp3" autoplay="autoplay" loop="loop" style="visible:hidden">


    <div id="page_end_html">
        <style type="text/css">
            .draw {
                position: fixed;
                width: 1px;
                line-height: 1px;
                pointer-events: none;
            }
            @keyframes floatOne {
                0% {
                    opacity:1;
                }
                50% {
                    opacity:1;
                }
                100% {
                    opacity:0;
                    transform:translate3D(0, -20px, 0) scale(5) rotate(45deg);
                }
            }
        </style><style class="darkreader darkreader--sync" media="screen"></style>
        <script type="text/javascript">
            var H = 0;
            $(document).bind('mousemove touchmove',function(e) {
                e.preventDefault();
                var drawSize = 25;
                var drawType = '♡';
                var floatType = 'floatOne';
                var xPos = e.originalEvent.pageX;
                var yPos = e.originalEvent.pageY;

                $('body').append('<div class="draw" style=" font-size:'+drawSize+'px;left:'+xPos+'px;top:'+yPos+'px;-webkit-animation:'+floatType+' .9s 1;-moz-animation:'+floatType+' .9s 1;color:#FF83FA;">'+drawType+'</div>');

                $('.draw').each(function() {
                    var div = $(this);
                    setTimeout(function() {$(div).remove();},800);
                });
            });
        </script>
    </div>


</body>
</html>