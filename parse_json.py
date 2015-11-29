"""
parses json data from TTT4Data project formatting and recording them
in a format that can be read by matlab
"""

import json

# open file and read data
with open('tictactoe-ml-export.json') as json_data:
	raw = json.load(json_data);
	json_data.close();

	# create input data files
	x_input = open('ttt-input-x.txt', 'w');
	o_input = open('ttt-input-o.txt', 'w');
	
	# create output data files
	x_output = open('ttt-output-x.txt', 'w');
	o_output = open('ttt-output-o.txt', 'w');
	
	# edit data and write it to x and y raw data
	for game in raw:
		# game winner
		try:
			winner = raw[game]['winner'];
		except KeyError:
			print "incomplete data", game;

		# check if user finished game
		if winner is not None:
			# input_data move
			input_data = [0, 0, 0, 0, 0, 0, 0, 0, 0];

			# record moves
			for move in raw[game]:
				if type(raw[game][move]) is list:
					current = raw[game][move];
					output_data = [(current[i] - input_data[i]) for i in range(9)];
					
					# save data
					if sum(output_data) == 1:
						if winner == 1:
							x_input.write(str(input_data)[1:-1] + '\n');
							x_output.write(str(output_data)[1:-1] + '\n');
						elif winner == -1:
							o_input.write(str(input_data)[1:-1] + '\n');
							o_output.write(str(output_data)[1:-1] + '\n');

					# change input data forward
					input_data = current;

	# close all input data
	x_input.close;
	o_input.close;

	# close all output data
	x_output.close;
	o_output.close;