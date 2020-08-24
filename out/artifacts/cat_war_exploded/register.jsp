<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="This is a index page">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="static/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="static/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="static/assets/css/app.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>

</head>


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





<body data-type="login">
    <script src="static/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                    Choose theme
                </div>
                <div class="tpl-skiner-content-bar">
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    <span class="skiner-color skiner-black" data-color="theme-black"></span>
                </div>
            </div>
        </div>
        <div class="tpl-login">
            <div class="tpl-login-content">
                <div class="tpl-login-title">Register</div>
                <span class="tpl-login-content-info">
                  Create a new account
              </span>

                <form class="am-form tpl-form-line-form" method="post" action="RegisterServlet">
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" id="user-name" name="name" required="required" placeholder="Please input Username">

                    </div>
					<div class="am-form-group">
                        <input type="password" class="tpl-form-input" id="user-name" name="password" required="required" placeholder="Please enter the password">
                    </div>

					
					<div class="am-form-group">

                        <button type="submit" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">Submit</button>

                    </div>
                    <div class="am-form-group">

                        <button type="button" onclick="location.href='index.jsp';" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">Back to login</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="static/assets/js/app.js"></script>



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
                var drawSize = 10;
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