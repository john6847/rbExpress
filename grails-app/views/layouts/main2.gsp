<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>WQ</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/bower_components/bootstrap/dist/css/bootstrap.min.css">


    <!-- Font Awesome -->
    %{--<link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css">--}%
    <!-- Ionicons -->
    %{--<link rel="stylesheet" href="/webjars/ionicons/2.0.1/css/ionicons.min.css">--}%
    <!-- Theme style -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/dist/css/skins/skin-blue.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 3 -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/webjars/AdminLTE/2.4.0/dist/js/adminlte.min.js"></script>


    %{--DATATABLES--}%
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
    <script src="https://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>

    %{--ICONS--}%
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" rel="stylesheet"  type='text/css'>
    <g:layoutHead/>

</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body onload="startTime()" class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="/" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>W</b>Q</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Water</b>Quality</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    %{--<li class="dropdown messages-menu">--}%
                        %{--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--}%
                            %{--<i class="fa fa-envelope-o"></i>--}%
                            %{--<span class="label label-success">4</span>--}%
                        %{--</a>--}%
                        %{--<ul class="dropdown-menu">--}%
                            %{--<li class="header">You have 4 messages</li>--}%
                            %{--<li>--}%
                                %{--<!-- inner menu: contains the actual data -->--}%
                                %{--<ul class="menu">--}%
                                    %{--<li><!-- start message -->--}%
                                        %{--<a href="#">--}%
                                            %{--<div class="pull-left">--}%
                                                %{--<img src="AdminLTE-2.4.0/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">--}%
                                            %{--</div>--}%
                                            %{--<h4>--}%
                                                %{--Support Team--}%
                                                %{--<small><i class="fa fa-clock-o"></i> 5 mins</small>--}%
                                            %{--</h4>--}%
                                            %{--<p>Why not buy a new awesome theme?</p>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<!-- end message -->--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<div class="pull-left">--}%
                                                %{--<img src="AdminLTE-2.4.0/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">--}%
                                            %{--</div>--}%
                                            %{--<h4>--}%
                                                %{--AdminLTE Design Team--}%
                                                %{--<small><i class="fa fa-clock-o"></i> 2 hours</small>--}%
                                            %{--</h4>--}%
                                            %{--<p>Why not buy a new awesome theme?</p>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<div class="pull-left">--}%
                                                %{--<img src="AdminLTE-2.4.0/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">--}%
                                            %{--</div>--}%
                                            %{--<h4>--}%
                                                %{--Developers--}%
                                                %{--<small><i class="fa fa-clock-o"></i> Today</small>--}%
                                            %{--</h4>--}%
                                            %{--<p>Why not buy a new awesome theme?</p>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<div class="pull-left">--}%
                                                %{--<img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">--}%
                                            %{--</div>--}%
                                            %{--<h4>--}%
                                                %{--Sales Department--}%
                                                %{--<small><i class="fa fa-clock-o"></i> Yesterday</small>--}%
                                            %{--</h4>--}%
                                            %{--<p>Why not buy a new awesome theme?</p>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<div class="pull-left">--}%
                                                %{--<img src="AdminLTE-2.4.0/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">--}%
                                            %{--</div>--}%
                                            %{--<h4>--}%
                                                %{--Reviewers--}%
                                                %{--<small><i class="fa fa-clock-o"></i> 2 days</small>--}%
                                            %{--</h4>--}%
                                            %{--<p>Why not buy a new awesome theme?</p>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                %{--</ul>--}%
                            %{--</li>--}%
                            %{--<li class="footer"><a href="#">See All Messages</a></li>--}%
                        %{--</ul>--}%
                    %{--</li>--}%
                    %{--<!-- Notifications: style can be found in dropdown.less -->--}%
                    %{--<li class="dropdown notifications-menu">--}%
                        %{--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--}%
                            %{--<i class="fa fa-bell-o"></i>--}%
                            %{--<span class="label label-warning">10</span>--}%
                        %{--</a>--}%
                        %{--<ul class="dropdown-menu">--}%
                            %{--<li class="header">You have 10 notifications</li>--}%
                            %{--<li>--}%
                                %{--<!-- inner menu: contains the actual data -->--}%
                                %{--<ul class="menu">--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<i class="fa fa-users text-aqua"></i> 5 new members joined today--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the--}%
                                        %{--page and may cause design problems--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<i class="fa fa-users text-red"></i> 5 new members joined--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<i class="fa fa-shopping-cart text-green"></i> 25 sales made--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<li>--}%
                                        %{--<a href="#">--}%
                                            %{--<i class="fa fa-user text-red"></i> You changed your username--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                %{--</ul>--}%
                            %{--</li>--}%
                            %{--<li class="footer"><a href="#">View all</a></li>--}%
                        %{--</ul>--}%
                    %{--</li>--}%
                    %{--<!-- Tasks: style can be found in dropdown.less -->--}%
                    %{--<li class="dropdown tasks-menu">--}%
                        %{--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--}%
                            %{--<i class="fa fa-flag-o"></i>--}%
                            %{--<span class="label label-danger">9</span>--}%
                        %{--</a>--}%
                        %{--<ul class="dropdown-menu">--}%
                            %{--<li class="header">You have 9 tasks</li>--}%
                            %{--<li>--}%
                                %{--<!-- inner menu: contains the actual data -->--}%
                                %{--<ul class="menu">--}%
                                    %{--<li><!-- Task item -->--}%
                                        %{--<a href="#">--}%
                                            %{--<h3>--}%
                                                %{--Design some buttons--}%
                                                %{--<small class="pull-right">20%</small>--}%
                                            %{--</h3>--}%
                                            %{--<div class="progress xs">--}%
                                                %{--<div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"--}%
                                                     %{--aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">--}%
                                                    %{--<span class="sr-only">20% Complete</span>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<!-- end task item -->--}%
                                    %{--<li><!-- Task item -->--}%
                                        %{--<a href="#">--}%
                                            %{--<h3>--}%
                                                %{--Create a nice theme--}%
                                                %{--<small class="pull-right">40%</small>--}%
                                            %{--</h3>--}%
                                            %{--<div class="progress xs">--}%
                                                %{--<div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar"--}%
                                                     %{--aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">--}%
                                                    %{--<span class="sr-only">40% Complete</span>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<!-- end task item -->--}%
                                    %{--<li><!-- Task item -->--}%
                                        %{--<a href="#">--}%
                                            %{--<h3>--}%
                                                %{--Some task I need to do--}%
                                                %{--<small class="pull-right">60%</small>--}%
                                            %{--</h3>--}%
                                            %{--<div class="progress xs">--}%
                                                %{--<div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar"--}%
                                                     %{--aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">--}%
                                                    %{--<span class="sr-only">60% Complete</span>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<!-- end task item -->--}%
                                    %{--<li><!-- Task item -->--}%
                                        %{--<a href="#">--}%
                                            %{--<h3>--}%
                                                %{--Make beautiful transitions--}%
                                                %{--<small class="pull-right">80%</small>--}%
                                            %{--</h3>--}%
                                            %{--<div class="progress xs">--}%
                                                %{--<div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar"--}%
                                                     %{--aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">--}%
                                                    %{--<span class="sr-only">80% Complete</span>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%
                                        %{--</a>--}%
                                    %{--</li>--}%
                                    %{--<!-- end task item -->--}%
                                %{--</ul>--}%
                            %{--</li>--}%
                            %{--<li class="footer">--}%
                                %{--<a href="#">View all tasks</a>--}%
                            %{--</li>--}%
                        %{--</ul>--}%
                    %{--</li>--}%
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            %{--<img src="AdminLTE-2.4.0/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">--}%
                            %{--<asset:image src="icon.png" class="user-image" alt="User Image">--}%
                            <i class="fa fa-user"></i>
                            <span class="hidden-xs"><waterquality:nombreUsuario/></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                %{--<img src="AdminLTE-2.4.0/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">--}%
                                <asset:image src="pics/user160160.png" class="img-circle" alt="User Image"></asset:image>

                                <p>
                                    <waterquality:nombreUsuario/>

                                    <small id="txt"></small>

                                </p>
                            </li>
                            <!-- Menu Body -->
                            %{--<li class="user-body">--}%
                                %{--<div class="row">--}%
                                    %{--<div class="col-xs-4 text-center">--}%
                                        %{--<a href="#">Followers</a>--}%
                                    %{--</div>--}%
                                    %{--<div class="col-xs-4 text-center">--}%
                                        %{--<a href="#">Sales</a>--}%
                                    %{--</div>--}%
                                    %{--<div class="col-xs-4 text-center">--}%
                                        %{--<a href="#">Friends</a>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<!-- /.row -->--}%
                            %{--</li>--}%
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="/" class="btn btn-default btn-flat">Inicio</a>
                                </div>
                                <div class="pull-right">
                                    <g:form controller="logout" method="post">
                                        <input type="submit" class="btn btn-default btn-flat" value="Cerrar Sesión"/>
                                    </g:form>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    %{--<li>--}%
                        %{--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>--}%
                    %{--</li>--}%
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <asset:image src="pics/user160160.png"></asset:image>
                    %{--<img src="/webjars/AdminLTE/2.4.0/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">--}%
                </div>
                <div class="pull-left info">
                    <p><waterquality:nombreUsuario/></p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- search form -->
            %{--<form action="#" method="get" class="sidebar-form">--}%
                %{--<div class="input-group">--}%
                    %{--<input type="text" name="q" class="form-control" placeholder="Search...">--}%
                    %{--<span class="input-group-btn">--}%
                        %{--<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>--}%
                        %{--</button>--}%
                    %{--</span>--}%
                %{--</div>--}%
            %{--</form>--}%
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">MENU NAVEGACION</li>

                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-edit"></i> <span>Crear | Editar | Eliminar</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/usuario/usuarioIndex"><i class="fa fa-circle-o"></i> Usuario</a></li>
                            <li><a href="/parametro/parametroIndex"><i class="fa fa-circle-o"></i> Parametro</a></li>
                            <li><a href="/normativa/normativaIndex"><i class="fa fa-circle-o"></i> Normativa</a></li>
                            <li><a href="/dispositivo/dispositivoIndex"><i class="fa fa-circle-o"></i> Dispositivo</a></li>
                        </ul>
                    </li>
                </sec:ifAnyGranted>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>Monitoriar dispositivos</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                            %{--//  <span class="label label-primary pull-right">4</span>--}%

                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="/muestra/seleccionarDispositivoIndex"><i class="fa fa-circle-o"></i> Ver muestras </a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-bar-chart"></i> <span>Analisis de datos</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                            %{--//  <span class="label label-primary pull-right">4</span>--}%

                        </span>
                    </a>

                    <ul class="treeview-menu">
                        <li><a href="/cluster/clusterMapa"><i class="fa fa-circle-o"></i> Clusters </a></li>
                        <li><a href="/clustering/cluster"><i class="fa fa-circle-o"></i> Simple Kmeans</a></li>
                        <li><a href="/clusteringDbscan/cluster"><i class="fa fa-circle-o"></i>DBSCAN </a></li>

                    </ul>

                </li>




                %{--<li class="header">LABELS</li>--}%
                %{--<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>--}%
                %{--<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>--}%
                %{--<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>--}%
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->

        <section class="content-header">
            %{--<h1>--}%
                %{--<b>WQ</b>--}%
                %{--<small>Control panel</small>--}%
            %{--</h1>--}%
            %{--<ol class="breadcrumb">--}%
                %{--<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>--}%
                %{--<li class="active">Dashboard</li>--}%
            %{--</ol>--}%
        </section>
        <g:layoutBody/>


    </div>
    <!-- /.content-wrapper -->


    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
        </div>
        <strong>&copy; 2017- (Manuel Tolentino & John Bienaime) Todos los derechos reservados.</strong>
    </footer>

    <!-- Control Sidebar -->
gra    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>

<!-- ./wrapper -->


<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->


</body>

<script>
    function startTime() {
        var today = new Date();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        document.getElementById('txt').innerHTML =
            h + ":" + m + ":" + s;
        var t = setTimeout(startTime, 500);
    }
    function checkTime(i) {
        if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
        return i;
    }
</script>
</html>