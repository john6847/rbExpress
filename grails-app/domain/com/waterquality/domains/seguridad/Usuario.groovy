package com.waterquality.domains.seguridad

class Usuario {

    String nombre;
    String apellido;
    String username;
    String password;
    String telefono;
    String email;
    boolean envioCorreo=true
    boolean envioCorreoUltimoEstado=false


    //Datos genericos del dominio.
    boolean habilitado = true;
    String creadoPor = "sistemas"
    String modificadoPor = "sistemas"
    Date dateCreated
    Date lastUpdated

    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    boolean silenciarNotificacion=false


    Set<Perfil> getAuthorities() {
        (UsuarioPerfil.findAllByUsuario(this) as List<UsuarioPerfil>)*.perfil as Set<Perfil>
    }

    static constraints = {
        apellido(nullable: true)

        password blank: false, password: true
        username blank: false, unique: true
    }

    static mapping = {
        table 'seguridad_usuario'
        password column: '`password`'
    }

    boolean isAdmin(Usuario usuario){
        boolean respuesta=false;
        UsuarioPerfil.findAllByUsuario(usuario).each {
            if(it.perfil.authority=="ROLE_ADMIN"){
                respuesta=true;
            }
        }
        return respuesta
    }

}
