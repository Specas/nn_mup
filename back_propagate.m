function [theta_updated] = back_propagate(nodes, theta, a, e, y)

	alpha = 0.1; %Learning rate

	%Output gradient error first
	del = e.*sigmoid_gradient(y);
	del_tmp = del;

	%Weight gradients
	del_w = alpha*(del*(find_a(nodes, a, length(nodes)-1))');
	del_w = flatten(del_w);

	% disp(del_w);
	% fprintf('\n----------\n');

	for i=length(nodes) - 2: -1: 1 %From second last layer to first hidden layer

		t = find_theta(nodes, theta, i+1);
		del_tmp = sigmoid_gradient(find_a(nodes, a, i+1)).*(((del_tmp')*t)');

		% We need to remove the bias term from del_tmp as no inputs go to it
		del_tmp = del_tmp(2:end);

		%Find weight gradients
		del_w_tmp = alpha*(del_tmp*(find_a(nodes, a, i)'));

		% disp(del_w_tmp);
		% fprintf('\n----------\n');

		del_w_tmp = flatten(del_w_tmp);

		del_w = [del_w_tmp; del_w];

		del = [del_tmp; del];

	end

	%Now we update the weights by adding the gradient to it

	% disp(del_w);
	% fprintf('\n----------\n');

	theta_updated = theta + del_w;

end








