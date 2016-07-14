function theta = initialize_theta(nodes)

    %Initializes theta as a column vector using number of nodes 
    %in each hidden layer, number of inputs and number of outputs
    
    %Thresholds for random initialization
    epsilon = 1;
    theta_size = 0;
    
    for i=2:length(nodes)
        
        theta_size = theta_size + nodes(i)*(nodes(i-1)+1);
        
    end

    theta = 2*epsilon*rand(theta_size, 1) - epsilon;
    
end
        
    
    