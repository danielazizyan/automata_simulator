% dfa.pl

% Example DFA
dfa_state(q0).
dfa_state(q1).
dfa_state(q2).
dfa_initial_state(q0).
dfa_accepting_state(q2).

% Define transitions
dfa_transition(q0, 'a', q1).
dfa_transition(q1, 'b', q2).
dfa_transition(q2, 'a', q0).

% Simulation logic for DFA
simulate_dfa(CurrentState, [], CurrentState) :- dfa_accepting_state(CurrentState).
simulate_dfa(CurrentState, [Input|Rest], FinalState) :-
    dfa_transition(CurrentState, Input, NextState),
    simulate_dfa(NextState, Rest, FinalState).

% Entry point for DFA simulation
run_dfa(InputString) :-
    dfa_initial_state(InitialState),
    atom_chars(InputString, InputList),
    simulate_dfa(InitialState, InputList, FinalState),
    visualize_dfa(InitialState, InputList, FinalState).
