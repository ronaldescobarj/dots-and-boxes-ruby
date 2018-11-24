Feature: Ver puntajes finales de la partida
    Como jugador
    Quiero poder ver los puntajes finales de mi partida
    Para saber quien gano

    Scenario: ver lista ordenada de jugadores
        Given la partida actual termino
        Then deberia ver en primer lugar a "Andrea" y en segundo a "Laura"

    Scenario: ver quien gano
        Given la partida actual termino
        Then deberia ver que gano "Andrea"