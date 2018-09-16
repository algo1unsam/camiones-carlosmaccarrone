import cargas.*
import vehiculos.*

object empresa {
	var deposito = []
	
	method recibir(_elementos){
		deposito.addAll(_elementos)
	}
	
	method llenarCamion(){
		deposito.forEach({
			_elemento => if( camion.puedoCargar(_elemento) ){
								camion.cargar(_elemento) 
								deposito.remove(_elemento) }
		})
	}
	
	method llenarMotoneta(){
		deposito.forEach({
			_elemento => if( motoneta.puedoCargar(_elemento) ){
								motoneta.cargar(_elemento) 
								deposito.remove(_elemento) }
		})		
	}			

	method getterDeposito(){
		return deposito
	}
}