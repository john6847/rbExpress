package waterquality

import com.waterquality.controllers.UsuarioController

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")

        "500"(view:'/error')
        "404"(view:'/notFound')

        //Parte responsable de darle acceso al servicio REST
        "/API/$action?"(controller: "usuarioRest")
//        "/API/EditarProfile/$action?"(controller: "usuarioRest")

        "/API/$action?"(controller: "dispositivoRest")

        "/API/$action?"(controller: "limiteParametrosRest")

        "/API/$action?"(controller: "muestraRest")

        "/API/$action?"(controller: "normativaRest")

        "/API/$action?"(controller: "notificacionRest")

        "/API/$action?"(controller: "parametroRest")

        "/API/$action?"(controller: "usuarioRest")

        "/API/$action?"(controller: "valoresRest")

        "/API/$action?"(controller: "valoresRest")

        "/API/$action?"(controller: "ciudadRest")

        "/API/$action?"(controller: "sectorRest")
    }
}
