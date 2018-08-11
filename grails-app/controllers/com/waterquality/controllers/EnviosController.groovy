package com.waterquality.controllers

import com.waterquality.domains.Envio
import com.waterquality.domains.Sucursal
import grails.plugin.springsecurity.annotation.Secured


@Secured(["ROLE_ADMIN", "ROLE_USUARIO"])
class EnviosController {

    def enviosIndex() {
        [listadoEnvios:Envio.findAllByEntregadoAndHabilitado(false,true)]
    }

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

    boolean conValor=false
    boolean entregado=false

    def crearEnvio(){
        [listadoSucursales:Sucursal.findAllByHabilitado(true)]
    }


    //Hay que crear un form para todos estos atributos.
    def crearEnvioPost(String remitente,String telefono_remitente,String destinatario,String telefonoDestinatario,String punto_origen,String punto_destino,String conValor,String detallesAdicionales,String precio_envio){
        println params
        println conValor

        Sucursal sucursal_origen=Sucursal.findByNombre(punto_origen)
        Sucursal sucursal_destino=Sucursal.findByNombre(punto_destino)
        BigDecimal precioTotal=precio_envio.toBigDecimal()

        Envio envio=new Envio(nombreRemitente: remitente,telefonoRemitente: telefono_remitente,nombreDestinatario: destinatario,telefonoDestinatario: telefonoDestinatario,
                                puntoOrigin: sucursal_origen,puntoDestino: sucursal_destino,precioTotalEnvio: precioTotal,detallesAdicionales: detallesAdicionales).save(flush:true,failOnError:true)


        //Directamente impirmir?
        redirect(uri:"/envios/enviosIndex")

    }
}
