% visualize.pl

% Visualization for DFA
visualize_dfa(CurrentState, [], CurrentState) :-
    write('Final state: '), write(CurrentState), nl,
    (dfa_accepting_state(CurrentState) -> write('Input accepted!') ; write('Input rejected!')), nl.
visualize_dfa(CurrentState, [Input|Rest], FinalState) :-
    write('Current state: '), write(CurrentState), write(', processing input: '), write(Input), nl,
    dfa_transition(CurrentState, Input, NextState),
    visualize_dfa(NextState, Rest, FinalState).

% Visualization for NFA
visualize_nfa(CurrentState, [], CurrentState) :-
    write('Final state: '), write(CurrentState), nl,
    (nfa_accepting_state(CurrentState) -> write('Input accepted!') ; write('Input rejected!')), nl.
visualize_nfa(CurrentState, [Input|Rest], FinalState) :-
    write('Current state: '), write(CurrentState), write(', processing input: '), write(Input), nl,
    nfa_transition(CurrentState, Input, NextState),
    visualize_nfa(NextState, Rest, FinalState).

% Visualization for PDA
visualize_pda(CurrentState, [], [], CurrentState) :-
    write('Final state: '), write(CurrentState), nl,
    (pda_accepting_state(CurrentState) -> write('Input accepted!') ; write('Input rejected!')), nl.
visualize_pda(CurrentState, [Input|Rest], [StackTop|StackRest], FinalState) :-
    write('Current state: '), write(CurrentState), write(', stack: '), write([StackTop|StackRest]), write(', processing input: '), write(Input), nl,
    pda_transition(CurrentState, Input, StackTop, NextState, StackAction),
    append(StackAction, StackRest, NewStack),
    visualize_pda(NextState, Rest, NewStack, FinalState).

% Visualization for Turing Machine
visualize_tm(CurrentState, Tape, TapePosition, CurrentState) :-
    write('Final state: '), write(CurrentState), nl,
    write('Final tape: '), write(Tape), nl,
    write('Final head position: '), write(TapePosition), nl,
    (tm_accepting_state(CurrentState) -> write('Input accepted!') ; write('Input rejected!')), nl.
visualize_tm(CurrentState, Tape, TapePosition, FinalState) :-
    nth0(TapePosition, Tape, CurrentSymbol),
    write('Current state: '), write(CurrentState), write(', tape: '), write(Tape), write(', head position: '), write(TapePosition), nl,
    tm_transition(CurrentState, CurrentSymbol, NextState, WriteSymbol, Direction),
    replace_nth(TapePosition, WriteSymbol, Tape, NewTape),
    (Direction = right -> NewPosition is TapePosition + 1 ; NewPosition is TapePosition - 1),
    visualize_tm(NextState, NewTape, NewPosition, FinalState).

% Utility for replacing the Nth element in a list (only defined once)
replace_nth(0, X, [_|Xs], [X|Xs]).
replace_nth(N, X, [Y|Xs], [Y|Ys]) :- N > 0, N1 is N - 1, replace_nth(N1, X, Xs, Ys).
