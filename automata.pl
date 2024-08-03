% automata.pl

:- [dfa].
:- [nfa].
:- [pda].
:- [turing_machine].
:- [visualize].

% Run the simulation based on the type of automaton
run_simulation(Type, InputString) :-
    (Type = dfa -> run_dfa(InputString);
     Type = nfa -> run_nfa(InputString);
     Type = pda -> run_pda(InputString);
     Type = turing_machine -> run_turing_machine(InputString)).

% Entry point
main :-
    write('Enter the type of automaton (dfa, nfa, pda, turing_machine): '), read(Type),
    write('Enter the input string: '), read(InputString),
    run_simulation(Type, InputString).
