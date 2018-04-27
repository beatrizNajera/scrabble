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
     	@mensaje = "La palabra contiene letra no valida"

	erb :scrabble 
end


