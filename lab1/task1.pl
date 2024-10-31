% Предикаты обработки списков
% Вариант 19
% Циклический сдвиг списка вправо

% Способ со стандартными предикатами
right_shift_std([], []).
right_shift_std(X, [L|N]) :-
    append(N, [L], X).

% Способ без стандартных предикатов обработки списков
last_element([H|[]], H).
last_element([_|T], R) :-
    last_element(T, R).

list_without_last_element([_|[]], []).
list_without_last_element([H1,_|[]], [H1]):-!.
list_without_last_element([H|T], [H|R]) :-
    list_without_last_element(T, R).

right_shift([], []).
right_shift(X, [E|N]) :-
    last_element(X, E),
    list_without_last_element(X, N).


% Предикаты обработки числовых списков
% Вариант 4
% Вычисление минимального элемента

min_element([H|[]], H).
min_element([H|T], H) :-
    min_element(T, R),
    H < R.
min_element([H|T], R) :-
    min_element(T, R),
    H >= R.

% Пример совместного использования
% Сдвигаем вправо циклически так, чтобы первый элемент был минимальным

shift_until_first_is_min(X, [H|T]) :-
    right_shift(X, [H|T]),
    min_element(X, Min),
    H == Min.

shift_until_first_is_min(X, R) :-
    right_shift(X, [H|T]),
    min_element(X, Min),
    H > Min,
    shift_until_first_is_min([H|T], R).