person(davydov).
person(fedorov).
person(kondratiev).

profession(malyar).
profession(stolyar).
profession(vodoprovodchik).

heard(worker(A, malyar), worker(B, stolyar)) :-
    not((A = fedorov, B = davydov)).

heard(worker(A, stolyar), worker(B, malyar)) :-
    not((A = fedorov, B = davydov)).

heard(worker(A, stolyar), worker(B, vodoprovodchik)) :-
    not((A = fedorov, B = davydov)).

heard(worker(A, vodoprovodchik), worker(B, stolyar)) :-
    not((A = fedorov, B = davydov)).

heard(worker(A, malyar), worker(B, vodoprovodchik)) :-
    not((A = fedorov, B = davydov)).

solution(MalyarName, StolyarName, VodoprovodchikName) :-
    member(davydov, [MalyarName, StolyarName, VodoprovodchikName]),
    member(fedorov, [MalyarName, StolyarName, VodoprovodchikName]),
    member(kondratiev, [MalyarName, StolyarName, VodoprovodchikName]),

    person(MalyarName),
    person(StolyarName),
    person(VodoprovodchikName),

    heard(worker(MalyarName, malyar), worker(StolyarName, stolyar)),
    heard(worker(StolyarName, stolyar), worker(MalyarName, malyar)),
    heard(worker(StolyarName, stolyar), worker(VodoprovodchikName, vodoprovodchik)),
    heard(worker(VodoprovodchikName, vodoprovodchik), worker(StolyarName, stolyar)),
    heard(worker(MalyarName, malyar), worker(VodoprovodchikName, vodoprovodchik)).

person_name(davydov, "Давыдов").
person_name(fedorov, "Федоров").
person_name(kondratiev, "Кондратьев").

solve :-
    solution(MalyarName, StolyarName, VodoprovodchikName),
    person_name(MalyarName, MalyarNamePrintable),
    person_name(StolyarName, StolyarNamePrintable),
    person_name(VodoprovodchikName, VodoprovodchikNamePrintable),
    write("Маляр: "), write(MalyarNamePrintable), nl,
    write("Столяр: "), write(StolyarNamePrintable), nl,
    write("Водопроводчик: "), write(VodoprovodchikNamePrintable).