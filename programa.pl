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

%punto 2
expertoEnMetales(Jugador):-
    jugador(Jugador),
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
    tecnologia(_,Tecnologia),
    forall(jugador(Jugador), tecnologia(Jugador, Tecnologia)).

%punto 5
tecnologiaAlcanzada(Civilizacion, Tecnologia):-
    jugador(Jugador),
    civilizacion(Jugador, Civilizacion),
    tecnologia(Jugador, Tecnologia).

esLider(Civilizacion):-
    civilizacion(_, Civilizacion),
    forall(tecnologia(_, Tecnologia), tecnologiaAlcanzada(Civilizacion, Tecnologia)).

%punto 6

campeon(Vida):-
    between(1, 100, Vida).
    
piquero(conEscudo, 1).
piquero(conEscudo, 2).
piquero(conEscudo, 3).

piquero(sinEscudo, 1).
piquero(sinEscudo, 2).
piquero(sinEscudo, 3).

jinete(caballo).
jinete(camello).

soldados(ana, [jinete(caballo),piquero(conEscudo,1),piquero(sinEscudo,2)]).
soldados(beto, [campeon(100),campeon(80),jinete(camello),piquero(conEscudo,1)]).
soldados(carola, [piquero(sinEscudo,3),piquero(conEscudo,3)]).
soldados(dimitri, []).

%punto 7 

vida(jinete(caballo), 90).
vida(jinete(camello), 80).
vida(campeon(Vida), Vida).
vida(piquero(sinEscudo, 1), 50).
vida(piquero(sinEscudo, 2), 65).
vida(piquero(sinEscudo, 3), 70).
vida(piquero(conEscudo, Nivel), Vida):-
    vida(piquero(sinEscudo, Nivel), VidaSinEscudo),
    Vida is VidaSinEscudo * (1.1).

unidadConMasVida(Jugador, UnidadMasVida) :-
        soldados(Jugador, Unidades),
        findall(Vida,(member(UnidadActual,Unidades),vida(UnidadActual,Vida)),VidaUnidades),
        max_member(UnidadConVidaMasAlta, VidaUnidades),
        vida(UnidadMasVida,UnidadConVidaMasAlta).

%punto 8
leGana(jinete(_),campeon(_)).
leGana(campeon(_),piquero(_,_)_).
leGana(piquero(_,_),jinete(_)).
leGana(jinete(camello), jinete(caballo)).
leGana(Unidad, OtraUnidad):-
    vida(Unidad, Vida1),
    vida(OtraUnidad, Vida2),
    Vida1 > Vida2.

%punto 9

sobreviveUnAsedio(Jugador):-
    soldados(Jugador, Unidades),
    findall(piquero(conEscudo,_), member(piquero(conEscudo,_), Unidades), PiquerosConEscudos),
    findall(piquero(sinEscudo,_), member(piquero(sinEscudo,_), Unidades), PiquerosSinEscudos),
    length(PiquerosConEscudos,LargoConEscudo),
    length(PiquerosSinEscudos,LargoSinEscudo),
    LargoConEscudo > LargoSinEscudo.

%punto 10

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
    \+ tecnologia(Jugador, Tecnologia),
    puedeDesarrollarDependencias(Jugador, Tecnologia).

puedeDesarrollarDependencias(_, Tecnologia):-
    unaTecnologia(Tecnologia),
    \+ (necesita(Tecnologia, _)).

puedeDesarrollarDependencias(Jugador, Tecnologia):-
    necesita(Tecnologia, Requerida),
    tecnologia(Jugador, Requerida),
    puedeDesarrollarDependencias(Jugador, Requerida).
