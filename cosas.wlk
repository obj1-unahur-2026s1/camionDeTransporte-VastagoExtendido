object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10  
}

object bumblebee {
    var formaActual = auto

    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel() 
    method cambiarForma(forma) {formaActual = forma}
}

object auto{ method nivel() = 15 }

object robot { method nivel() = 30}

object paqueteDeLadrillos {
    var cantidad = 10

    method peso() = 2 * cantidad
    method nivelDePeligrosidad() = 2  
    method cambiarCantidad(unaCantidad) {cantidad = unaCantidad}
}

object arenaAGranel {
    var property peso = 10

    method peso() = peso
    method nivelDePeligrosidad() = 1  
}

object bateria {
    var estáConMisiles = false

    method peso() = if(estáConMisiles) 300 else 200
    method nivelDePeligrosidad() = if(estáConMisiles) 100 else 0
    method cargarYDescargarMisiles() { estáConMisiles = !estáConMisiles}
}

object contenedor {
    const cosasContenidas = []

    method peso() = 100 + self.pesoDeCosasContenidas()
    method pesoDeCosasContenidas() = cosasContenidas.sum({c=>c.peso()}) 
    method nivelDePeligrosidad() = if(! cosasContenidas.isEmpty()) self.cosasContenidasMasPeligrosa().nivelDePeligrosidad()  
    method cosasContenidasMasPeligrosa() = cosasContenidas.max({c=>c.nivelDePeligrosidad()})
}

object residuos {
    var property peso = 10

    method peso() = peso
    method nivelDePeligrosidad() = 200  
}

object embalaje {
    var cosaQueEnvuelve = residuos

    method peso() = cosaQueEnvuelve.peso()
    method nivelDePeligrosidad() = cosaQueEnvuelve.nivelDePeligrosidad() * 0.5
    method cambiarCosaQueEnvuelve(unaCosa) {cosaQueEnvuelve = unaCosa}  
}