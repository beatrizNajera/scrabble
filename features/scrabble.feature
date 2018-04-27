Feature: Scrabble de 5 letras

Scenario: Inicio
	Given Voy a Inicio
	Then Veo "A B C D E"

Scenario: Captura palabra
	Given Voy a Inicio
	When Ingreso "BEA"
	Then Veo "BEA"

Scenario: Verificar palabra no valida
	Given Voy a Inicio
	When Ingreso "ARBOL"
	Then Veo "No puede utilizar mas letras de las disponibles"

Scenario: Verificar palabra valida
	Given Voy a Inicio
	When Ingreso "BECA"
	Then Veo "Ok"


