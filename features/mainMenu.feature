Feature: Iniciar una nueva partida
    Como jugador
    Quiero iniciar una nueva partida
    Para poder empezar a jugar

    Scenario: tablero vacio
        Given entro a la pagina principal
        When hago clic en "Jugar"
        Then deberia ver el "tablero"

    Scenario: puntajes
        Given entro a la pagina principal
        When hago clic en "Jugar"
        Then deberia ver "Jugador 1 - 0" y "Jugador 2 - 0"
    
    Scenario: turno
        Given entro a la pagina principal
        When hago clic en "Jugar"
        Then deberia ver "Turno de: Jugador 1"