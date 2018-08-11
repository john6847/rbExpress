package waterquality


import com.waterquality.domains.seguridad.Perfil
import com.waterquality.domains.seguridad.Usuario
import com.waterquality.domains.seguridad.UsuarioPerfil

class WaterqualityTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "waterquality"
    def springSecurityService

    def nombreUsuario={
        Usuario usuario = (Usuario)springSecurityService.currentUser
            out << "${usuario?.nombre}"

    }

    def cantidadDispositivos={
        Usuario usuario = (Usuario)springSecurityService.currentUser
        def cantidad
        if(UsuarioPerfil.findByUsuarioAndPerfil(usuario,Perfil.findByAuthority("ROLE_ADMIN"))) {
            cantidad = Dispositivo.findAllByHabilitado(true).size()

        }else{
            //TODO SI EL DISPOSITIVO SE DESABILITA LO SIGUE CONTANDO CHEQUEAR
            cantidad = UsuarioDispositivo.findAllByUsuario(usuario).size()

        }

        out << "${cantidad}"
    }

    def roleUsuarios={
        def rolUsuario
        boolean existe=false
        Usuario usuario = (Usuario)springSecurityService.currentUser
        UsuarioPerfil.findAllByUsuario(usuario).each {
            if(it.perfil.authority=="ROLE_ADMIN"){
                rolUsuario="Administrador"
                existe=true
            }
        }

        if(!existe){
            rolUsuario="Usuario General"
        }
        out << "${rolUsuario}"
    }

}
