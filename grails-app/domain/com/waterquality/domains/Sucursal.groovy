package com.waterquality.domains

class Sucursal {

    String nombre
    String direccion
    String ciudad
    String numeroTelefono


    //Datos genericos del dominio.
    boolean habilitado = true;
    String creadoPor = "sistemas"
    String modificadoPor = "sistemas"
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
}
