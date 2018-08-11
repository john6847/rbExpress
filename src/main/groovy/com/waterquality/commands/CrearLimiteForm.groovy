package com.waterquality.commands

import grails.validation.Validateable

class CrearLimiteForm implements Validateable {

    long idParametro
    double nivelMinimo
    double nivelMaximo

    static constraints = {

    }
}
