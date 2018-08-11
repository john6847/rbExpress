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

            var valorSelect=$( "#nombrePais" ).val();
            var valorSelect1=$( "#pais" ).val();

//            alert(valorSelect)
//            alert(valorSelect1)


            document.getElementById('telefono').addEventListener('input', function (e) {
                var x = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,4})/);
                e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '');
            });
        })

    </script>

    %{--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--}%
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>


    <script type="text/javascript">
        // wait for dom to load
        $(document).ready(function () {
        $(function(){
            // set onblur event handler
            $("#nombreUsuario").blur(function(){
                // if some username was entered - this == #username
                if($(this).length > 0) {
                    // use create link so we don't have to hardcode context
                    var url = "${createLink(controller:'usuario', action:'checkAvailable')}"
                    // async ajax request pass username entered as id parameter
                    $.getJSON(url, {id:$(this).val()}, function(json){
                        if(!json.available) {

                            // highlight field so user knows there's a problem
                            $("#nombreUsuario").css("border", "1px solid red");
//                            $("#guardar").click(function(event) {
                                document.getElementById("guardar").disabled = true;
//                            });
                            // maybe throw up an alert box
//                            alert("This username is taken");
                            // populate a hidden div on page and fill and display it..
                            $("#somehiddendiv").html("Ese nombre de usuario ya existe, por favor escoge otro").show();
                            $("#somehiddendiv").css("color", "red");
                        }
                        else if(json.available){
                            $("#somehiddendiv").html("Ese nombre de usuario ya existe, por favor escoge otro").hide();
                            document.getElementById("guardar").disabled = false;
                        }
                    });
                }
            });
        });
        })
    </script>
</head>

<body>

<section style="margin-top: 2%;margin-right: 2%;margin-left: 2%">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">Creer utilizateur</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <g:form action="procesarUsuario">
                <div class="row">

                    <input id="idUsuario" name="idUsuario" hidden="hidden">


                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Nom</label>
                            <input placeholder="Nombre" type="text" id="nombre" name="nombre" class="form-control"  data-validation="length" data-validation-length="2-25" >
                        </div>

                        <div class="form-group">
                            <label>Prenom</label>
                            <input  placeholder="Apellido" type="text" id="apellido" name="apellido" class="form-control" data-validation-optional="true" data-validation="length" data-validation-length="2-25">
                        </div>

                        <div class="form-group">
                            <label>Nom d'utilizateur</label>
                            <input placeholder="Usuario" value="" type="text" id="nombreUsuario"   name="nombreUsuario" class="form-control" data-validation="length" data-validation-length="2-25">
                            <div id="somehiddendiv"></div>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input placeholder="Contraseña" type="password" name="pass_confirmation" class="form-control" data-validation="strength" data-validation-strength="1">
                        </div>
                        <div class="form-group">
                            <label>Retapez votre mot de passe</label>
                            <input placeholder="Contraseña" type="password" name="pass" data-validation="confirmation" class="form-control">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>E-mail</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-envelope"></i>
                                </div>
                                <input  name="email"  type="text" id="email" class="form-control" placeholder="E-mail"  data-validation="email">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Telephone</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <input  name="telefono"  type="text" id="telefono" class="form-control" placeholder="(XXX) XXX-XXXX" data-validation="required">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Addresse</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-map-marker"></i>
                                </div>

                                <input  id="calle" name="calle" type="text" placeholder="Calle" class="form-control" data-validation="required">

                            </div>
                        </div>

                        <div class="checkbox">
                            <label>
                                <g:checkBox name="roleadministrador" id="roleadministrador"/> ¿ Administrador ?
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



