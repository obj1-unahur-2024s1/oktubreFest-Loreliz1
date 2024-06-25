import cervezas
import personas.*
	
class Carpas{
var limiteDeGente
var property hayBanda
var property marcaQueVende
const personas = []
var property recargo

method carpaEsPar() =self.cantidadPersonas().even() 
method agregarPersona(persona) = personas.add(persona)
method cantidadPersonas() = personas.size()
method hayCapacidadParaIngresar(persona){ return limiteDeGente > self.cantidadPersonas()}


method dejaIngresar(persona){	
	return
	self.hayCapacidadParaIngresar(persona) and not persona.estaEbria()
}
method puedeingresar(persona){		
	if(self.dejaIngresar(persona) and persona.quiereIngresar(self))
		self.agregarPersona(persona)
	else
		self.error("No hay capacidad")
}	
	
method servirUnaJarra(persona, capacidad){
	const jarra = new Jarra(litros= capacidad, marca = marcaQueVende)
	if(personas.contains(persona))
	 persona.comprarJarra(jarra)
	else
	self.error("La persona no esta en la carpa")
	}
	
method cantidadEbriosEmpedernidos()= personas.count({ e => e.esEbrioEmpedernido() })	
	
method esCarpaHomogenea() = personas.map({p => p.nacionalidad()}).asSet().size() ==1

//method clientesSinServir() = personas.filter({ p => not p.carpasDondeSeTomo().contains(self)})

method precioPorLitro() = self.marcaQueVende().precioLitro() + recargo.recargo(self)

object recargoFijo {
	method recargo(carpa) = 1.3
	}

object 	recargoPorCantidad {
	method recargo (carpa) {
		return
		if(carpa.cantidadPersonas() / carpa.cantidadPersonas().size() <= 2) 1.4
		else 1.25
	}
}

object recargoPorEbriedad {
	method recargo (carpa)=
		if (carpa.cantidadEbrios() >= carpa.cantidadPersonas().size()* 0.75 )
			 1.5
			 else 1.2
}

method cantidadEbrios()= personas.count({p => p.estaEbria()})

}

// test assert.throwsExceptionWhithMessage("mensaje escrito",{prodedimiento})