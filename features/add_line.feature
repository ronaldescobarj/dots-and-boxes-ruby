Feature: Colocar un palito
    Como jugador
    Quiero colocar un palito dentro del tablero
    Para poder ganar a mi oponente

    Scenario: ver palito del color del jugador actual en el tablero
        Given entro a la pagina principal
        When hago clic en "Jugar"
            And pongo el palito en las coordenadas "1", "1" con la direccion "Horizontal" y es el turno del jugador con el color "azul" y hago clic en "Agregar"
        Then deberia ver el palito agregado en "1", "1" con direccion "horizontal"
            And con el color "azul"

    Scenario: mostrar la marca si es que se forma un cuadrado
        Given entro a la pagina principal
        When hago clic en "Jugar"
            And hay tres lineas que pueden formar un cuadrado
            And pongo el palito en las coordenadas "1", "1" con la direccion "Horizontal" y es el turno del jugador con el color "azul" y hago clic en "Agregar"
        Then deberia ver la marca en la posicion "1.5", "1.5"
            And con el color "rojo" dentro del cuadrado formado

    Scenario: mantener el turno si es que se forma un cuadrado
        Given entro a la pagina principal
        When hago clic en "Jugar"
            And hay tres lineas que pueden formar un cuadrado
            And pongo el palito en las coordenadas "1", "1" con la direccion "Horizontal" y es el turno del jugador con el color "azul" y hago clic en "Agregar"
        Then deberia seguir siendo el turno del jugador con el nombre "Andrea"

    Scenario: actualizar puntaje si es que se forma un cuadrado
        Given entro a la pagina principal
        When hago clic en "Jugar"
            And hay tres lineas que pueden formar un cuadrado
            And pongo el palito en las coordenadas "1", "1" con la direccion "Horizontal" y es el turno del jugador con el color "azul" y hago clic en "Agregar"
        Then deberia actualizarse el puntaje del jugador "Andrea" en "100"