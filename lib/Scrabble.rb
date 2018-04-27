class Scrabble

	def initialize 
		@palabras = []
		@puntajes = [1,8,3,2,1]
		@letrasIniciales = %w{A B C D E}
		@palabrasValidas = %w{BEA CAE CABE CEDA CEBA DA DEBA DEA BECA DE}
		@usoCorrectamenteSetDeLetras = false
		@usoCorrectamenteCantidadDeSetDeLetras = false
		@existePalabraIngresada = false
	end

	def obtenerLetrasIniciales
		@letrasIniciales.join " "
  end

	def obtenerValoresIniciales
		@puntajes.join " "
  end

	def capturarPalabra palabra
		@palabras << palabra.upcase
	end

	def verificarPalabraIngresada
		letrasIngresadas = @palabras[-1].scan /\w/
		letrasIniciales = obtenerLetrasIniciales.scan /\w/

		
		@usoCorrectamenteSetDeLetras = verificarUsoDeSetDeLetras letrasIngresadas
		@usoCorrectamenteCantidadDeSetDeLetras = verificarCantidadDeSetDeLetras letrasIngresadas, letrasIniciales
		@existePalabraIngresada = verificarSiPalabraIngresadaExiste
	
		if @usoCorrectamenteSetDeLetras == false or @usoCorrectamenteCantidadDeSetDeLetras == false or @existePalabraIngresada == false
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

	def verificarSiPalabraIngresadaExiste
		cantidadEncontrada = @palabrasValidas.count(@palabras[-1])
		if cantidadEncontrada > 0
			return true
		else
			return false
		end
	end

	def obtenerMotivoPalabraNoValida
		if @usoCorrectamenteSetDeLetras == false
			return "No puede utilizar mas letras de las disponibles"
		elsif @usoCorrectamenteCantidadDeSetDeLetras == false 
			return "No puede utilizar mas letras de las disponibles"
		elsif @existePalabraIngresada == false		
			return "La palabra no existe en la RAE"
		else
			return ""
		end
	end

	def obtenerPuntaje
		if verificarPalabraIngresada == false
			return -1
		end
		puntaje = 0
		@palabras.each do |palabra|
			letrasIngresadas = palabra.scan /\w/
			letrasIngresadas.each do |letra|
				indiceLetra = @letrasIniciales.index letra
				puntaje += @puntajes[indiceLetra]
			end
		end
		return puntaje
	end

end
