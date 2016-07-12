clc;

%Data input
data = load('data1.dat');
%d is the desired classifier output
d = data(:, size(data, 2));
x = data(:, 1:size(data, 2)-1);

hidden_layer_nodes = [3];
hidden_layer_size = length(hidden_layer_nodes);

n = size(x, 2);
k = size(d, 2);

nodes = [n hidden_layer_nodes k];

theta = initialize_theta(nodes);

for i=1:size(x, 1)

	xx = [1; x(i, :)'];
	[y, a] = forward_propagate(nodes, theta, xx);

	%Calculating final output error
	e = d(i, :)' - y;

	back_propagate(nodes, theta, a, e, y);

end
