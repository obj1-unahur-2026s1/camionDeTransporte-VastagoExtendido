import cosas.*
object camion {

    const cosasCargadas = []

    method cargar(unObjeto) {cosasCargadas.add(unObjeto)}
    method descargar(unObjeto) {cosasCargadas.remove(unObjeto)}
    method cargarCosas(unaLista) {cosasCargadas.addAll(unaLista)}

    method peso() = 1000 + cosasCargadas.sum({c => c.peso()})

    method todosLosPesosSonPares(){
        return cosasCargadas.all({c => c.peso().even()})
    } 
    
    method hayUnaCargaQuePesa(unPeso){
        return cosasCargadas.any({c => c.peso() == unPeso})
    }

    method primeraCargaQueTieneNivelDePelogrisidadA(peligrosidad){
        return cosasCargadas.findOrDefault({c => c.nivelDePeligrosidad() == peligrosidad}, "No hay Objeto")
    } 

    method cosasQueSuperanPeligrosidad(unaPeligrosidad){
        return cosasCargadas.filter({c => c.nivelDePeligrosidad() > unaPeligrosidad}) 
    }

    method cosasCargadasQueSuperanNivelDePeligrosidadDeCosa(cosa) {
        return self.cosasQueSuperanPeligrosidad(cosa.nivelDePeligrosidad())
    }

    method estaExcedidoDePeso(){return self.peso() > 2500}
    
    method puedeCircularEnRuta(nivelMaximo) { 
        return !self.estaExcedidoDePeso() and 
        self.cosasQueSuperanPeligrosidad(nivelMaximo).isEmpty()
    }

    method algunaCargaPesaEntre(min, max) = cosasCargadas.any({c=>c.peso()}).between(min, max)

    method cargaMasPesada() = cosasCargadas.max({c=>c.peso()})
}