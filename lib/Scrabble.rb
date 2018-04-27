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
		letrasIngresadas.each do |letra|
			contieneLetra = obtenerLetrasIniciales.include? letra
			if contieneLetra == false
				return false
			end
		end
		return true
	end
end
