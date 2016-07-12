function aa = find_a(nodes, a, index)

	%We return the column vector of node values of the required index

	alim = 0;
	blim = 0;

	for i=1:length(nodes)-1 %Final output not included

		alim = blim + 1;

		blim = blim + nodes(i) + 1;

		if i==index

			aa = a(alim:blim);

		end

	end
end
