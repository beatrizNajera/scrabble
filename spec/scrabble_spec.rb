require "./lib/Scrabble.rb"

describe "Scrabble" do
  it "muestra letras iniciales y valores iniciales" do
		scrabble = Scrabble.new
		letrasIniciales = scrabble.obtenerLetrasIniciales
		valoresIniciales = scrabble.obtenerValoresIniciales
  	letrasIniciales.should == "A B C D E"
  	valoresIniciales.should == "1 8 3 2 1"
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
		motivoPalabraNoValida = scrabble.obtenerMotivoPalabraNoValida
		motivoPalabraNoValida.should == "No puede utilizar mas letras de las disponibles"
  	resultado.should == false
  end

	it "Calcular puntaje palaba ingresada BEA" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BEA"
		resultado = scrabble.verificarPalabraIngresada
		puntaje = scrabble.obtenerPuntaje
		motivoPalabraNoValida = scrabble.obtenerMotivoPalabraNoValida
		motivoPalabraNoValida.should == ""
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
		motivoPalabraNoValida = scrabble.obtenerMotivoPalabraNoValida
		puntaje = scrabble.obtenerPuntaje
  	resultado.should == false
		motivoPalabraNoValida.should == "No puede utilizar mas letras de las disponibles"
		puntaje.should == -1
  end

  it "capturar palabra valida bea" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "bea"
		resultado = scrabble.verificarPalabraIngresada
		puntaje = scrabble.obtenerPuntaje
  	resultado.should == true
		puntaje.should == 10
  end

  it "Valida que palabra BCA no existe" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BCA"
		resultado = scrabble.verificarPalabraIngresada
		motivoPalabraNoValida = scrabble.obtenerMotivoPalabraNoValida
		puntaje = scrabble.obtenerPuntaje
  	resultado.should == false
		motivoPalabraNoValida == "La palabra no existe en la RAE"
		puntaje.should == -1
  end

	it "cuando ingreso BEA muestra 10 y luego BECA acumula puntaje y muestra 23" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BEA"
		resultado1 = scrabble.verificarPalabraIngresada
		motivoPalabraNoValida1 = scrabble.obtenerMotivoPalabraNoValida
		puntaje1 = scrabble.obtenerPuntaje
		
		scrabble.capturarPalabra "BECA"
		resultado2 = scrabble.verificarPalabraIngresada
		motivoPalabraNoValida2 = scrabble.obtenerMotivoPalabraNoValida
		puntaje2 = scrabble.obtenerPuntaje

  	resultado1.should == true
		motivoPalabraNoValida1 == ""
		puntaje1.should == 10

		resultado2.should == true
		motivoPalabraNoValida2 == ""
		puntaje2.should == 23
  end

end
