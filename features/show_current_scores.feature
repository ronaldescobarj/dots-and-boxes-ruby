Feature: Ver los puntajes actuales de cada jugador
    Como jugador
    Quiero ver los puntajes actuales de cada uno de los jugadores dentro del tablero
    Para saber como va la partida

    Scenario: ver lista ordenada de jugadores
        Given entro a la pagina principal
        When hago clic en "Jugar"
            And el jugador uno "Andrea" formo un cuadrado
            And el jugador dos "Laura" tiene "0"
        Then deberia ver primero a "Andrea" y luego a "Laura"
