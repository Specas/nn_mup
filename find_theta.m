function t = find_theta(theta, index, nodes)

    %This function returns the theta matrix corresponding to the 
    %index. It is extracted from the column vector theta
    
    alim = 0;
    blim = 0;
    
    %We iterate through from the begining and find all thetas
    %If it is the index that we require, then we stop and return 
    %the theta value
    
    for i=2:length(nodes)
        
        alim = blim+1; %updating
        
        blim = blim + nodes(i)*(nodes(i-1)+1);
        
        if index==(i-1)
            disp(alim);
            disp(blim);
            %return
            t = reshape(theta(alim:blim), nodes(i-1)+1, nodes(i))';
            break;
        end
        
    end
end
            
            
            
            
            
            
            
            
            
            
            
            
            
        
        
        