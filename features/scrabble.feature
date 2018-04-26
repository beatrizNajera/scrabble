Feature: Scrabble de 5 letras

Scenario: Inicio
	Given Voy a Inicio
	Then Veo "A B C D E"

Scenario: Captura palabra
	Given Voy a Inicio
	When Ingreso "BEA"
	Then Veo "BEA"


