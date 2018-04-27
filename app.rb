require 'sinatra'
require "./lib/Scrabble.rb"

get '/' do
		@@scrabble = Scrabble.new
  	@letrasIniciales=@@scrabble.obtenerLetrasIniciales
  	@valorLetras = "1 8 5 3 1"
		erb :scrabble 
end

post '/validarPalabra' do
	@palabraIngresada = params["palabraIngresada"]
	@@scrabble.capturarPalabra params["palabraIngresada"]
	@letrasIniciales=@@scrabble.obtenerLetrasIniciales
  @puntaje=@@scrabble.obtenerPuntaje
	if @@scrabble.verificarPalabraIngresada
		@mensaje = "Puntaje: #{@puntaje}" 
	else
    @mensaje = "No puede utilizar mas letras de las disponibles"
	end
	erb :scrabble 
end


