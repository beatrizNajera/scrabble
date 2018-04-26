require 'sinatra'
require "./lib/Scrabble.rb"

get '/' do
	scrabble = Scrabble.new
  @letrasIniciales=scrabble.obtenerLetrasIniciales
	 erb :scrabble 
end


