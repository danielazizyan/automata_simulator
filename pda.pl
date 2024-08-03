% pda.pl

% Example PDA
state(q0).
state(q1).
state(q2).
initial_state(q0).
accepting_state(q2).

% Define transitions (state, input, stack_top, next_state, stack_action)
transition(q0, 'a', '$', q1, ['a','$']).
transition(q1, 'a', 'a', q1, ['a','a']).
transition(q1, 'b', 'a', q2, []).
transition(q2, 'b', 'a', q2, []).

% Simulation logic for PDA
simulate_pda(CurrentState, [], [], CurrentState) :- accepting_state(CurrentState).
simulate_pda(CurrentState, [Input|Rest], [StackTop|StackRest], FinalState) :-
    transition(CurrentState, Input, StackTop, NextState, StackAction),
    append(StackAction, StackRest, NewStack),
    simulate_pda(NextState, Rest, NewStack, FinalState).

% Entry point for PDA simulation
run_pda(InputString) :-
    initial_state(InitialState),
    atom_chars(InputString, InputList),
    simulate_pda(InitialState, InputList, ['$'], FinalState),
    visualize(InitialState, InputList, FinalState).
