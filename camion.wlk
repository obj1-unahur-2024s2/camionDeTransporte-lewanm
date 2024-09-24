/*
Hacer toda la parte 1 hasta "agregados al camión" en los archivos camion.wlk y cosas.wlk.
Armar dos tests, cosasTest.wtest y camionTest.wtest.
*/
object camion {

    /*
    Se pide que se le pueda cargar y descargar cosas (de 1 a vez) y también cual es el peso total del camión, 
    incluyendo su tara que es de 1000 kg.
    */
    const pesoBaseCamion = 1000
    const pesoMaximoPermitido = 2500
    const carga = []

    method cargar(cosa){
        carga.add(cosa)
    }

    method descargar(cosa){
        if(carga.contains(cosa)){
            carga.remove(cosa)
        }
    }

    method pesoTotalCarga(){
        return carga.sum({carga => carga.peso()})
    }

    method pesoTotalCamion(){
        return pesoBaseCamion + self.pesoTotalCarga()
    }

    
    //También se necesita conocer si los pesos de todas las cosas cargadas en el camión son números impares.
    method todosLasCargasTienenPesoPar(){
        return carga.all({carga => carga.peso().odd()})
    }

    //Debemos poder consultar si hay alguna cosa que pesa un determinado valor.*/
    method hayAlgunaCosaEnLaCargaDeValor(valor){
        return carga.any({carga => carga.valor() == valor})
    }

    /*
    Para un mejor control del tipo de peligro que puede representar la carga, 
    se debe poder obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad
    */
    method primeraCargaConPeligrosidadNivel(nivel){
        return self.cargasConNivelDePeligrosidad(nivel).first()
    }

    method cargasConNivelDePeligrosidad(nivel){
        return carga.filer({carga => carga.nivelPeligrosidad() == nivel})
    }

    //Obtener todas las cosas que superan un determinado nivel de peligrosidad.
    method cargasQueSuperanElNivelDePeligrosidad(nivel){
        return carga.filter({carga => carga.nivelPeligrosidad() > nivel})
    }

    /*
    Para facilitar los controles, también nos piden que se pueda consultar la lista de cosas que 
    superan el nivel de peligrosidad de una cosa dada.
    */
    method cargasQueSuperanElNivelDePeligrosidadDeUnaCarga(unaCarga){
        return self.cargasQueSuperanElNivelDePeligrosidad(unaCarga.nivelPeligrosidad())
    }

    //Conocer si el camión está excedido del peso máximo permitido,que es de 2500 kg.
    method elPesoEstaExedido(){
        return pesoTotalCamion() > pesoMaximoPermitido
    }

}