Feature: Scrabble de 5 letras

Scenario: Inicio
	Given Voy a Inicio
	Then Veo "A B C D E"
	And Veo "1 8 3 2 1"

Scenario: Captura palabra
	Given Voy a Inicio
	When Ingreso "BEA"
	Then Veo "BEA"

Scenario: Verificar letra no valida
	Given Voy a Inicio
	When Ingreso "ARBOL"
	Then Veo "No puede utilizar mas letras de las disponibles"

Scenario: Verificar palabra valida
	Given Voy a Inicio
	When Ingreso "BECA"
	Then Veo "Puntaje: 13"

Scenario: Verificar palabra no valida
	Given Voy a Inicio
	When Ingreso "ABCE"
	Then Veo "La palabra no existe en la RAE"
