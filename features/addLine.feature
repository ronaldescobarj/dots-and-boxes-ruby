Feature: Colocar un palito
    Como jugador
    Quiero colocar un palito dentro del tablero
    Para poder ganar a mi oponente

    Scenario: ver palito del color del jugador actual en el tablero
        Given estoy en la vista del juego
        When pongo el palito en las coordenadas "1", "1" con la direccion "Horizontal" y es el turno del jugador con el color "azul" y hago clic en "Agregar"
        Then deberia ver el palito agregado en "1", "1" con direccion "horizontal"
            And con el color "azul"

    Scenario: mostrar la marca si es que se forma un cuadrado
        Given estoy en la vista del juego
            And hay tres lineas que pueden formar un cuadrado
        When pongo el palito en las coordenadas "1", "1" con la direccion "Horizontal" y es el turno del jugador con el color "azul" y hago clic en "Agregar"
        Then deberia ver la marca en la posicion "1.5", "1.5"
            And con el color "rojo" dentro del cuadrado formado

    Scenario: mantener el turno si es que se forma un cuadrado
        Given estoy en la vista del juego
            And hay tres lineas que pueden formar un cuadrado
        When pongo el palito en las coordenadas "1", "1" con la direccion "Horizontal" y es el turno del jugador con el color "azul" y hago clic en "Agregar"
        Then deberia seguir siendo el turno del jugador con el color "rojo"

    Scenario: actualizar puntaje si es que se forma un cuadrado
        Given estoy en la vista del juego
            And el puntaje inicial es "0"
            And hay tres lineas que pueden formar un cuadrado
        When pongo el palito en las coordenadas "1", "1" con la direccion "Horizontal" y es el turno del jugador con el color "azul" y hago clic en "Agregar"
        Then deberia actualizarse el puntaje del jugador "azul" a "100"