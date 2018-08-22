package waterquality

import com.waterquality.domains.Envio
import com.waterquality.domains.Sucursal
import com.waterquality.domains.seguridad.Perfil
import com.waterquality.domains.seguridad.RequestMap
import com.waterquality.domains.seguridad.Usuario
import com.waterquality.domains.seguridad.UsuarioPerfil

class BootStrap {

    def init = { servletContext ->

        Usuario usuario =Usuario.findByUsername("admin") ? null :new Usuario(apellido: "N/A",email:"admin@gmail.com",username: "admin", password: "admin", nombre: "Administrador",telefono: "N/A").save(flush: true, failOnError: true)

        if(usuario) {

                Perfil perfil = new Perfil(authority: "ROLE_ADMIN").save(flush: true, failOnError: true)

                UsuarioPerfil.create(usuario, perfil)

                new Perfil(authority: "ROLE_USUARIO").save(flush: true, failOnError: true)

                for (String url in [
                        '/', '/error', '/index', '/index.gsp', '/**/favicon.ico', '/shutdown',
                        '/assets/**', '/**/js/**', '/**/css/**', '/**/images/**',
                        '/login', '/login.*', '/login/*',
                        '/logout', '/logout.*', '/logout/*', '/dbconsole/**']) {
                    new RequestMap(url: url, configAttribute: 'permitAll,ROLE_ANONYMOUS').save(flush: true, failOnError: true)
            }


            new RequestMap(url: '/console/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new RequestMap(url: '/plugins/console*/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new RequestMap(url: '/static/console/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new RequestMap(url: '/profile/**', configAttribute: 'ROLE_USER').save(flush: true, failOnError: true)
            new RequestMap(url: '/admin/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new RequestMap(url: '/admin/role/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new RequestMap(url: '/admin/user/**', configAttribute: 'ROLE_ADMIN').save(flush: true, failOnError: true)
            new RequestMap(url: '/login/impersonate', configAttribute: 'ROLE_SWITCH_USER,isFullyAuthenticated()').save(flush: true, failOnError: true)
        }


        Sucursal sucursal_santiago=Sucursal.findByNombre("SantiagoExpress") ? null: new Sucursal(nombre: "SantiagoExpress",direccion: "Santiago de los caballeros",ciudad: "Santiago",numeroTelefono: "8295806847").save(flush:true,failOnError:true)
        Sucursal sucursal_caboh=Sucursal.findByNombre("CaboHaitianoExpress") ? null: new Sucursal(nombre: "CaboHaitianoExpress",direccion: "Cabo H",ciudad: "Cabo Haitiano",numeroTelefono: "7117536").save(flush:true,failOnError:true)


        Envio envio=new Envio(identificador: "ENV-0001", nombreRemitente:"John",telefonoRemitente: "829",
                        nombreDestinatario: "Esaus",telefonoDestinatario: "711",puntoOrigin:Sucursal?.findByNombre("SantiagoExpress"),
                        puntoDestino: Sucursal.findByNombre("CaboHaitianoExpress"),nombrePaquete:"Air Condition",precioPaquete:8000,pesoPaquete:4,precioTotalEnvio: 1000,
                        empleado: Usuario?.findByUsername('admin'),fechaEnvio: new Date()).save(flush:true,failOnError:true)
    }
    def destroy = {
    }
}
