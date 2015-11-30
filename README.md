# TTT4ML
A tic tac toe AI trained through machine learning.

Can be scaled to larger boards and trained for other types of games played on a cell/grid.

(tic tac toe was chosen since it's small enough to calculate fast being only 3 by 3 and large enough for some complexity)


*run parse_json.py in order to process the data files produced by TTT4Data*

files generated are named in the format "ttt-(input or output)-(x or o).txt"

*run generate_data in order to create all possible games, grouped into whether x or o won*

files generated are named in the format "all-(input or output)-(x or o).txt"

*run train_tictactoe.m in order to train the ML AI to play tic tac toe*

you can change variables at the top of train_tictactoe.m in order to affect where it reads data or its training boundaries
