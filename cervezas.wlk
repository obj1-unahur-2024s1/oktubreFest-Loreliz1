import personas.*
import carpas.*

class MarcaCerveza{
	var property paisFabricacion
	var property lupulo
	var property graduacionAlcohol
	var property precioLitro
}

class CervezaRubia inherits MarcaCerveza{

}

class CervezaNegra inherits MarcaCerveza{
	override method graduacionAlcohol(){
		return
		graduacionReglamentaria.graduacion().min(lupulo*2) 		
	}
}
object graduacionReglamentaria{
	var property graduacion = 5
}

class CervezaRoja inherits CervezaNegra{
	override method graduacionAlcohol(){
		return
		super() * 1.25
	}
}


class Jarra{
	const property litros
	const property marca
	var property carpa
	
	method contenidoAlcohol() = (marca.graduacionAlcohol() /1000) * litros
	// method contenidoAlcohol() = marca.graduacionAlcohol() * capacidadJarra
	method jarraConMasDe1Litro() = litros>=1 
	
	method precioDeVenta(){
		litros * marca.precioLitro().carpa.recargo().recargo(carpa)
	}
}

