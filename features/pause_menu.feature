Feature: Abrir menu de pausa
    Como jugador
    Quiero abrir el menu de pausa
    Para poder ver las opciones del menu y tomarme un descanso

    Scenario: ver opcion de reiniciar partida
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
            And hago clic en "Jugar"
            And abro el menu de "Pausa"
        Then deberia ver la opcion de "Reiniciar partida"

    Scenario: ver opcion de salir de la partida
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        And abro el menu de "Pausa"
        Then deberia ver la opcion de "Salir de la partida"

    Scenario: ver opcion de continuar
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        And abro el menu de "Pausa"
        Then deberia ver la opcion de "Continuar"
