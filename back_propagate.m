function [] = back_propagate(nodes, theta, a, e, y)

	alpha = 0.1; %Learning rate

	%Output gradient error first
	del = e.*sigmoid_gradient(y);
	del_tmp = del;

	%Weight gradients
	del_w = alpha*(del*(find_a(nodes, a, length(nodes)-1))');
	del_w = flatten(del_w);


	for i=length(nodes) - 2: -1: 1 %From second last layer to first hidden layer

		t = find_theta(nodes, theta, i+1);
		del_tmp = sigmoid_gradient(find_a(nodes, a, i+1)).*((del_tmp'*t)');

		%Find weight gradients
		del_w_tmp = alpha*(del_tmp*(find_a(nodes, a, i)'));
		del_w_tmp = flatten(del_w_tmp);
		del_w = [del_w_tmp; del_w];

		del = [del_tmp; del];

	end

	%Now we update the weights by adding the gradient to it

	disp(size(del_w));

end








