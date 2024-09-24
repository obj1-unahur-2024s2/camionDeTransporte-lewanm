object knightRider{
    method peso() = 500
    method nivelPeligrosidad() = 10
}

object bumblebee{
    var estaTransformadoComoRobot = false
    method peso() = 800
    //no supe usar la terna
    method nivelPeligrosidad() = 15 //estaTransformadoComoRobot ? 30 : 15

    method transformar(){
        estaTransformadoComoRobot = !estaTransformadoComoRobot
    }
}

object paqueteDeLadrillos{
    var cantidadDeLadrillos = 0
    const pesoPorLadrillo = 2

    method cantidadDeLadrillos(nuevaCantidad){
        cantidadDeLadrillos = nuevaCantidad
    }
    method agregarLadrillos(unaCantidad){
        if(cantidadDeLadrillos >= 0){
            cantidadDeLadrillos += unaCantidad
        }
    }

    method quitarLadrillos(unaCantidad){
        if(cantidadDeLadrillos < 0){
            cantidadDeLadrillos = 0.max(cantidadDeLadrillos - unaCantidad)
        }
    }

    method peso() = cantidadDeLadrillos * pesoPorLadrillo
    method nivelPeligrosidad() = 2
}

object arenaAGranel{
    var property peso = 0
    method nivelPeligrosidad() = 1
}

object bateriaAntiaerea{
    var tieneMisiles = false

    method peso() = 200 // tieneMisiles ? 300 : 200
    method nivelPeligrosidad() = 0 // tieneMisiles ? 100 : 0
}

object contenedorPortuario{
    const cosasDentro = []
    const pesoBaseContenerdor = 100

    method peso(){
        return pesoBaseContenerdor + cosasDentro.sum({cosa => cosa.peso()})
    }

    method nivelPeligrosidad(){
        return 0// cosasDentro.size() == 0 ? 0 : self.maxNivelPeligrosidadContenedor()
    }

    method maxNivelPeligrosidadContenedor(){
        return cosasDentro.max({cosa => cosa.nivelPelgrosidad()})
    }
}

object residuosRadioactivos{
    var property peso = 0

    method nivelPeligrosidad() = 200 
}

object embalajeDeSeguridad{
    var cosaAsegurada = null

    method peso() = cosaAsegurada.peso()
    method nivelPeligrosidad() = cosaAsegurada.nivelPeligrosidad() / 2
}