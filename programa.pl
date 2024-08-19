% Civilizaciones y Tecnologias
% Punto 1

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
tecnologia(ana, laminas).
tecnologia(beto, herreria).
tecnologia(beto, forja).
tecnologia(beto, fundicion).
tecnologia(carola, herreria).
tecnologia(dimitri, herreria).
tecnologia(dimitri, fundicion).

% Punto 2

expertoEnMetales(Jugador):-
    jugador(Jugador),
    tecnologia(Jugador, herreria),
    tecnologia(Jugador, forja),
    condicionExperto(Jugador).

condicionExperto(Jugador):-
    tecnologia(Jugador, fundicion).

condicionExperto(Jugador):-
    civilizacion(Jugador, romanos).

% Punto 3

esPopular(Civilizacion):-
    civilizacion(Jugador1, Civilizacion),
    civilizacion(Jugador2, Civilizacion),
    Jugador1 \= Jugador2.

% Punto 4

alcanceGlobal(Tecnologia):-
    tecnologia(_,Tecnologia),
    forall(jugador(Jugador), tecnologia(Jugador, Tecnologia)).

% Punto 5

tecnologiaAlcanzada(Civilizacion, Tecnologia):-
    jugador(Jugador),
    civilizacion(Jugador, Civilizacion),
    tecnologia(Jugador, Tecnologia).

esLider(Civilizacion):-
    civilizacion(_, Civilizacion),
    forall(tecnologia(_, Tecnologia), tecnologiaAlcanzada(Civilizacion, Tecnologia)).

% Unidades
% Punto 6

soldados(ana,jinete(caballo)).
soldados(ana,piquero(sinEscudo, 2)).
soldados(ana,piquero(conEscudo, 1)).
soldados(beto,campeon(100)).
soldados(beto,campeon(80)).
soldados(beto,jinete(camello)).
soldados(beto,piquero(conEscudo,1)).
soldados(carola,piquero(sinEscudo, 3)).
soldados(carola,piquero(conEscudo, 2)).

% Punto 7

vida(jinete(caballo), 90).
vida(jinete(camello), 80).
vida(piquero(sinEscudo, 1), 50).
vida(piquero(sinEscudo, 2), 65).
vida(piquero(sinEscudo, 3), 70).
vida(campeon(Vida), Vida).

vida(piquero(conEscudo, Nivel), Vida):-
    vida(piquero(sinEscudo, Nivel), VidaSinEscudo),
    Vida is VidaSinEscudo * (1.1).

unidadConMasVida(Jugador, Unidad):-
    jugador(Jugador),
    findall(Vida, (soldados(Jugador, Unidad), vida(Unidad, Vida)), Vidas),
    max_list(Vidas, VidaMaxima),
    vida(Unidad, VidaMaxima),
    soldados(Jugador, Unidad).

% Punto 8

leGana(jinete(_), campeon(_)).
leGana(campeon(_), piquero(_)).
leGana(piquero(_), jinete(_)).
leGana(jinete(camello), jinete(caballo)).

leGana(Unidad1, Unidad2):-
    vida(Unidad1, Vida1),
    vida(Unidad2, Vida2),
    Vida1 > Vida2.

% Punto 9

sobreviveAsedio(Jugador):-
    jugador(Jugador),
    findall(Unidad, (soldados(Jugador, Unidad), esPiqueroConEscudo(Unidad)), PiquerosConEscudo),
    findall(Unidad, (soldados(Jugador, Unidad), esPiqueroSinEscudo(Unidad)), PiquerosSinEscudo),
    length(PiquerosConEscudo, CantidadConEscudo),
    length(PiquerosSinEscudo, CantidadSinEscudo),
    CantidadConEscudo > CantidadSinEscudo.

esPiqueroConEscudo(piquero(conEscudo, _)).
esPiqueroSinEscudo(piquero(sinEscudo, _)).

% Punto 10

necesita(emplumado, herreria).
necesita(punzon, emplumado).
necesita(forja, herreria).

necesita(laminas, herreria).
necesita(malla, laminas).
necesita(placas, malla).

necesita(fundicion, forja).
necesita(horno, fundicion).

necesita(collera, molino).
necesita(arado, collera).

unaTecnologia(herreria).
unaTecnologia(forja).
unaTecnologia(fundicion).
unaTecnologia(emplumado).
unaTecnologia(laminas).
unaTecnologia(malla).
unaTecnologia(placas).
unaTecnologia(horno).
unaTecnologia(punzon).
unaTecnologia(molino).
unaTecnologia(collera).
unaTecnologia(arado).

puedeDesarrollar(Jugador, Tecnologia):-
    unaTecnologia(Tecnologia),
    not(tecnologia(Jugador, Tecnologia)),
    puedeDesarrollarDependencias(Jugador, Tecnologia).

puedeDesarrollarDependencias(_, Tecnologia):-
    unaTecnologia(Tecnologia),
    not((necesita(Tecnologia, _))).


puedeDesarrollarDependencias(Jugador, Tecnologia):-
    necesita(Tecnologia, Requerida),
    tecnologia(Jugador, Requerida),
    puedeDesarrollarDependencias(Jugador, Requerida).