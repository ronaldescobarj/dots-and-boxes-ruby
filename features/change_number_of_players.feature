Feature: Cambiar la cantidad de jugadores dentro del tablero
    Como jugador
    Quiero quiero cambiar la cantidad de jugadores dentro de un tablero
    Para jugar con mas amigos

    Scenario: se podra escoger entre dos, tres o cuatro jugadores
        Given entro a la pagina principal
        Then deberia ver todas las opciones de cantidad de jugadores disponibles en un menu desplegable

    Scenario: al iniciar la partida se podrán ver a todos los jugadores
        Given entro a la pagina principal
        When selecciono 2 jugadores
            And ingreso los tres nombres
            And hago clic en "Jugar"
        Then deberia ver el nombre de "Juan" y "Andres" dentro de la partida


