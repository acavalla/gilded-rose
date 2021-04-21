# Planning

Components
- Board - attribute. Stores data of what's dead (white / false) and what's alive (black / true). Array of arrays?
- Initial set up - attribute. Later will have UI.
- Ticks - method. Changes the board
- Cells - store their own data of where they are?

Class| -
-|-
*Board* |
*Cell*|
Attributes | Location: { :right => 3, :up => 4 } <br> Identity: 1/0<br>Neighbour tally: 0-4
Methods | Tick

### User stories
```
As a player
So I can play the game
I want cells to be able to be alive or dead
```

Input | Output
-|-
\[[0,0]] | Cell. Attributes: Location: { :right => 0, :up = 0 } Identity: 1 Neighbour tally: 0
\[[0,0], [1,1]] | Two cells. Attributes: Location: { :right => 0, :up = 0 } Identity: 1 Neighbour tally: 0<br>Location: { :right = >1, :up = 1 } Identity: 1 Neighbour tally: 0
