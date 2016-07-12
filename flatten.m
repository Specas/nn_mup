function ww = flatten(w)

	% Flattens row wise
	ww = [];

	for i=1:size(w, 1)

		ww = [ww; w(i, :)'];

	end

end