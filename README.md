# Automata Simulator and Visualizer

This project simulates and visualizes different types of automata: DFA, NFA, PDA, and Turing Machines. It is designed for educational purposes to help students and learners understand how these abstract machines work.

## Project Overview

The Automata Simulator and Visualizer supports the following types of automata:
1. Deterministic Finite Automaton (DFA)
2. Non-Deterministic Finite Automaton (NFA)
3. Pushdown Automaton (PDA)
4. Turing Machine

### DFA (Deterministic Finite Automaton)
- A finite set of states
- One initial state
- A set of accepting states
- A set of transitions where each transition is determined by the current state and an input symbol

### NFA (Non-Deterministic Finite Automaton)
- Similar to DFA but allows multiple transitions for the same state and input symbol, including transitions to multiple states or no transition at all

### PDA (Pushdown Automaton)
- Similar to NFA but with an additional stack to store information
- Used to model computations that require memory, such as context-free languages

### Turing Machine
- Extends the capabilities of PDA by using an infinite tape instead of a stack
- Can perform any computation that can be algorithmically defined

### Prerequisites
- Ensure you have SWI-Prolog installed on your machine.

### Installation
 Clone this repository or download the files to your local machine.
   
   ```bash
   git clone https://github.com/danielazizyan/automata_simulator.git
   cd automata_simulator
   ```

### Running The Simulation
1. Start the SWI-Prolog interpreter:
```bash
swipl
```

2. Load the main Prolog file:
```bash
?- [automata].
```

3. Run the simulation:
```bash
?- main.
```

4. Follow the prompts to enter the type of automaton and the input string.
