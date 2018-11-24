Feature: Salir de la partida actual
    Como jugador
    Quiero salir de mi partida actual
    Para hacer otra cosa

    Scenario: Se mostrará la vista principal del juego
        Given entro a la pagina principal
        And lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        And hago una jugada
        And abro el menu de "Pausa"
        When hago clic en "Salir de la partida"
        Then deberia ver el texto "Menu principal"
