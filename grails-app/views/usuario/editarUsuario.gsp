<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

    <script type="text/javascript">
        $(document).ready( function () {
            $('#example').DataTable({
                "language":{
                    "lengthMenu":"Mostrar _MENU_ registros por página.",
                    "zeroRecords": "Lo sentimos. No se encontraron registros.",
                    "info": "Mostrando página _PAGE_ de _PAGES_",
                    "infoEmpty": "No hay registros aún.",
                    "infoFiltered": "(filtrados de un total de _MAX_ registros)",
                    "search" : "Búsqueda",
                    "LoadingRecords": "Cargando ...",
                    "Processing": "Procesando...",
                    "SearchPlaceholder": "Comience a teclear...",
                    "paginate": {
                        "previous": "Anterior",
                        "next": "Siguiente",
                    }
                }
            });
        } );
    </script>


    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById('telefono').addEventListener('input', function (e) {
                var x = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,4})/);
                e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '');
            });
        })

    </script>

    %{--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--}%
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>

</head>

<body>

<section style="margin-top: 2%;margin-right: 2%;margin-left: 2%">
    %{--<div class="col-md-8">--}%
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">Editar usuario</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <g:form action="procesarUsuario_Editar">
                <div class="row">

                    <input id="idUsuario" name="idUsuario" value="${usuario.id}" hidden="hidden">


                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Nombre</label>
                            <g:if test="${usuario.username=="admin"}">
                                <input disabled="disabled" placeholder="Nombre" value="${usuario.nombre}" type="text" id="nombre" name="nombre" class="form-control"  data-validation="length" data-validation-length="2-25" >
                            </g:if>
                            <g:else>
                                <input placeholder="Nombre" value="${usuario.nombre}" type="text" id="nombre" name="nombre" class="form-control"  data-validation="length" data-validation-length="2-25" >
                            </g:else>
                        </div>

                        <div class="form-group">
                            <label>Apellido</label>
                            <g:if test="${usuario.username=="admin"}">
                                <input disabled="disabled"  placeholder="Apellido" value="${usuario.apellido}" type="text" id="apellido" name="apellido" class="form-control" data-validation-optional="true" data-validation="length" data-validation-length="2-25">
                            </g:if>
                            <g:else>
                                <input  placeholder="Apellido" value="${usuario.apellido}" type="text" id="apellido" name="apellido" class="form-control" data-validation-optional="true" data-validation="length" data-validation-length="2-25">
                            </g:else>
                        </div>

                        <div class="form-group">
                            <label>Nombre de usuario</label>
                            <g:if test="${usuario.username=="admin"}">
                                <input disabled="disabled" placeholder="Usuario" type="text" id="nombreUsuario" value="${usuario.username}"  name="nombreUsuario" class="form-control" data-validation="length" data-validation-length="2-25">
                            </g:if>
                            <g:else>
                                <input placeholder="Usuario" type="text" id="nombreUsuario" value="${usuario.username}"  name="nombreUsuario" class="form-control" data-validation="length" data-validation-length="2-25">
                            </g:else>
                        </div>

                        <div class="form-group">
                            <label>Contraseña</label>
                            <input placeholder="Contraseña" value="${usuario.password}" type="password" name="pass_confirmation" class="form-control" data-validation="strength" data-validation-strength="1">
                        </div>
                        <div class="form-group">
                            <label>Vuelva a escribir su contraseña</label>
                            <input placeholder="Contraseña" type="password" value="${usuario.password}"  name="pass" data-validation="confirmation" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6">

                        <div class="form-group">
                            <label>E-mail</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-envelope"></i>
                                </div>
                                <input value="${usuario.email}"  name="email"  type="text" id="email" class="form-control" placeholder="E-mail"  data-validation="email">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Telefono</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <g:if test="${usuario.username=="admin"}">
                                    <input disabled="disabled" value="${usuario.telefono}"  name="telefono"  type="text" id="telefono" class="form-control" placeholder="(XXX) XXX-XXXX">
                                </g:if>
                                <g:else>
                                    <input value="${usuario.telefono}"  name="telefono"  type="text" id="telefono" class="form-control" placeholder="(XXX) XXX-XXXX" data-validation="required">
                                </g:else>

                            </div>
                        </div>
                        %{--<div class="form-group">--}%
                            %{--<label>Direccion</label>--}%
                            %{--<div class="input-group">--}%
                                %{--<div class="input-group-addon">--}%
                                    %{--<i class="fa fa-map-marker"></i>--}%
                                %{--</div>--}%
                                %{--<g:select onChange="getCiudades();"  noSelection="['':'Seleccione un pais']" class="form-control" id="pais" name="pais" from="${listadoPais}" optionKey="id" optionValue="nombrePais" data-validation="required"/>--}%
                                %{--<g:select onChange="getSectores();" noSelection="['':'Seleccione una ciudad']" class="form-control" id="ciudad" name="ciudad" from="" optionKey="id" optionValue="nombreCiudad" data-validation="required"/>--}%
                                %{--<g:select noSelection="['':'Seleccione un sector']" class="form-control" id="sector" name="sector" from="" optionKey="id" optionValue="nombreSector" data-validation="required"/>--}%

                                %{--<input  id="calle" name="calle" type="text" placeholder="Calle" class="form-control" data-validation="required">--}%

                            %{--</div>--}%
                        %{--</div>--}%

                        <div class="form-group">
                            <label>Direccion</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <g:if test="${usuario.username=="admin"}">
                                    <g:select disabled="disabled" onChange="getCiudades();"  noSelection="['':'Seleccione un pais']" class="form-control" id="pais" name="pais" from="" optionKey="id" optionValue="nombrePais" data-validation="required"/>
                                    <g:select disabled="disabled" onChange="getSectores();" noSelection="['':'Seleccione una ciudad']" class="form-control" id="ciudad" name="ciudad" from="" optionKey="id" optionValue="nombreCiudad" data-validation="required"/>
                                    <g:select disabled="disabled" noSelection="['':'Seleccione un sector']" class="form-control" id="sector" name="sector" from="" optionKey="id" optionValue="nombreSector" data-validation="required"/>

                                    <input disabled="disabled" id="calle" name="calle" type="text" placeholder="Calle" class="form-control" data-validation="required">

                                </g:if>
                                <g:else>
                                    <g:select onChange="getCiudades();"  value="${usuario.direccion.sector.ciudad.pais.id}" class="form-control" id="pais" name="pais" from="${listadoPais}" optionKey="id" optionValue="nombrePais" data-validation="required"/>
                                    <g:select onChange="getSectores();" value="${usuario.direccion.sector.ciudad.id}" class="form-control" id="ciudad" name="ciudad" from="${listadoCiudad}" optionKey="id" optionValue="nombreCiudad" data-validation="required"/>
                                    <g:select value="${usuario.direccion.sector.id}" class="form-control" id="sector" name="sector" from="${listadoSector}" optionKey="id"  optionValue="nombreSector" data-validation="required"/>

                                    <input value="${usuario.direccion.calle}" id="calle" name="calle" type="text" placeholder="Calle" class="form-control" data-validation="required">

                                </g:else>

                            </div>
                        </div>

                        <div class="checkbox">
                            <label>
                                <g:if test="${usuario.username=="admin"}">
                                    <g:checkBox name="roleadministrador" style="display: none" id="roleadministrador" value="${role}"/>
                                    <g:checkBox disabled="disabled" name="roleadministradorDisplay" id="roleadministradorDisplay" value="${role}"/> ¿ Administrador ?
                                </g:if>
                                <g:else>
                                    <g:checkBox name="roleadministrador" id="roleadministrador" value="${role}"/> ¿ Administrador ?
                                </g:else>
                            </label>
                        </div>
                    </div>


                </div>
                <button type="summit" id="guardar" class="btn btn-block btn-success btn-sm">Guardar</button>

            </g:form>
        </div>
        <!-- /.box-body -->
    </div>

    <div style="height:200px; width:100%; clear:both;"></div>

