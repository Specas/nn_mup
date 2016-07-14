clc;

%Data input
data = load('data1.dat');
data = data(1:50, :);
%d is the desired classifier output
d = data(:, size(data, 2));
x = data(:, 1:size(data, 2)-1);

hidden_layer_nodes = [3];
hidden_layer_size = length(hidden_layer_nodes);

n = size(x, 2);
k = size(d, 2);

nodes = [n hidden_layer_nodes k];

theta = initialize_theta(nodes);

mse_history = [];

iterations = 500;

for i=1:iterations

	mse = 0;

	for i=1:size(x, 1)

		xx = [1; x(i, :)'];
		[y, a] = forward_propagate(nodes, theta, xx);


		%Calculating final output error
		e = d(i, :)' - y;

		theta_updated = back_propagate(nodes, theta, a, e, y);
		theta = theta_updated;

		mse = mse + e*e;

	end

	mse = mse/size(x, 1);
	mse_history = [mse_history; mse];
	% disp(mse);
end

plot(1:iterations, mse_history);