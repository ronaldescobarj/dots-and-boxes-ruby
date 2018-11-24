Feature: Poner nombre(s) antes de empezar cada partida
    Como jugador
    Quiero poner mi nombre antes de empezar mi partida
    Para poder registrar mi puntaje obtenido.

    Scenario: al iniciar la partida se podrán ver a todos los jugadores
        Given entro a la pagina principal
        When selecciono 2 jugadores
        And ingreso los tres nombres
        And hago clic en "Jugar"
        Then deberia ver el nombre de "Juan" y "Andres" dentro de la partida
