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
        <!-- /.box-header -->
    <div class="box-body">
            <div class="row">

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="remitente">Expéditeur</label>
                        <input value="${envio.nombreRemitente}" readonly  type="text" id="remitente" name="remitente" required class="form-control"  data-validation="length" data-validation-length="2-25" >
                    </div>

                    <div class="form-group">
                        <label for="telefono_remitente">Telephone de l'expediteur</label>
                        <input value="${envio.telefonoRemitente}" readonly  type="text" id="telefono_remitente" name="telefono_remitente" class="form-control" data-validation-optional="true" data-validation="length" data-validation-length="2-25">
                    </div>

                    <div class="form-group">
                        <label for="destinatario">Destinataire</label>
                        <input  value="${envio.nombreDestinatario}" readonly type="text" id="destinatario"   name="destinatario" class="form-control" data-validation="length" data-validation-length="2-25">
                        <div id="somehiddendiv"></div>
                    </div>

                    <div class="form-group">
                        <label for="telefonoDestinatario">Telephone du Destinataire</label>
                        <input value="${envio.telefonoDestinatario}" readonly type="text" id="telefonoDestinatario" name="telefonoDestinatario" class="form-control" data-validation="length" data-validation-length="2-25">
                    </div>

                    <div class="form-group">
                        <label>Détails supplémentaires</label>
                        <div class="input-group">
                            <textarea  id="detalles_adicionales" readonly name="detallesAdicionales" cols="93" rows="5" placeholder="Espace disponible pour ecrire n'importe quelle detalle.">${envio.detallesAdicionales}</textarea>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">

                    <div class="form-group">
                        <label for="nombre_paquete">Nom du colis</label>
                        <input value="${envio.nombrePaquete}" readonly type="text" id="nombre_paquete"   name="nombre_paquete" class="form-control" data-validation="length" data-validation-length="2-25">
                    </div>

                    <div class="form-group">
                        <label for="precioPaquete">Prix du colis</label>
                        <input value="${envio.precioPaquete}" readonly type="text" id="precioPaquete" name="precioPaquete" class="form-control" data-validation="length" data-validation-length="2-25">
                    </div>

                    <div class="form-group">
                        <label>Origine du colis</label>
                        <div class="input-group">
                            <input type="text" class="form-control" readonly value="${envio.puntoOrigin.nombre}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Destination du colis</label>
                        <div class="input-group">
                            <input type="text" class="form-control"  readonly value="${envio.puntoDestino.nombre}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="peso_paquete">Poids du colis</label>
                        <div class="input-group">
                            <input value="${envio.pesoPaquete}" readonly type="text" name="peso_paquete" id="peso_paquete" class="form-control" data-validaton="length" data-validation="2-25">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="precio_envio">Poids du colis</label>
                        <input value="${envio.precioTotalEnvio}" readonly type="text" id="precio_envio" name="precio_envio" class="form-control" data-validation="length" data-validation-length="2-25">
                    </div>

                </div>

            </div>

                 <button  id="guardar" class="btn btn-block btn-success btn-lg" onclick="window.history.back();">Retourner a la liste de Colis</button>
            </div>

    </div>
</div>

    <div style="height:200px; width:100%; clear:both;"></div>

</section>

<script>
    $.validate({
        lang : 'es',
        modules : 'security'
    });
</script>

</body>

</html>



