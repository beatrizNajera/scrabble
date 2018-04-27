require "./lib/Scrabble.rb"

describe "Scrabble" do
  it "muestra letras iniciales" do
		scrabble = Scrabble.new
  	scrabble.obtenerLetrasIniciales.should == "A B C D E"
  end
	it "capturar palabra valida BEA" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BEA"
		resultado = scrabble.verificarPalabraIngresada
  	resultado.should == true
  end

	it "capturar palabra valida BECA" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BECA"
		resultado = scrabble.verificarPalabraIngresada
  	resultado.should == true
  end

	it "capturar palabra invalida" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "ARBOL"
		resultado = scrabble.verificarPalabraIngresada
  	resultado.should == false
  end

end
