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
	
	
	// TODO este método es exactamente igual al anterior, hay que ver como no repetir este código
	// la forma mas simple sería que el vehículo llegue por parámetro
	method llenarMotoneta(){
		deposito.forEach({
			_elemento => if( motoneta.puedoCargar(_elemento) ){
								motoneta.cargar(_elemento) 
								deposito.remove(_elemento) }
		})		
	}			

	// TODO raro el nombre, pero ok !! :P
	method getterDeposito(){
		return deposito
	}
}