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
                },
                "order": [[ 0, "desc" ]]
            });
        } );
    </script>
</head>

<body>

<section style="margin-top: 2%;margin-right: 2%;margin-left: 2%">
    %{--<div class="col-md-8">--}%
    <g:link action="crearEnvio" controller="envios" ><button type="button" id="crearEnvio" class="btn btn-info btn-block">Envoyer un colis</button></g:link>

    <div class="box" style="margin-top: 2%">
        <div class="box-header">
            <h3 class="box-title">Liste de colis en route</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table  id="example" class="table table-condensed">
                <thead>
                <tr>


                    <th class="bg-info">Id</th>
                    <th class="bg-info">Expéditeur</th>
                    <th class="bg-info">Destinataire</th>
                    <th class="bg-info">Telephone du Destinataire</th>
                    <th class="bg-info">Origine du colis</th>
                    <th class="bg-info">Destination du colis</th>
                    <th class="bg-info">        </th>
                    <th class="bg-info">        </th>
                    <th class="bg-info">        </th>
                    <th class="bg-info">        </th>


                </tr>
                </thead>
                <tbody>
                <g:each in="${listadoEnvios}" var="envio">
                    <tr>
                        <td>${envio.identificador}</td>
                        <td>${envio.nombreRemitente}</td>
                        <td>${envio.nombreDestinatario}</td>
                        <td>${envio.telefonoDestinatario}</td>
                        <td>${envio.puntoOrigin.nombre}</td>
                        <td>${envio.puntoDestino.nombre}</td>
                        <td>
                            <g:link action="editarEnvio" params="[idEnvio: envio.id]"><button type="summit" class="btn btn-block btn-warning btn-xs">Editer</button></g:link>
                        </td>
                        <td>
                            <button type="button" data-id="${envio.id}" data-toggle="modal" data-target="#modal" class="open-modalConfirmacion btn btn-block btn-danger btn-xs">Livrer</button>
                        </td>
                        <td>
                            <g:link action="visualizarEnvio" params="[idEnvio: envio.id]"><button type="button"  class="fa fa-eye"></button></g:link>
                        </td>
                        <td>
                            <g:link action="printEnvio" params="[idEnvio: envio.id]"><button type="button" class="btn btn-block btn-default btn-xs">Imprimer</button></g:link>
                        </td>


                    </tr>
                </g:each>
                </tbody>
                <tfoot>
                <tr>
                    <th class="bg-info">Id</th>
                    <th class="bg-info">Expéditeur</th>
                    <th class="bg-info">Destinataire</th>
                    <th class="bg-info">Telephone du Destinataire</th>
                    <th class="bg-info">Origine du colis</th>
                    <th class="bg-info">Destination du colis</th>
                    <th class="bg-info">        </th>
                    <th class="bg-info">        </th>
                    <th class="bg-info">        </th>
                    <th class="bg-info">        </th>


                </tr>
                </tfoot>
            </table>
        </div>
    </div>

</section>


%{--MODALS--}%
<div class="modal modal-danger fade" id="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><b>ADVERTENCIA</b></h4>
            </div>
            <div class="modal-body">
                <p>Êtes-vous sûr de vouloir changer le statut de ce colis?</p>
            </div>
            <div class="modal-footer">
                <g:form method="post" action="entegarPaquete">
                    <input hidden="hidden" id="idEnvio" name="idEnvio">
                    <button type="submit" class="btn btn-outline pull-left">Oui</button>
                </g:form>
                <button type="button" class="btn btn-outline" data-dismiss="modal">Non</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).on("click", ".open-modalConfirmacion", function () {
        var id = $(this).data('id');
        console.log(id);
        document.getElementById("idEnvio").value=id;
    });
</script>


<script type="text/javascript">
    /* -*- Mode: Java; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
    /* vim: set shiftwidth=2 tabstop=2 autoindent cindent expandtab: */

    //
    // See README for overview
    //

    'use strict';

    getPdf('your-file-name.pdf', function getPdfHelloWorld(data) {
        //
        // Instantiate PDFDoc with PDF data
        //
        var pdf = new PDFDoc(data);
        var page = pdf.getPage(1);
        var scale = 1.5;

        //
        // Prepare canvas using PDF page dimensions
        //
        var canvas = document.getElementById('the-canvas');
        var context = canvas.getContext('2d');
        canvas.height = page.height * scale;
        canvas.width = page.width * scale;

        //
        // Render PDF page into canvas context
        //
        page.startRendering(context);
    });


</script>

</body>

</html>



