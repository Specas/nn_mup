function ww = flatten(w)

	% Flattens row wise and gives a column vector as output
	ww = [];

	for i=1:size(w, 1)

		ww = [ww; w(i, :)'];

	end

end