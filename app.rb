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
	@@scrabble.calcularPuntaje
  @puntaje=@@scrabble.obtenerPuntaje
  @puntajeAcumulado=@@scrabble.obtenerPuntajeAcumulado
	if @@scrabble.verificarPalabraIngresada
			@mensaje = "Puntaje palabra: #{@puntaje}" + " - " + "Puntaje acumulado: #{ @puntajeAcumulado }" 
	else
		@mensaje = @@scrabble.obtenerMotivoPalabraNoValida
	end
	erb :scrabble 
end


