class Scrabble

	def initialize 
		@palabra = ""
		@puntajes = [1,8,3,2,1]
		@letrasIniciales = %w{A B C D E}
	end

	def obtenerLetrasIniciales
		@letrasIniciales.join " "
  end

	def obtenerValoresIniciales
		@puntajes.join " "
  end

	def capturarPalabra palabra
		@palabra = palabra.upcase
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

	def obtenerPuntaje
		if verificarPalabraIngresada == false
			return -1
		end
		letrasIngresadas = @palabra.scan /\w/
		puntaje = 0
		letrasIngresadas.each do |letra|
			indiceLetra = @letrasIniciales.index letra
			puntaje += @puntajes[indiceLetra]
		end
		return puntaje
	end

end
