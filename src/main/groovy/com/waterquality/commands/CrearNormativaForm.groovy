package com.waterquality.commands

import grails.validation.Validateable

class CrearNormativaForm implements Validateable {

    String nombreNormativa

    String fechaCreacion
    Set<CrearLimiteForm> listaLimite
    String descripcion
    String linkReferencia

    static constraints = {
        fechaCreacion(nullable:true)
        descripcion(nullable: true)
        linkReferencia(nullable: true)

    }
}
