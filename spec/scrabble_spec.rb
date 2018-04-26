require "./lib/Scrabble.rb"

describe "Scrabble" do
  it "muestra letras iniciales" do
		scrabble = Scrabble.new
  	scrabble.obtenerLetrasIniciales.should == "A B C D E"
  end
	it "capturar palabra valida" do
		scrabble = Scrabble.new
		scrabble.capturarPalabra "BEA"
  	scrabble.verificarPalabraIngresada.should == true
  end

end
