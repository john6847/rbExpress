package com.waterquality.controllers


import com.waterquality.domains.seguridad.Perfil
import com.waterquality.domains.seguridad.Usuario
import com.waterquality.domains.seguridad.UsuarioPerfil
import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_USUARIO"])
class UsuarioController {

    def usuarioIndex() {
        [listadoUsuario:Usuario.findAllByHabilitado(true)]
    }

    def crearUsuario(){
    }

    def checkAvailable = {
        def available
        if( Usuario.findByUsername(params.id as String) ) {
            available = false
        } else {
            available = true
        }
        response.contentType = "application/json"
        render """{"available":${available}}"""
    }

    //TODO CREAR UN FORM PARA ESTO, PAIS YA NO ES NECESARIO
    def procesarUsuario(String nombre,String apellido, String email, String nombreUsuario, String pass, String telefono, String sector, String ciudad, String pais, String calle, boolean roleadministrador){

        println(params)
        def usuario = new Usuario(nombre: nombre, apellido: apellido, username: nombreUsuario, password: pass, telefono: telefono,email: email)
        usuario.save(flush: true, failOnError: true)
        new UsuarioPerfil(usuario: usuario, perfil: Perfil.findByAuthority("ROLE_USUARIO")).save(flush: true, failOnError: true)
        if(roleadministrador){
            new UsuarioPerfil(usuario: usuario, perfil: Perfil.findByAuthority("ROLE_ADMIN")).save(flush: true, failOnError: true)
        }

        println("Usuario creado!!")
        redirect(uri:"/usuario/usuarioIndex")
    }

    def desactivarUsuario(long idUsuario){
        Usuario usuario =Usuario.get(idUsuario)
        usuario.habilitado = false;
        usuario.save(flush: true, failOnError: true)
        println("Usuario desactivado!!")
        redirect(uri:"/usuario/usuarioIndex")
    }

    def editarUsuario(Long idUsuario){
        Usuario usuario =Usuario.get(idUsuario)

        def perfilesUsuarios = UsuarioPerfil.findAllByUsuario(usuario)
        boolean existe =false

        perfilesUsuarios.each {
            if(it.perfil.authority=="ROLE_ADMIN"){
                existe=true
            }
        }
        [usuario:usuario, role: existe]

    }

    def procesarUsuario_Editar(long idUsuario,String nombre,String apellido, String nombreUsuario, String pass,String email, String telefono, String sector, String ciudad, String pais, String calle, boolean roleadministrador ){
        print(params)

        Usuario usuario =Usuario.get(idUsuario)


        usuario.password=pass
        usuario.email=email

        if(usuario.username!="admin"){
            usuario.telefono=telefono
            usuario.nombre=nombre
            usuario.apellido=apellido
            usuario.username=nombreUsuario

        }

        usuario.save(flush: true, failOnError: true)

        if(roleadministrador){
            if(!UsuarioPerfil.findByUsuarioAndPerfil(usuario,Perfil.findByAuthority("ROLE_ADMIN"))){
                new UsuarioPerfil(usuario: usuario, perfil: Perfil.findByAuthority("ROLE_ADMIN")).save(flush: true, failOnError: true)

            }
        }
        else {
            UsuarioPerfil perfil = UsuarioPerfil.findByUsuarioAndPerfil(usuario,Perfil.findByAuthority("ROLE_ADMIN"))
            if(perfil){
                perfil.remove(usuario,Perfil.findByAuthority("ROLE_ADMIN"))
            }

        }


        println("Usuario modificado!!")
        redirect(uri:"/usuario/usuarioIndex")
    }



}
