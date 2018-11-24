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
        When hago clic en "Reiniciar"
        Then deberia ver el tablero vacio


