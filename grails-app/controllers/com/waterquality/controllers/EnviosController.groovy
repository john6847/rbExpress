package com.waterquality.controllers

import com.waterquality.PrintLy
import com.waterquality.Printer
import com.waterquality.domains.Envio
import com.waterquality.domains.Sucursal
import com.waterquality.domains.seguridad.Usuario
import grails.plugin.springsecurity.annotation.Secured

import javax.print.PrintService
import javax.swing.JButton
import javax.swing.JFrame
import javax.swing.UIManager
import java.awt.event.WindowAdapter
import java.awt.event.WindowEvent
import java.awt.print.PrinterJob


@Secured(["ROLE_ADMIN", "ROLE_USUARIO"])
class EnviosController {

    def springSecurityService

    def enviosIndex() {

        [listadoEnvios:Envio.findAllByEntregadoAndHabilitado(false,true,
                [sort: "id", order: "desc"])]
    }



    def enviosIndexEntregados() {
        [listadoEnvios:Envio.findAllByEntregadoAndHabilitado(true,true)]
    }


    def crearEnvio(){
        [listadoSucursales:Sucursal.findAllByHabilitado(true)]
    }


    //Hay que crear un form para todos estos atributos.
    def crearEnvioPost(String remitente,String telefono_remitente,String destinatario,String telefonoDestinatario,
                       long punto_origen,long punto_destino,String conValor,String detallesAdicionales,
                       String precio_envio,String nombre_paquete,String precioPaquete,String peso_paquete){
        println params
        println conValor

        Sucursal sucursal_origen=Sucursal.findById(punto_origen)
        Sucursal sucursal_destino=Sucursal.findById(punto_destino)
        BigDecimal precioTotal=precio_envio.toBigDecimal()
        BigDecimal precio_paquete=precioPaquete.toBigDecimal()
        BigDecimal pesoPaquete=peso_paquete.toBigDecimal()
        boolean con_valor

        Usuario usuario = (Usuario)springSecurityService.currentUser

        if (conValor=="on"){
            con_valor=true
        }else {
            con_valor=false
        }

        Envio envio=new Envio(identificador:"ENV-000"+(Envio.findAll().size()+1),nombreRemitente: remitente,telefonoRemitente: telefono_remitente,nombreDestinatario: destinatario,telefonoDestinatario: telefonoDestinatario,
                                puntoOrigin: sucursal_origen,puntoDestino: sucursal_destino,precioTotalEnvio: precioTotal,detallesAdicionales: detallesAdicionales,
                                fechaEnvio: new Date(),nombrePaquete: nombre_paquete,precioPaquete: precio_paquete,pesoPaquete: pesoPaquete,empleado: usuario,conValor: con_valor).save(flush:true,failOnError:true)


        //Directamente impirmir?

        redirect(uri:"/envios/enviosIndex")
    }


    def entegarPaquete(long idEnvio){
        Envio envio=Envio.findById(idEnvio)
        println envio.entregado
        envio.entregado=true
        envio.save(flush:true,failOnError:true)

        redirect(uri:"/envios/enviosIndex")
    }

    def printEnvio(){
        String Header =
        """*********Resturant Management*******;"
        + "         Original Receipt        \n;"
        + "---------------------------------\n;"
        + "Product Description              \n;"
        + "Name             Qty       Amount\n;"

        + "---------------------------------\n;";
        + "Total Amount:      Rs.9000\n"
        + "---------------------------------\n;"
        + "---------------------------------\n;"
        + "For Further Detail                \n;"
        + "Please Call/Whatsapp 0340-8351689\n;"
        + "---------------------------------\n;"
        + "       Software Developed by      \n ;"
        + "        Hammad Ahmed Khan          ;"
        + "*********************************\n;"
        + "            Thank You             \n;"
        + "_________________________________\n;"""


        PrintLy.printCard(Header)
    }


    def imprimirEnvio(long idEnvio){
        [envio:Envio.findById(idEnvio)]
    }

    def visualizarEnvio(long idEnvio){
        [envio:Envio.findById(idEnvio)]
    }

    def editarEnvio(long idEnvio){
        [envio:Envio.findById(idEnvio),listadoSucursales:Sucursal.findAllByHabilitado(true)]
    }

    def editarEnvioPost(long idEnvio,String remitente,String telefono_remitente,String destinatario,String telefonoDestinatario,
                        String conValor,String detallesAdicionales,
                        String precio_envio,String nombre_paquete,String precioPaquete,String peso_paquete) {

        boolean con_valor

        if (conValor=="on"){
            con_valor=true
        }else {
            con_valor=false
        }

        Envio envio=Envio.findById(idEnvio)
        envio.nombreRemitente=remitente
        envio.telefonoRemitente=telefono_remitente
        envio.nombreDestinatario=destinatario
        envio.telefonoDestinatario=telefonoDestinatario
        envio.conValor=con_valor
        envio.detallesAdicionales=detallesAdicionales
        envio.precioTotalEnvio=precio_envio.toBigDecimal()
        envio.nombrePaquete=nombre_paquete
        envio.precioPaquete=precioPaquete.toBigDecimal()
        envio.pesoPaquete=peso_paquete.toBigDecimal()

        envio.save(flush:true,failOnError:true)

        redirect(uri:  "/envios/enviosIndex")

    }
}
