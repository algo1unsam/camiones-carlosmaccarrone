import empresa.*
import vehiculos.*

object knight {
	const property peso = 500
	const property riesgo = 10	
}
 
object bumblebee {
 	const property peso = 800
 	var property forma = 3
 	
 	method riesgo(){
 		return forma.riesgo()
 	}	 	
 }   

object ladrillos {
	var property cantidad = null	
	const property riesgo = 2
	const pesoUnidad = 2
	
	method peso(){
		return pesoUnidad * cantidad
	}	
}

object auto{
	method riesgo(){
		return 15
	}
}
object robot{
	method riesgo(){
		return 30
	}	
}

object contenedor {
	var property contenido = []
	var pesoNeto = 100
	
	method peso(){
		return pesoNeto + contenido.sum({ _elemento => _elemento.peso() })
	}
	
	method riesgo(){
		return if( contenido.isEmpty() ){ 0 } else {
		contenido.max({ _elemento => _elemento.riesgo() }).riesgo() }
	}
}

object embalaje {
	var property elemento = null
	const mitad = 2
	
	method peso(){
		return elemento.peso()
	}
	
	method riesgo(){
		return ( elemento.riesgo() / mitad )
	}
}
