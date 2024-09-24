object knightRider{
    method peso() = 500
    method nivelPeligrosidad() = 10
}

object bumblebee{
    var estado = false
    method peso() = 800
    //no supe usar la terna
    method nivelPeligrosidad() = estado.peligrosidad()

    method transformar(nuevoEstado){
        estado = nuevoEstado
    }
}
object robot{
    method peligrosidad() = 30
}

object auto{
    method peligrosidad() = 15
}

object paqueteDeLadrillos{
    var property cantidadDeLadrillos = 0
    const pesoPorLadrillo = 2
    /*
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
    */

    method peso() = cantidadDeLadrillos * pesoPorLadrillo
    method nivelPeligrosidad() = 2
}

object arenaAGranel{
    var property peso = 0
    method nivelPeligrosidad() = 1
}

object bateriaAntiaerea{
    var tieneMisiles = false

    method cargarMisiles(){
        tieneMisiles = true
    }

    method descargarMisiles(){
        tieneMisiles = false
    }

    method peso() = if (tieneMisiles) 300 else 200
    method nivelPeligrosidad() = if (tieneMisiles) 100 else 0
}

object contenedorPortuario{
    const cosasDentro = []
    const pesoBaseContenerdor = 100

    method agregarCosas(listaDeCosas){
        cosasDentro.addAll(listaDeCosas)
    }

    method agregarCosa(cosa){
        cosasDentro.add(cosa)
    }

    method quitarCosa(cosa){
        cosasDentro.remove(cosa)
    }

    method peso(){
        return pesoBaseContenerdor + self.pesoAlmacenado()
    }

    method pesoAlmacenado(){
        return cosasDentro.sum({cosa => cosa.peso()})
    }

    method nivelPeligrosidad(){
        return if (cosasDentro.size() == 0)  0 else self.maxNivelPeligrosidadContenedor()
    }

    method maxNivelPeligrosidadContenedor(){
        return cosasDentro.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
    }
}

object residuosRadioactivos{
    var property peso = 0

    method nivelPeligrosidad() = 200 
}

object embalajeDeSeguridad{
    var cosaAsegurada = null

    method asegurar(cosa){
        cosaAsegurada = cosa
    }
    method peso() = cosaAsegurada.peso()
    method nivelPeligrosidad() = cosaAsegurada.nivelPeligrosidad() / 2
}