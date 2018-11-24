Feature: Ver el turno actual
    Como jugador
    Quiero ver el turno actual dentro de una partida
    Para saber cuando es mi turno

    Scenario: ver nombre del jugador actual
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
            And hago clic en "Jugar"
            And el jugador uno "Laura" hizo una jugada
        Then deberia ser el turno de "Andrea"
