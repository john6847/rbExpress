package com.waterquality.controllers

import com.waterquality.domains.Sucursal
import grails.plugin.springsecurity.annotation.Secured


@Secured(["ROLE_ADMIN", "ROLE_USUARIO"])
class SucursalesController {

    def index() {
        [listadoSucursales:Sucursal.findAllByHabilitado(true)]
    }

    def crearSucursal(){

    }

    def procesarSucursal(String nombre,String direccion,String ciudad,String telefono){
        Sucursal sucursal=new Sucursal(nombre: nombre,direccion:direccion,ciudad: ciudad,numeroTelefono: telefono)

        sucursal.save(flush:true,failOnError:true)
        redirect(uri:"/sucursales/index")
    }

    def editarSucursal(){}

    def editarSucursalPost(long idSucursal,String nombre,String direccion,String ciudad,String telefono){

        Sucursal sucursal=Sucursal.findById(idSucursal)
        sucursal.nombre=nombre
        sucursal.direccion=direccion
        sucursal.numeroTelefono=telefono
        sucursal.ciudad=ciudad

        sucursal.save(flush:true,failOnError:true)
        redirect(uri: "/sucursales/index")
    }

}
