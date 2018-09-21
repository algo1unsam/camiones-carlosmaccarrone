import cargas.*
import empresa.*

object camion {
	var carga = []
	const cargaMax = 2500
	
	// TODO este es un método de órden, de debería devolver nada
	method cargar(_elemento){
		return if( self.puedoCargar(_elemento) )
		{ carga.add( _elemento) } else { false }
	}
	
	method descargar(_elemento){
		carga.remove(_elemento)
	}
	
	method preguntarElemento(_elemento){
		return carga.contains(_elemento)
	}
	
	method pesoActual(){
		return carga.sum({ _elemento => _elemento.peso() })
	}
	
	method disponibilidad(){
		return cargaMax - self.pesoActual()
	}
	
	// TODO acá podías usar disponibilidad()
	method puedoCargar(_elemento){
		return cargaMax > ( self.pesoActual() + _elemento.peso() )
	}		
	
	// TODO El default a lo mejor debería ser algo parecido a lo que devolvería en caso de haber algo en la lista
	// en este caso, o bien o espero un elemento, o sino, si no hay elemento, que devuelva null.
	// habría que ver que devuelve max, pero estoy tentada de decir que le else está demás
	method elementoMasPeligroso(){
		return if( !carga.isEmpty() ){
			carga.max({ _elemento => _elemento.riesgo() })
			} else { false }
	}
	
	method puedoIrPorRuta(_limite){
		return if( !carga.isEmpty() ){
			(_limite >= carga.max({ _elemento => _elemento.riesgo() }).riesgo() )
		} else { true }
	}	
}

object motoneta {
	var carga = []
	const cargaMax = 100
	const riesgoMax = 5
	
	method cargar(_elemento){
		return if( self.puedoCargar(_elemento) )
		{ carga.add( _elemento) } else { false }
	}
	
	method descargar(_elemento){
		carga.remove(_elemento)
	}	
	
	method puedoCargar(_elemento){
		return cargaMax >= ( self.pesoActual() + _elemento.peso() ) and
				riesgoMax >= _elemento.riesgo()
	}	

	method pesoActual(){
		return carga.sum({ _elemento => _elemento.peso() })
	}
}