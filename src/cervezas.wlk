
class MarcaCerveza{
	const paisFabricacion
	var lupulo
	var porcentajeDeAlcohol
	method contenidoDeLupulo()= 1 / lupulo
	method paisFabricacion()= paisFabricacion
	method graduacionAlcohol() = 1 / porcentajeDeAlcohol 
}

class CervezaRubia inherits MarcaCerveza{}

class Corona inherits CervezaRubia{}

class CervezaNegra inherits MarcaCerveza{
	override method graduacionAlcohol(){
		return
		graduacionReglamentaria.graduacion() / lupulo*2		
	}
}

class Guiness inherits CervezaNegra{}

class CervezaRoja inherits CervezaNegra{
	override method graduacionAlcohol(){
		return
		super() * 1.25
	}
}

class Hofbrau inherits CervezaRoja{}

object graduacionReglamentaria{
	var property graduacion
}


class Jarra{
	var property litros
	var property marca
	method contenidoAlcohol() = marca.graduacion() * litros
}