function [y, a] = forward_propagate(nodes, theta, x)

	% We feedforward once using the theta values and inputs x

	a = x;

	for i=1:length(nodes) - 1

		t = find_theta(nodes, theta, i);

		x = sigmoid(t*x);

		%Append 1 for next phase, except for the output node
		if i~=length(nodes)-1

			x = [1; x];

		end

		a = [a; x];

	end

	y = x;
end
