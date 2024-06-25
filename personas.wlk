import cervezas.*
import carpas.*

class Personas{
	var property peso
	var property jarrasCompradas = []
	var property leGustaEscucharMusicaTrad 
	var  property aguante
	const property nacionalidad
	
	method marcaQueLeGusta(marca) 
	
	method totalAlcoholIngerido() = jarrasCompradas.sum({c => c.graduacionAlcohol()})
	method estaEbria() = self.totalAlcoholIngerido() * peso > aguante
	method quiereIngresar(carpa) {
	return
	self.marcaQueLeGusta(carpa.marcaQueVende())  and
    self.leGustaEscucharMusicaTrad()== carpa.hayBanda()
	}
	method comprarJarra(jarra){jarrasCompradas.add(jarra)}
	method esEbrioEmpedernido() = self.estaEbria() and jarrasCompradas.all( {j => j.litros()>=1 })
	method esPatriota()= jarrasCompradas.all({j => j.marca().paisFabricacion()== nacionalidad  })
	method marcasDeJarrasCompradas() = jarrasCompradas.map({ j=> j.marca()}).asSet()
	method esCompatibleCon(persona){
		if (self.lasJarrasDeUno(persona) == 0 or self.lasJarrasDeOtro(persona) == 0) {
    		return false
    	} else {
    		return (self.lasJarrasDeUno(persona) / self.lasJarrasDeOtro(persona)) <= 2
    	}
  	}

    method lasJarrasDeUno(persona) {
    	return self.marcasDeJarrasCompradas().size()
    }

    method lasJarrasDeOtro(persona) {
    	return self.marcasDeJarrasCompradas().intersection(persona.marcaDeJarrasCompradas()).size()
    }

	method enQueCarpaLeSirvieron(jarra) = jarrasCompradas.map({ j=> j.carpa() }).asSet()
	
	method capacidadDeJarrasCompradas() {
    	return jarrasCompradas.map({c => c.litros()})
    } 

	
	method estaEnVicio() {
		if (self.capacidadDeJarrasCompradas().size() == 0 or self.capacidadDeJarrasCompradas().size() == 1) 
			return false
		else
			return self.capacidadDeJarrasCompradas().get(self.capacidadDeJarrasCompradas().size() - 2) <= self.capacidadDeJarrasCompradas().last() 
		}

}

class Belgas inherits Personas{
	override method marcaQueLeGusta(marca) {
		return
		marca.contenidoDeLupulo() > 4
	}
	override method nacionalidad() = "Belga"
	

}

class Checos inherits Personas{
	override method marcaQueLeGusta(marca) {
		return
		marca.graduacion() > 8
	}
	override method nacionalidad() = "Checa"
}

class Alemanes inherits Personas{
	override method marcaQueLeGusta(marca) = true
	override method quiereIngresar(carpa){
		return
		super(carpa) and carpa.carpaEsPar()
			
	}
	override method nacionalidad() = "Alemana"
}

