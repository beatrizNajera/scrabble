class Scrabble
	def initialize 
		@palabra = ""
	end
	def obtenerLetrasIniciales
		"A B C D E"
  end
	def capturarPalabra palabra
		@palabra = palabra
	end

	def verificarPalabraIngresada
		letrasIngresadas = @palabra.scan /\w/
		letrasIniciales = obtenerLetrasIniciales.scan /\w/

		
		usoCorrectamenteSetDeLetras = verificarUsoDeSetDeLetras letrasIngresadas
		usoCorrectamenteCantidadDeSetDeLetras = verificarCantidadDeSetDeLetras letrasIngresadas, letrasIniciales

		if usoCorrectamenteSetDeLetras == false or usoCorrectamenteCantidadDeSetDeLetras == false
			return false
		end

		return true
	end

	def verificarUsoDeSetDeLetras letrasIngresadas
		letrasIngresadas.each do |letra|
			contieneLetra = obtenerLetrasIniciales.include? letra
			if contieneLetra == false
				return false
			end
		end
		return true
	end

	def verificarCantidadDeSetDeLetras letrasIngresadas, letrasIniciales
		letrasIniciales.each do |inicial|
			ocurrencias = letrasIngresadas.count(inicial)
			if ocurrencias > 1
				return false
			end
		end
		return true
	end

end
