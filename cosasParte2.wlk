object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10  

    method bultos() = 1 
    method consecuenciaDeLaCarga() {}
}

object bumblebee {
    var formaActual = auto

    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel() 
    method cambiarForma(forma) {formaActual = forma}

    method bultos() = 2
    method consecuenciaDeLaCarga() {formaActual = robot}

}

object auto{ method nivel() = 15 }

object robot { method nivel() = 30}

object paqueteDeLadrillos {
    var cantidad = 10

    method peso() = 2 * cantidad
    method nivelDePeligrosidad() = 2  
    method cambiarCantidad(unaCantidad) {cantidad = unaCantidad}

    method bultos(){
        if(cantidad < 100){ return 1} 
        else if(cantidad .between(101, 300)){ return 2}
        else return 3
    }

    method consecuenciaDeLaCarga() {cantidad += 12}
}

object arenaAGranel {
    var property peso = 10

    method peso() = peso
    method nivelDePeligrosidad() = 1  

    method bultos() = 1

    method consecuenciaDeLaCarga() {peso -= 10.max(0)}
}

object bateria {
    var estáConMisiles = false

    method peso() = if(estáConMisiles) 300 else 200
    method nivelDePeligrosidad() = if(estáConMisiles) 100 else 0
    method cargarYDescargarMisiles() { estáConMisiles = !estáConMisiles}

    method bultos() =if(estáConMisiles) 2 else 1

    method consecuenciaDeLaCarga() {estáConMisiles = true}
}

object contenedor {
    const cosasContenidas = []

    method peso() = 100 + self.pesoDeCosasContenidas()
    method pesoDeCosasContenidas() = cosasContenidas.sum({c=>c.peso()}) 
    method nivelDePeligrosidad() = if(! cosasContenidas.isEmpty()) self.cosasContenidasMasPeligrosa().nivelDePeligrosidad()  
    method cosasContenidasMasPeligrosa() = cosasContenidas.max({c=>c.nivelDePeligrosidad()})
    method meterElementos(listaDeElemntos) {cosasContenidas.addAll(listaDeElemntos)}

    method bultos() = 1 + self.bultosDeCosasContenidos()
    method bultosDeCosasContenidos() = cosasContenidas.sum({c=>c.bultos()})

    method consecuenciaDeLaCarga() {
        cosasContenidas.forEach({c => c.consecuenciaDeLaCarga()})    
    }
}

object residuos {
    var property peso = 10

    method peso() = peso
    method nivelDePeligrosidad() = 200
    method bultos() = 1 

    method consecuenciaDeLaCarga() {peso += 15}
}

object embalaje {
    var cosaQueEnvuelve = residuos

    method peso() = cosaQueEnvuelve.peso()
    method nivelDePeligrosidad() = cosaQueEnvuelve.nivelDePeligrosidad() * 0.5
    method cambiarCosaQueEnvuelve(unaCosa) {cosaQueEnvuelve = unaCosa}  

    method bultos() = 2
    method consecuenciaDeLaCarga() {}
}