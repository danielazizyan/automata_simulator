% turing_machine.pl

% Example Turing Machine
tm_state(q0).
tm_state(q1).
tm_state(q2).
tm_initial_state(q0).
tm_accepting_state(q2).

% Define transitions (state, tape_symbol, next_state, write_symbol, direction)
tm_transition(q0, 'a', q1, 'X', right).
tm_transition(q1, 'a', q1, 'a', right).
tm_transition(q1, 'b', q2, 'Y', right).
tm_transition(q2, 'b', q2, 'b', right).

% Simulation logic for Turing Machine
simulate_turing(CurrentState, Tape, TapePosition, FinalState) :-
    nth0(TapePosition, Tape, CurrentSymbol),
    tm_transition(CurrentState, CurrentSymbol, NextState, WriteSymbol, Direction),
    replace_nth(TapePosition, WriteSymbol, Tape, NewTape),
    (Direction = right -> NewPosition is TapePosition + 1 ; NewPosition is TapePosition - 1),
    simulate_turing(NextState, NewTape, NewPosition, FinalState).

% Entry point for Turing Machine simulation
run_turing_machine(InputString) :-
    tm_initial_state(InitialState),
    atom_chars(InputString, InputList),
    append(InputList, ['_'], Tape),  % Add blank symbol to the end
    simulate_turing(InitialState, Tape, 0, FinalState),
    visualize_tm(InitialState, InputList, FinalState).
