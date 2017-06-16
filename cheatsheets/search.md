## Minimax algorithm

- sort of adversarial search used in games, when one move strives to maximise outcome, and 
  next move strives to minimize it, and so on
- branching factor - number of moves leading to new state   
- Full search of the tree has exponential complexity thus not practical

### Practical approach 
Heuristic could be used to reduce number of searches: evaluation function that 
computes number of moves for each result state and backpropagates computed values back to 
starting nodes
  
### Quiscent search
It is turned out that evaluation function will return different resluts depending on from 
which level it starts. Hence to get accurate results we run computation from several levels 
and choose result using multiple values 
  
### Iterative deepening
Quiscent search within limited amount of time. When time is out we stop search and use best 
value found.

### Horizon effect 
Not seatching deep enough to foresee critical state change after specific move
Solution - include extra check to evaluation function to make extra check. But not overcomplicate,
remember the purpose of existence of an evalution function - is to accelerate computation 
from exponential complexity to reasonable complexity       

### Alpha-beta pruning 
Finding and dropping those branches of the search tree, which won't lead to win
Reduces number of moves to search in half of order, i.e. from `b^d` to `b^(d/2)xx` 

## Isolation game strategy
- Start using "good moves" play book 
- Use iterative deepening in teh middle
- Do full search at the end 


## Different stuff

### Multiplayer games
- Minimax algorithm is not applicable, use MAXN instead
- With MAXN we evaluate game from each player perspectives. Evaluation function returns tuples of N elements, where N == number of players
  
### Probabalistic games
- Use expectiMAX
- SLoppy isolation game
- Representation of game tree would include probability nodes to represent probability of different transitions from one node to another. 
 
