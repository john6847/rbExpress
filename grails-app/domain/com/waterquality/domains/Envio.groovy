package com.waterquality.domains

import com.waterquality.domains.seguridad.Usuario

class Envio {

    String nombreRemitente
    String telefonoRemitente

    String nombreDestinatario
    String telefonoDestinatario

    Sucursal puntoOrigin
    Sucursal puntoDestino

//    TipoPaquete tipoPaquete

    String nombrePaquete
    BigDecimal precioPaquete
    BigDecimal pesoPaquete
    String detallesAdicionales

    BigDecimal precioTotalEnvio=0.0

    boolean conValor=false
    boolean entregado=false


    //Datos genericos del dominio.
    boolean habilitado = true;
    String creadoPor = "sistemas"
    String modificadoPor = "sistemas"
    Date dateCreated
    Date lastUpdated


    static constraints = {
        detallesAdicionales nullable: true
    }
}
