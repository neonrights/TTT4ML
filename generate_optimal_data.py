"""
creates optimal data for tic tac toe
"""

# recursively goes through every game possibility
def generate_moves(board, x_input, o_input, x_output, o_output,	fx_input, fo_input, fx_output, fo_output):
	if sum(board[0:3]) == 3 or sum(board[3:6]) == 3 or sum(board[6:9]) == 3 or sum(board[0::3]) == 3 or sum(board[1::3]) == 3 or sum(board[2::3]) == 3 or sum(board[0::4]) == 3 or sum(board[2:7:2]) == 3:
		# x is the winner
		# record in x_input and x_output
		for x_data in x_input:
			fx_input.write(str(x_data)[1:-1] + '\n');

		for x_data in x_output:
			fx_output.write(str(x_data)[1:-1] + '\n');
	elif sum(board[0:3]) == -3 or sum(board[3:6]) == -3 or sum(board[6:9]) == -3 or sum(board[0::3]) == -3 or sum(board[1::3]) == -3 or sum(board[2::3]) == -3 or sum(board[0::4]) == -3 or sum(board[2:7:2]) == -3:
		# o is the winner
		# record in o_input and o_output
		for o_data in o_input:
			fo_input.write(str(o_data)[1:-1] + '\n');

		for o_data in o_output:
			fo_output.write(str(o_data)[1:-1] + '\n');
	else:
		# go through all open spaces
		for i in range(len(board)):
			# check if space is available
			if board[i] == 0:
				if sum(board) == 0:
					# x's turn
					# add board before x goes
					x_input.append(board[:]);
					
					# show correct position x should go to
					board[i] = 1;
					temp = [0, 0, 0, 0, 0, 0, 0, 0, 0];
					temp[i] = 1;

					x_output.append(temp);

					# call function on itself
					generate_moves(board, x_input, o_input, x_output, o_output,	fx_input, fo_input, fx_output, fo_output);

					# remove the data
					x_input.pop();
					x_output.pop();
				elif sum(board) == 1:
					# o's turn
					# add board before o goes
					o_input.append(board[:]);

					# show correct position x should go to
					board[i] = -1;
					temp = [0, 0, 0, 0, 0, 0, 0, 0, 0];
					temp[i] = 1;

					o_output.append(temp);

					# call function on itself
					generate_moves(board, x_input, o_input, x_output, o_output,	fx_input, fo_input, fx_output, fo_output);

					# remove the data
					o_input.pop();
					o_output.pop();
				else:
					print 'something went wrong';
					break;

				# remove move from board
				board[i] = 0;


if __name__ == "__main__":
	# blank board with lists starting with nothing
	x_file_input = open('optimal-input-x.txt', 'w');
	o_file_input = open('optimal-input-o.txt', 'w');

	x_file_output = open('optimal-output-x.txt', 'w');
	o_file_output = open('optimal-output-o.txt', 'w');

	generate_moves([0, 0, 0, 0, 0, 0, 0, 0, 0], [], [], [], [], x_file_input, o_file_input, x_file_output, o_file_output);

	x_file_input.close();
	o_file_input.close();

	x_file_output.close();
	o_file_output.close();