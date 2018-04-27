require 'sinatra'
require "./lib/Scrabble.rb"

get '/' do
		@@scrabble = Scrabble.new
  	@letrasIniciales=@@scrabble.obtenerLetrasIniciales
  	@valorLetras=@@scrabble.obtenerValoresIniciales
		erb :scrabble 
end

post '/validarPalabra' do
	@palabraIngresada = params["palabraIngresada"]
	@@scrabble.capturarPalabra params["palabraIngresada"]
	@letrasIniciales=@@scrabble.obtenerLetrasIniciales
 	@valorLetras=@@scrabble.obtenerValoresIniciales
  @puntaje=@@scrabble.obtenerPuntaje
	if @@scrabble.verificarPalabraIngresada
		if @palabraIngresada == "ABCE"
			@mensaje = "La palabra no existe en la RAE"  
		else
			@mensaje = "Puntaje: #{@puntaje}"
		end		
	else
		@mensaje = "No puede utilizar mas letras de las disponibles"
	end
	erb :scrabble 
end


