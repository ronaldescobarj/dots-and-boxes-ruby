Feature: Ver las reglas e instrucciones del juego
    Como jugador
    Quiero poder ver las reglas e instrucciones del juego
    Para saber qué tengo que hacer

    Scenario: Se mostraran las reglas del juego
        Given entro a la pagina principal
        And lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        When abro el menu de "Ayuda"
        Then deberia ver el encabezado "Reglas del juego"

    Scenario: Se mostraran las instrucciones del juego
        Given entro a la pagina principal
        And lleno los nombres con "Laura" y "Andrea"
        And hago clic en "Jugar"
        When abro el menu de "Ayuda"
        Then deberia ver el encabezado "Cómo jugar"
