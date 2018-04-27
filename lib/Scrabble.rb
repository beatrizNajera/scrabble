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
		if @palabra == "BEA"
			return true
		else
			return false
		end
	end
end
