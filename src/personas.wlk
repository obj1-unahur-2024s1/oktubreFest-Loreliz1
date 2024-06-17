import cervezas.*

class Personas{
	var  peso
	const  jarrasCompradas = []
	var  leGustaEscucharMusicaTrad 
	var  aguante

	method estaEbria() = 
	(jarrasCompradas.sum({c => c.graduacionAlcohol()}) * peso) > aguante
	method marcaQueLeGusta(cervezas) 
}

class Belgas inherits Personas{
	override method marcaQueLeGusta(cerveza) {
		return
		cerveza.contenidoDeLupulo() > 4
	}
}

class Checos inherits Personas{
	override method marcaQueLeGusta(cerveza) {
		return
		cerveza.graduacion() > 8
	}
}

class Alemanes inherits Personas{
	override method marcaQueLeGusta(cerveza) = true
}
