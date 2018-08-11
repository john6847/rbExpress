package com.waterquality

import com.waterquality.domains.seguridad.Usuario


class waterQualityTagLib {

    static namespace = "waterquality"
    static defaultEncodeAs = [taglib:'html']

    def springSecurityService

    def nombreUsuario={
        Usuario usuario = (Usuario)springSecurityService.currentUser
        out << "${usuario?.nombre}"
    }
}