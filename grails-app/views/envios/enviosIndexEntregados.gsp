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
            <table id="example" class="table table-condensed">
                <thead>
                <tr>

                    <th class="bg-info">Id</th>
                    <th class="bg-info">Expéditeur</th>
                    <th class="bg-info">Telephone de l'expediteur</th>
                    <th class="bg-info">Destinataire</th>
                    <th class="bg-info">Telephone du Destinataire</th>
                    <th class="bg-info">Origine du colis</th>
                    <th class="bg-info">Destination du colis</th>
                    <th class="bg-info">        </th>


                </tr>
                </thead>
                <tbody>
                <g:each in="${listadoEnvios}" var="envio">
                    <tr>
                        <td>${envio.id}</td>
                        <td>${envio.nombreRemitente}</td>
                        <td>${envio.telefonoRemitente}</td>
                        <td>${envio.nombreDestinatario}</td>
                        <td>${envio.telefonoDestinatario}</td>
                        <td>${envio.puntoOrigin.nombre}</td>
                        <td>${envio.puntoDestino.nombre}</td>
                        <td>
                            <g:link action="visualizarEnvio" params="[idEnvio: envio.id]"><button type="button"  class="fa fa-eye"></button></g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
                <tfoot>

                <tr>
                    <th class="bg-info">Id</th>
                    <th class="bg-info">Expéditeur</th>
                    <th class="bg-info">Telephone de l'expediteur</th>
                    <th class="bg-info">Destinataire</th>
                    <th class="bg-info">Telephone du Destinataire</th>
                    <th class="bg-info">Origine du colis</th>
                    <th class="bg-info">Destination du colis</th>
                    <th class="bg-info">        </th>


                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</section>

</body>

</html>