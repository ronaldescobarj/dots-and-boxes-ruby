Feature: Iniciar una nueva partida
    Como jugador
    Quiero iniciar una nueva partida
    Para poder empezar a jugar

    Scenario: tablero vacio
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
            And hago clic en "Jugar"
        Then deberia ver el tablero vacio

    Scenario: puntajes
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
            And hago clic en "Jugar"
        Then deberia ver el primer jugador "Laura" con el puntaje "0"
        And deberia ver el segundo jugador "Andrea" con el puntaje "0"
    
    Scenario: turno
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
            And hago clic en "Jugar"
        Then deberia ver que es el turno de "Laura" 