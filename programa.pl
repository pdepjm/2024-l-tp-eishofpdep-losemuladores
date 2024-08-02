jugador(ana).
jugador(beto).
jugador(carola).
jugador(dimitri).

civilizacion(ana, romanos).
civilizacion(beto, incas).
civilizacion(carola, romanos).
civilizacion(dimitri, romanos).

tecnologia(ana, herreria).
tecnologia(ana, forja).
tecnologia(ana, emplumado).
tecnologia(ana, laminados).
tecnologia(beto, herreria).
tecnologia(beto, forja).
tecnologia(beto, fundicion).
tecnologia(carola, herreria).
tecnologia(dimitri, herreria).
tecnologia(dimitri, fundicion).

%punto 2
expertoEnMetales(Jugador):-
    tecnologia(Jugador, herreria),
    tecnologia(Jugador, forja),
    condicionExperto(Jugador).

condicionExperto(Jugador):-
    tecnologia(Jugador, fundicion).

condicionExperto(Jugador):-
    civilizacion(Jugador, romanos).

%punto 3
esPopular(Civilizacion):-
    civilizacion(Jugador1, Civilizacion),
    civilizacion(Jugador2, Civilizacion),
    Jugador1 \= Jugador2.

%punto 4
alcanceGlobal(Tecnologia):-
    forall(jugador(Jugador), tecnologia(Jugador, Tecnologia)).

%punto 5
tecnologiaAlcanzada(Civilizacion, Tecnologia):-
    jugador(Jugador),
    civilizacion(Jugador, Civilizacion),
    tecnologia(Jugador, Tecnologia).

esLider(Civilizacion):-
    forall(tecnologia(_, Tecnologia), tecnologiaAlcanzada(Civilizacion, Tecnologia)).
