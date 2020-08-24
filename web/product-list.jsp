<%--
  Created by IntelliJ IDEA.
  User: bonbon
  Date: 2020/5/27
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bb.domain.User" %>
<%@ page import="com.bb.dao.UserDao" %>
<%@ page import="com.bb.domain.Employee" %>
<%@ page import="com.bb.dao.EmployeeDao" %>
<%@ page import="com.bb.dao.CatDao" %>
<%@ page import="com.bb.domain.Cat" %>
<%@ page import="com.bb.dao.ProductDao" %>
<%@ page import="com.bb.domain.Product" %>
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

    <script src="static/js/adminUpdateInfo.js"></script>
    <script src="static/js/adminUpdatePwd.js"></script>

</head>

<body bgcolor="white" text="#FF0000" background="static/img/miao4.jpg">

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
                    <a class="navbar-brand" href="index2.jsp"><strong>Welcome to the Cat Cafe management system</strong></a>
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
                    <a href="employee-list.jsp"><i class="glyphicon glyphicon-chevron-right"></i> Employee</a>
                </li>
                <li>
                    <a href="cat-list.jsp"><i class="glyphicon glyphicon-chevron-right"></i> Cat</a>
                </li>
                <li>
                    <a href="product-list.jsp"><i class="glyphicon glyphicon-chevron-right"></i> Commodity</a>
                </li>
            </ul>
        </div>

        <!-- content -->
        <div class="col-md-10">

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">Management</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <form class="form-horizontal" action="selectProductServlet" method="post">
                                <input type="hidden" name="tip" value="2">
                                <div class="col-lg-8 form-group">
                                    <%--@declare id="query_bname"--%><label class="col-lg-4 control-label" for="query_bname">Commodity's name</label>
                                    <div class="col-lg-8">
                                        <input class="form-control" id="bookName" name="name" type="text" value="">
                                        <label class="control-label" for="query_bname" style="display: none;"></label>
                                    </div>
                                </div>


                                <div class="col-lg-4 form-group">

                                    <button type="submit" class="btn btn-primary" id="btn_query" >Inquire</button>
                                </div>
                            </form>
                            <button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal" style="position: absolute;right: 220px;margin-top: -13px">Add</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Selling price</th>
                            <th>Cost</th>
                            <th>Profit</th>

                            <th style="text-align: center">Operation</th>
                        </tr>
                        </thead>
                        <!---在此插入信息-->
                        <!---在此插入信息-->
                        <%
                                ArrayList<Product> productData = new ArrayList<>();
                                productData = (ArrayList<Product>)request.getAttribute("data");
                                if (productData == null) {
                                    ProductDao productDao = new ProductDao();
                                    productData = (ArrayList<Product>)productDao.findAll();
                                }
                                for (Product product : productData) {
                        %>
                        <tbody>
                        <td><%= product.getName() %></td>

                        <td><%= product.getSale() %></td>
                        <td><%= product.getCost() %></td>
                        <td><%= product.getSale() - product.getCost() %></td>
                        <td>
                            <button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal"
                                    id="btn_update" onclick="showInfo2(<%= product.getId() %>,<%= product.getSale()%>,<%= product.getCost() %>)">alter</button>
                        <button type="button" class="btn btn-danger btn-xs" onclick="deleteProduct(<%= product.getId() %>)">delete</button>
                        </td>
                        </tbody>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        showInfo2=function(id,sale,cost) {
            // document.getElementById("updateName").value = name;
            document.getElementById("updateId").value = id;
            document.getElementById("updateSale").value = sale;
            document.getElementById("updateCost").value = cost;
        }
        function deleteProduct(id) {
            con=confirm("delete or not?");
            if(con==true){
                location.href = "deleteProductServlet?id="+id;
            }
        }
    </script>

    <!-- 修改 -->
    <form class="form-horizontal" method="post" action="updateProductServlet">   <!--保证样式水平不混乱-->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="updateModalLabel">
                            Edit commodity's information
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->
                        <div class="form-group" hidden="ture">
                            <label for="firstname" class="col-sm-3 control-label">id</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateId" name="id" >
                                <label class="control-label" for="updateId" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">name</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateName" name="name" >
                                <label class="control-label" for="updateName" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">Selling price</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateSale" name="sale"  >
                                <label class="control-label" for="updateSale" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">Cost</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateCost" name="cost">
                                <label class="control-label" for="updateCost" style="display: none;"></label>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                        </button>
                        <button type="submit" class="btn btn-primary" >
                            Alter
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>

    <!-- 添加 -->
    <form class="form-horizontal" method="post" action="addProductServlet">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            Add new commodity
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateName" name="name"  >${requestScope.product.name}
                                <label class="control-label" for="updateName" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addISBN" required="required" name="name" >
                                <label class="control-label" for="addISBN" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <%--@declare id="firstname"--%><label for="firstname" class="col-sm-3 control-label">Selling price</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addBookName" required="required" name="sale"  >
                                <label class="control-label" for="addBookName" style="display: none;"></label>
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">Cost</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addAutho" required="required" name="cost" >
                                <label class="control-label" for="addAutho" style="display: none;"></label>
                            </div>
                        </div>

                        <!---------------------表单-------------------->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                        </button>
                        <button type="submit" class="btn btn-primary" >
                            Add
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </form>
</div>


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