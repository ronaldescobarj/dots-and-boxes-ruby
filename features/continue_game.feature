Feature: Continuar partida
    Como jugador
    Quiero continuar una partida pausada
    Para aplicar mis jugadas craneadas

    Scenario: Se verá la misma partida tal cual se dejó antes de hacer pausa.
        Given entro a la pagina principal
        And lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        And hago una jugada
        And abro el menu de "Pausa"
        When hago clic en "Continuar"
        Then deberia ver el tablero tal y como lo deje antes de hacer pausa

    Scenario: Se verán todos los puntajes en 0
        Given entro a la pagina principal
        And lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        And hago un cuadrado
        And abro el menu de "Pausa"
        When hago clic en "Reiniciar partida"
        Then deberia ver el primer jugador "Laura" con el puntaje "0"
        And deberia ver el segundo jugador "Andrea" con el puntaje "0"

    Scenario: Se verá que es el turno del jugador uno
        Given entro a la pagina principal
        And lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        And hago una jugada
        And abro el menu de "Pausa"
        When hago clic en "Reiniciar partida"
        Then deberia ver que es el turno de "Laura"
