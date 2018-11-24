Feature: Ver el estado actual del tablero
    Como jugador
    Quiero ver el estado actual del tablero
    Para cranear mis siguientes movimientos

    Scenario: ver palitos agregados con los colores respectivos
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
            And hago clic en "Jugar"
            And agrego 5 palitos
        Then deberia ver todos los palitos agregados con los colores respectivos

    Scenario: ver marcas ganadas con los colores respectivos
        Given entro a la pagina principal
        When lleno los nombres con "Laura" y "Andrea"
            And hago clic en "Jugar"
            And agrego 5 palitos
        Then deberia ver todas las marcas ganadas con los colores respectivos