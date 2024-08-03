% nfa.pl

% Example NFA
state(q0).
state(q1).
state(q2).
initial_state(q0).
accepting_state(q2).

% Define transitions
transition(q0, 'a', q1).
transition(q1, 'b', q2).
transition(q2, 'a', q0).
transition(q0, 'a', q2).  % Example of non-determinism

% Simulation logic for NFA
simulate_nfa(CurrentState, [], CurrentState) :- accepting_state(CurrentState).
simulate_nfa(CurrentState, [Input|Rest], FinalState) :-
    findall(NextState, transition(CurrentState, Input, NextState), NextStates),
    member(NextState, NextStates),
    simulate_nfa(NextState, Rest, FinalState).

% Entry point for NFA simulation
run_nfa(InputString) :-
    initial_state(InitialState),
    atom_chars(InputString, InputList),
    simulate_nfa(InitialState, InputList, FinalState),
    visualize(InitialState, InputList, FinalState).
