package com.waterquality.commands

import grails.validation.Validateable

class AsignarDispositivoForm implements Validateable {

    long usuarioId;
    Set<DispositivoForm> listaDispositivos;

    static constraints = {

    }
}
