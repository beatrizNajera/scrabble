require 'sinatra'
require "./lib/Scrabble.rb"

get '/' do
		@@scrabble = Scrabble.new
  	@letrasIniciales=@@scrabble.obtenerLetrasIniciales
		erb :scrabble 
end

post '/validarPalabra' do
	@palabraIngresada = params["palabraIngresada"]
	@@scrabble.capturarPalabra params["palabraIngresada"]
	@letrasIniciales=@@scrabble.obtenerLetrasIniciales
	if @@scrabble.verificarPalabraIngresada
		@mensaje = "Ok"
	else
    @mensaje = "La palabra contiene letra no valida"
	end
	erb :scrabble 
end


