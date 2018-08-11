package com.waterquality.domains

class TipoPaquete {

    String nombrePaquete
    BigDecimal precioPaquete
    BigDecimal pesoPaquete

    //Datos genericos del dominio.
    boolean habilitado = true;
    String creadoPor = "sistemas"
    String modificadoPor = "sistemas"
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
}
