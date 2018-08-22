<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>WQ</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/dist/css/skins/_all-skins.min.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/bower_components/morris.js/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/bower_components/jvectormap/jquery-jvectormap.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="/webjars/AdminLTE/2.4.0/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


    <!-- SCRIPTS -->

    <!-- jQuery 3 -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/raphael/raphael.min.js"></script>
    <script src="/webjars/AdminLTE/2.4.0/bower_components/morris.js/morris.min.js"></script>
    <!-- Sparkline -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="/webjars/AdminLTE/2.4.0/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="/webjars/AdminLTE/2.4.0/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/moment/min/moment.min.js"></script>
    <script src="/webjars/AdminLTE/2.4.0/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- datepicker -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="/webjars/AdminLTE/2.4.0/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="/webjars/AdminLTE/2.4.0/bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="/webjars/AdminLTE/2.4.0/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="/webjars/AdminLTE/2.4.0/dist/js/pages/dashboard.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/webjars/AdminLTE/2.4.0/dist/js/demo.js"></script>



    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>


    <g:layoutHead/>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="/" class="logo">
            <span class="logo-mini"><b>R</b>B</span>
            <span class="logo-lg"><b>R&B</b>EXPRESS</span>
        </a>

        <nav class="navbar navbar-static-top">

            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">

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

                    <li class="active">
                        <a href="/dashboard/dashboardIndex">
                            <i class="fa fa-calendar"></i> <span>DashBoard</span>
                            <span class="pull-right-container">
                                <small class="label pull-right bg-red">+</small>
                            </span>
                        </a>
                    </li>

            <li class="treeview">
                <a href="#">

                    <i class="fa fa-bus"></i> <span>COLIS</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>

                <ul class="treeview-menu">
                    <li><a href="/envios/crearEnvio"><i class="fa fa-circle-o"></i> Envoyer Colis</a></li>
                    <li><a href="/envios/enviosIndex"><i class="fa fa-circle-o"></i> Livraison en cours</a></li>
                    <li><a href="/envios/enviosIndexEntregados"><i class="fa fa-circle-o"></i> Colis déjà livrés</a></li>
                </ul>
            </li>


                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="treeview">
                        <a href="#">
                            %{--créer, éditer, supprimer--}%
                            <i class="fa fa-edit"></i> <span>Créer | Editer | Supprimer</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/usuario/usuarioIndex"><i class="fa fa-circle-o"></i> Utilizateurs</a></li>
                            <li><a href="/sucursales/index"><i class="fa fa-circle-o"></i> Succursales</a></li>
                            %{--<li><a href="/parametro/parametroIndex"><i class="fa fa-circle-o"></i> Types de colis</a></li>--}%

                        </ul>
                    </li>
                </sec:ifAnyGranted>



                <sec:ifAnyGranted roles="ROLE_ADMIN">

                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-cog"></i> <span>Configurations Systeme</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                %{--//  <span class="label label-primary pull-right">4</span>--}%

                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Loading </a></li>
                            %{--<li><a href="/ciudad/ciudadIndex"><i class="fa fa-circle-o"></i> Ciudad </a></li>--}%
                            %{--<li><a href="/sector/sectorIndex"><i class="fa fa-circle-o"></i> Sector </a></li>--}%

                        </ul>
                    </li>
                </sec:ifAnyGranted>
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
        %{--<section class="content-header">--}%
            %{--<h1>--}%
                %{--Dashboard--}%
                %{--<small>Control panel</small>--}%
            %{--</h1>--}%
            %{--<ol class="breadcrumb">--}%
                %{--<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>--}%
                %{--<li class="active">Dashboard</li>--}%
            %{--</ol>--}%
        %{--</section>--}%

        <!-- Main content -->
        <section class="content">
           <div class="row">
               <g:layoutBody/>
           </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
        </div>
        <strong>&copy; 2018- (John Bien-aime) Todos los derechos reservados.</strong>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-user bg-yellow"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                <p>New phone +1(800)555-1234</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                <p>nora@example.com</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-file-code-o bg-green"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                <p>Execution time 5 seconds</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Update Resume
                                <span class="label label-success pull-right">95%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Laravel Integration
                                <span class="label label-warning pull-right">50%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Back End Framework
                                <span class="label label-primary pull-right">68%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Allow mail redirect
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Other sets of options are available
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Expose author name in posts
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Allow the user to show his name in blog posts
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <h3 class="control-sidebar-heading">Chat Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Show me as online
                            <input type="checkbox" class="pull-right" checked>
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Turn off notifications
                            <input type="checkbox" class="pull-right">
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Delete chat history
                            <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                        </label>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
    %{--<div class="control-sidebar-bg"></div>--}%
</div>
<!-- ./wrapper -->

</body>
</html>