</section>

<script>
    $.validate({
        lang : 'es',
        modules : 'security'
    });
</script>
<script>
    function getCiudades() {
        var myselect = document.getElementById("pais");
        var ciudadesSelect = document.getElementById("ciudad");

        $.ajax({
            type: "post",
            url: "/API/obtenerCiudades?idPais="+myselect.value,
            dataType: "json",
            contentType: "application/json",
            // data:'idPais='+myselect.value,
            success: function (data) {
                ciudadesSelect.options.length = 0;

                document.getElementById("sector").options.length=0;
                document.getElementById("sector").options[ciudadesSelect.options.length] = new Option("Seleccione un sector",'');


                ciudadesSelect.options[ciudadesSelect.options.length] = new Option("Seleccione una ciudad",'');
                for(index in data) {
                    ciudadesSelect.options[ciudadesSelect.options.length] = new Option(data[index].nombreCiudad,data[index].id);
                }
            }
        });


    }

</script>
<script>
    function getSectores() {
        var myselect = document.getElementById("ciudad");
        var sectoresSelect = document.getElementById("sector");
        var paisSelect = document.getElementById("pais");

        $.ajax({
            type: "post",
            url: "/API/obtenerSectores?ciudad="+myselect.value+"&idPais="+paisSelect.value,
            dataType: "json",
            contentType: "application/json",
            // data:'idPais='+myselect.value,
            success: function (data) {
                sectoresSelect.options.length = 0;
                sectoresSelect.options[sectoresSelect.options.length] = new Option("Seleccione un sector",'');
                for(index in data) {
                    sectoresSelect.options[sectoresSelect.options.length] = new Option(data[index].nombreSector,data[index].id);
                }
            }
        });


    }
</script>



</body>

</html>



