<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<section class="content">

    <div class="row">
        <div class="col-md-3">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <asset:image src="pics/user128128.png" class="profile-user-img img-responsive img-circle" alt="User profile picture"></asset:image>

                    <h3 class="profile-username text-center"><waterquality:nombreUsuario/></h3>

                    <p class="text-muted text-center"><waterquality:roleUsuarios/></p>

                </div>

            </div>
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Acerca de mi</h3>
                </div>


                <div class="box-body">
                    <strong><i class="fa fa-laptop margin-r-5"></i> # Dispositivos registrados en el sistema:  </strong>
                        <waterquality:cantidadDispositivos/>

                    <hr>

                    <strong><i class="fa fa-book margin-r-5"></i> Telefono:</strong>

                    <p class="text-muted">
                       ${usuario.telefono}
                    </p>

                    <hr>

                    <strong><i class="fa fa-map-marker margin-r-5"></i> Localización:</strong>

                    <p class="text-muted"> Sector: ${usuario.direccion.sector.nombreSector}</p>
                    <p class="text-muted"> Calle: ${usuario.direccion.calle}</p>
                    <p class="text-muted"> Ciudad: ${usuario.direccion.sector.ciudad.nombreCiudad}</p>
                    <p class="text-muted"> Pais:  ${usuario.direccion.sector.ciudad.pais.nombrePais}</p>


                    <hr>


                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#timeline" data-toggle="tab">Actividad Reciente</a></li>
                </ul>
                <div class="tab-content">
                    <!-- /.tab-pane -->
                    <div class="active tab-pane" id="timeline">
                        <!-- The timeline -->
                        <ul class="timeline timeline-inverse">

                            <g:each in="${listadoActividad}" var="actividad">
                                <g:if test="${actividad.codigo==com.waterquality.domains.ActividadAplicacion.MUESTRASNOPOTABLE}">
                                    <li>
                                        <i class="fa fa-bullhorn bg-red"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i><g:formatDate format="dd-MM-yyy:HH:mm" date="${actividad.dateCreated}"/></span>

                                            <h3 class="timeline-header"><b>${actividad.titulo}</b></h3>

                                            <div class="timeline-body">
                                                ${actividad.descripcion}
                                            </div>
                                            <div class="timeline-footer">
                                                %{--<a class="btn btn-primary btn-xs">Leer mas</a>--}%
                                                <a class="btn btn-danger btn-xs">NO POTABLE</a>
                                            </div>
                                        </div>
                                    </li>


                                </g:if>
                                <g:if test="${actividad.codigo==com.waterquality.domains.ActividadAplicacion.NUEVOINSERT}">
                                    <li>
                                        <i class="fa fa-wrench bg-yellow"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i><g:formatDate format="dd-MM-yyy:HH:mm" date="${actividad.dateCreated}"/></span>

                                            <h3 class="timeline-header"><b>${actividad.titulo}</b></h3>

                                            <div class="timeline-body">
                                                ${actividad.descripcion}

                                            </div>
                                        </div>
                                    </li>

                                </g:if>
                                <g:if test="${actividad.codigo==com.waterquality.domains.ActividadAplicacion.CAMBIOSSISTEMA}">
                                <li>
                                    <i class="fa fa-warning bg-aqua"></i>

                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-clock-o"></i><g:formatDate format="dd-MM-yyy:HH:mm" date="${actividad.dateCreated}"/></span>

                                        <h3 class="timeline-header no-border"><b>${actividad.titulo}</b></h3>
                                    </div>
                                </li>

                                </g:if>
                            </g:each>
                        </ul>


                    </div>

                </div>
                <!-- /.tab-content -->
            </div>
            <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

</section>

</body>
</html>