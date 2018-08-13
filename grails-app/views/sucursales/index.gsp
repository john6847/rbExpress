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
    <g:link action="crearSucursal" controller="sucursales" ><button type="button" id="crearSucursal" class="btn btn-info btn-block">Créer une sucursale</button></g:link>

    <div class="box" style="margin-top: 2%">
        <div class="box-header">
            <h3 class="box-title">Listes de Sucursales</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table  id="example" class="table table-condensed">
                <thead>
                <tr>
                    <th class="bg-info">Nom</th>
                    <th class="bg-info">Addresse</th>
                    <th class="bg-info">Ville</th>
                    <th class="bg-info">Telephone</th>
                    <th class="bg-info">        </th>


                </tr>
                </thead>
                <tbody>
                <g:each in="${listadoSucursales}" var="sucursal">
                    <tr>
                        <td>${sucursal.nombre}</td>
                        <td>${sucursal.direccion}</td>
                        <td>${sucursal.ciudad}</td>
                        <td>${sucursal.numeroTelefono}</td>
                        <td>
                            <g:link action="editarSucursal" params="[idSucursal: sucursal.id]"><button type="summit" class="btn btn-block btn-warning btn-xs">Editer</button></g:link>
                        </td>
                        %{--<td>--}%
                            %{--<g:if test="${sucusal.username=="admin"}">--}%
                                %{--<button disabled="disabled" type="button" data-id="${usuario.id}" data-toggle="modal" data-target="#modal" class="open-modalConfirmacion btn btn-block btn-danger btn-xs">Eliminar</button>--}%
                            %{--</g:if>--}%
                            %{--<g:else>--}%
                                %{--<button type="button" data-id="${usuario.id}" data-toggle="modal" data-target="#modal" class="open-modalConfirmacion btn btn-block btn-danger btn-xs">Eliminar</button>--}%
                            %{--</g:else>--}%
                        %{--</td>--}%

                    </tr>
                </g:each>
                </tbody>
                <tfoot>
                <tr>
                    <th class="bg-info">Nom</th>
                    <th class="bg-info">Addresse</th>
                    <th class="bg-info">Ville</th>
                    <th class="bg-info">Telephone</th>
                    <th class="bg-info">        </th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>

</section>


%{--MODALS--}%
%{--<div class="modal modal-danger fade" id="modal">--}%
    %{--<div class="modal-dialog">--}%
        %{--<div class="modal-content">--}%
            %{--<div class="modal-header">--}%
                %{--<button type="button" class="close" data-dismiss="modal" aria-label="Close">--}%
                    %{--<span aria-hidden="true">&times;</span></button>--}%
                %{--<h4 class="modal-title"><b>ADVERTENCIA</b></h4>--}%
            %{--</div>--}%
            %{--<div class="modal-body">--}%
                %{--<p>¿Realmente desea eliminar este usuario?</p>--}%
            %{--</div>--}%
            %{--<div class="modal-footer">--}%
                %{--<g:form method="post" action="desactivarUsuario">--}%
                    %{--<input hidden="hidden" id="idUsuario" name="idUsuario">--}%
                    %{--<button type="submit" class="btn btn-outline pull-left">Si</button>--}%
                %{--</g:form>--}%
                %{--<button type="button" class="btn btn-outline" data-dismiss="modal">No</button>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</div>--}%

%{--<script>--}%
    %{--$(document).on("click", ".open-modalConfirmacion", function () {--}%
        %{--var id = $(this).data('id');--}%
        %{--console.log(id);--}%
        %{--document.getElementById("idUsuario").value=id;--}%
    %{--});--}%
%{--</script>--}%
</body>

</html>



