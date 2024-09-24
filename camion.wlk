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
    method todosLasCosasTienenPesoPar(){
        return carga.all({cosa => cosa.peso().odd()})
    }

    //No vi que en ninguna cosa tenga "VALOR" como atributo, pero lo dejo asi por ahora
    //Debemos poder consultar si hay alguna cosa que pesa un determinado valor.*/
    method hayAlgunaCosaEnLaCargaDeValor(valor){
        return carga.any({cosa => cosa.valor() == valor})
    }

    /*
    Para un mejor control del tipo de peligro que puede representar la carga, 
    se debe poder obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad
    */
    method primeraCosaConPeligrosidadNivel(nivel){
        return self.cosasConNivelDePeligrosidad(nivel).first()
    }

    method cosasConNivelDePeligrosidad(nivel){
        return carga.filer({cosa => cosa.nivelPeligrosidad() == nivel})
    }

    //Obtener todas las cosas que superan un determinado nivel de peligrosidad.
    method cosasQueSuperanElNivelDePeligrosidad(nivel){
        return carga.filter({cosa => cosa.nivelPeligrosidad() > nivel})
    }

    /*
    Para facilitar los controles, también nos piden que se pueda consultar la lista de cosas que 
    superan el nivel de peligrosidad de una cosa dada.
    */
    method cosasQueSuperanElNivelDePeligrosidadDeUnaCosa(unaCosa){
        return self.cosasQueSuperanElNivelDePeligrosidad(unaCosa.nivelPeligrosidad())
    }

    //Conocer si el camión está excedido del peso máximo permitido,que es de 2500 kg.
    method elPesoEstaExcedido(){
        return self.pesoTotalCamion() > pesoMaximoPermitido
    }

    /*
    Saber si el camión puede circular en ruta. Eso depende de que no exceda el peso máximo permitido y ninguno de los objetos 
    cargados supere un nivel máximo de peligrosidad que depende del viaje, 
    por eso para este caso el valor del nivel se pasará como argumento
    */
    method puedeCircularEnRuta(nivelMaximoPeligrosidadViaje){
        return !self.elPesoEstaExcedido() and 
               carga.all({cosa => cosa.nivelPeligrosidad() < nivelMaximoPeligrosidadViaje})
    }


    /*
    Se pide además, que se le pueda consultar al camión si tiene alguna cosa que pesa entre un valor mínimo y un valor máximo, y 
    la cosa más pesada que tiene cargada.
    */    

    method tieneAlgunaCosaQuePeseEntre(valorMinimo,valorMaximo){
        return carga.any({cosa => cosa.peso().between(valorMinimo,valorMaximo)})
    }

    method laCosaMasPesadaCargada(){
        return carga.max({cosa => cosa.peso()})
    }
}