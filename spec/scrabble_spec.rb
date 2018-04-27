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

	it "Validar que pueda usar una sola vez las letras validas" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BEBE"
		resultado = scrabble.verificarPalabraIngresada
  	resultado.should == false
  end

	it "Calcular puntaje palaba ingresada BEA" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BEA"
		resultado = scrabble.verificarPalabraIngresada
		puntaje = scrabble.obtenerPuntaje
  	resultado.should == true
		puntaje.should == 10
  end

	it "Calcular puntaje palaba ingresada BECA" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BECA"
		resultado = scrabble.verificarPalabraIngresada
		puntaje = scrabble.obtenerPuntaje
  	resultado.should == true
		puntaje.should == 13
  end

	it "Calcular puntaje unicamente cuando palabra ingresada sea valida" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "ARBOL"
		resultado = scrabble.verificarPalabraIngresada
		puntaje = scrabble.obtenerPuntaje
  	resultado.should == false
		puntaje.should == -1
  end

end
