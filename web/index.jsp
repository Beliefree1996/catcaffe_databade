<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



{% extends "shubiao.html" %}

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="bootstrap-admin-vertical-centered">
<head>

	<meta charset="UTF-8">
	<title>Cat Cafe System</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	    <link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
        <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
        <script src="static/js/bootstrap.min.js"></script>
        <script src="static/jQuery/jquery-3.1.1.min.js"></script>
        <script src="static/ajax-lib/ajaxutils.js"></script>
         <script src="static/js/login.js"></script>
</head>

<style type="text/css">
        .alert{
            margin: 0 auto 20px;
            text-align: center;
        }


</style>


<body bgcolor="white" text="#FF0000" background="static/img/maoka.png">
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

<script type="text/javascript" src="//cdn.xcmaster.com/snow.js"></script>
<script>
    snow.down()
</script>
<body class="bootstrap-admin-without-padding">


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


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <a class="close" data-dismiss="alert" href="#">&times;</a>
                Welcome to the Cat Cafe
            </div>
            
            <form class="bootstrap-admin-login-form" method="post" action="LoginServlet">
                <%
                    String state = (String)session.getAttribute("state");
                    session.removeAttribute("state");
                    if(state!=null){
                %>
                <label class="control-label" for="username" style="color: red">Wrong password!</label>

                <%}%>
                <div class="form-group">
                    <label class="control-label" for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required="required" placeholder="username"/>
                    <label class="control-label" for="username" style="display:none;"></label>
                </div>
                <div class="form-group">
                    <label class="control-label" for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required="required" placeholder="password"/>
                    <label class="control-label" for="username" style="display:none;"></label>
                </div>
                
                    <label class="control-label" for="password">If you do not have an account, please go to <a href="${pageContext.request.contextPath}/register.jsp" style="color:blue;">register</a></label>
                <br>
                <input type="submit" style="margin-left: 38%" class="btn btn-lg btn-primary"  value="Login"/>
                
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="modal_info" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="infoModalLabel">tips</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12" id="div_info"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btn_info_close" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<audio src="static/music/25%20デート2.mp3" autoplay="autoplay" loop="loop" style="visible:hidden">




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
                var drawSize = 30;
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