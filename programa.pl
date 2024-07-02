jugadores(ana, romanos, herreria).
jugadores(ana, romanos, forja).
jugadores(ana, romanos, emplumado).
jugadores(ana, romanos, laminados).
jugadores(beto, incas, herreria).
jugadores(beto, incas, forja).
jugadores(beto, incas, fundicion).
jugadores(carola, romanos, herreria).
jugadores(dimitri, romanos, herreria).
jugadores(dimitri, romanos, fundicion).

%punto 2

esExperto(Jugador):-
    jugadores(Jugador, Civilizacion, Tecnologia),
    Tecnologia = forja,
    Tecnologia = herreria,
    Tecnologia = fundicion.

esExperto(Jugador):-
    jugadores(Jugador, Civilizacion, Tecnologia),
    Tecnologia = forja,
    Tecnologia = herreria,
    Civilizacion = romanos.

%punto 3

esPopular(Civilizacion):-
    jugadores(Jugador1, Civilizacion, _),
    jugadores(Jugador2, Civilizacion, _),
    Jugador1 \= Jugador2.

%punto 4    

alcanceGlobal(Tecnologia):-
    jugadores(_, _, Tecnologia),
    forall(jugadores(Jugador, _, _), jugadores(Jugador, _, Tecnologia)).

%punto 5

esLider(Civilizacion):-
    jugadores(_, Civilizacion, _),
    forall(jugadores(_, _, Tecnologia), jugadores(_, Civilizacion, Tecnologia)).