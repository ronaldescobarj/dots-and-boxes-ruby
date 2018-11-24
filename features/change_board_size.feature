Feature: Cambiar el tamaño del tablero
    Como jugador
    Quiero cambiar el tamaño del tablero
    Para poder modificar mi experiencia de juego

    Scenario: Se podrán ver todos los tamaños disponibles en un menú desplegable
        Given entro a la pagina principal
        Then deberia ver todas las opciones de tamaños disponibles en un menu desplegable

    Scenario: Al iniciar la partida, se podrá ver el tablero de acuerdo al tamaño establecido
        Given entro a la pagina principal
        When selecciono un tamaño "7x7"
            And hago clic en "Jugar"
        Then deberia ver el tablero con el tamaño "7x7"