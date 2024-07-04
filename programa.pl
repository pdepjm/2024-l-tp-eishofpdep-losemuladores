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

%dividir en dos predicados

%punto 2

esExperto(Jugador):-
    jugadores(Jugador, _, forja),
    jugadores(Jugador, _, herreria).
    %falta agregar


esExperto(Jugador):-
    jugadores(Jugador, Civilizacion, Tecnologia),
    minimoMateriales(Jugador)
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

%desarrollar predicado consecuente para relacionar para todas las civilizaciones que hayan desarrollado una tecnologia, que la civilizacion que evalue, las tenga

%ENTREGA 2
%punto 6

soldado(campeon, caracteristicas(Vida)).
soldado(jinete, caracteristicas(Vida, Animal)).
soldado(piquero, caracteristicas(Vida, Nivel, Escudo)).


