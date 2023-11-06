import viajes.*

class Socios {
	const property actividadesQueRealizo = []
	const maximoDeActividades 
	const property edad
	const property idiomas = #{}
	
	method esAdoradorDeSol() = actividadesQueRealizo.all({a=>a.puedeBroncearse()})
	
	method actividadesEsforzadas() = actividadesQueRealizo.filter({a=>a.implicaEsfuerzo()})
	
	method cantDeActividadesQueRealizo() = actividadesQueRealizo.size()
	
	method realizarActividad(unaActividad) { if (self.cantDeActividadesQueRealizo() >= maximoDeActividades){
												self.error("Este socio ya llego al limite de actividades realizadas")
												}
											 actividadesQueRealizo.add(unaActividad)}
											 
	method actividadesQueRealizo() = actividadesQueRealizo
	
	
	
	method cantidadDeIdiomas() = idiomas.size()
	
	method edad() = edad
}

class SocioTranquilo inherits Socios {
	method leAtraeUnaActividad(unaActividad) = unaActividad.cantidadDeDias() >= 4
}

class SocioCoherente inherits Socios{
	method  leAtraeUnaActividad(unaActividad) = (self.esAdoradorDeSol() and unaActividad.puedeBroncearse()) or unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socios {
	method leAtraeUnaActividad(unaActividad) = not idiomas.interseccion(unaActividad.idiomas().isEmpty())
}

// prueba y cambios





