class Viajes {
	const property idiomas = #{}
	
	method idiomas() = idiomas
	method implicaEsfuerzo()
	method puedeBroncearse()
	method cantidadDeDias() 
	method esInteresante() = idiomas.size() > 1
	
	method esRecomendable(unSocio) = self.esInteresante() and unSocio.leAtraeUnaActividad(self) and not unSocio.actividades().contains(self)
	
}

class ViajesDePlaya inherits Viajes {
	const largo
	
	method largoDePlaya() = largo
	override method cantidadDeDias() = largo / 500
	override method implicaEsfuerzo() = largo > 1200
	override method puedeBroncearse() = true 
}

class ViajesCiudad inherits Viajes{
	const cantidadDeAtracciones 
	
	method cantidadDeAtracciones() = cantidadDeAtracciones
	override method cantidadDeDias() = self.cantidadDeAtracciones() / 2
	override method implicaEsfuerzo() = cantidadDeAtracciones.between(5,8)
	override method puedeBroncearse() = false
	override method esInteresante() = super() or cantidadDeAtracciones == 5
}

class ViajesACiudadTropical inherits ViajesCiudad {
	override method puedeBroncearse() = true
	override method cantidadDeDias() = super() +1
}

class ViajesDeTrekking inherits Viajes{
	const kilometrosDeSenderos
	const diasDeSolPorAnio
	
	override method cantidadDeDias() = kilometrosDeSenderos / 50
	override method implicaEsfuerzo() = kilometrosDeSenderos > 80
	override method puedeBroncearse() = diasDeSolPorAnio > 200 or (diasDeSolPorAnio.between(100,200) and kilometrosDeSenderos > 120)
	override method esInteresante() = super() and diasDeSolPorAnio > 140
	
}

class ClasesDeGym inherits Viajes{
	
	override method cantidadDeDias() =  1
	override method implicaEsfuerzo() = true
	override method puedeBroncearse() = false
	override method idiomas() = #{"Español"}
	override method esRecomendable(unSocio) = unSocio.edad().between(20,30)
	
}














