Feature: Reiniciar la partida
    Como jugador
    Quiero reiniciar mi partida
    Para poder replantear mi estrategia

    Scenario: Se verá el tablero vacio
        Given entro a la pagina principal
            And lleno los nombres con "Laura" y "Andrea"
            And hago clic en "Jugar"
            And hago una jugada
            And abro el menu de "Pausa"
        When hago clic en "Reiniciar partida"
        Then deberia ver el tablero vacio

    Scenario: Se verán todos los puntajes en 0
        Given entro a la pagina principal
        And lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        And hago un cuadrado
        And abro el menu de "Pausa"
        When hago clic en "Reiniciar partida"
        Then deberia ver el primer jugador "Laura" con el puntaje "0"
        And deberia ver el segundo jugador "Andrea" con el puntaje "0"
