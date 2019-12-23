function out = I2(alpha,beta)

for n3=1:size(alpha,3)
    for n2=1:size(alpha,2)
        for n1 = 1:size(alpha,1)
            
            out(n1,n2,n3) = quad(@xJo,0,1,[],[],alpha(n1,n2,n3),beta(n1,n2,n3)); 
            
        end
    end
    
end