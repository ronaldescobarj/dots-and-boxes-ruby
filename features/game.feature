Feature: Colocar un palito
    Como jugador
    Quiero colocar un palito dentro del tablero
    Para poder ganar a mi oponente

    Scenario: ver palito colocado
        Given la vista de juego
        When se hace clic en un palito transparente
        Then se marca el palito