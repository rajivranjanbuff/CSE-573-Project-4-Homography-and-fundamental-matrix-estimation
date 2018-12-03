function H = homography(x_subset, y_subset)
[g, h] = size(x_subset);   
H = [];
 for i = 1:g        
p1 = x_subset(i,:);
p2 = y_subset(i,:);
H_i = [ zeros(1,3),-p1,p2(2)*p1;p1,zeros(1,3),-p2(1)*p1];
H = [H; H_i];        
 end
[U,S,V] = svd(H); 
h = V(:,9);     
H = reshape(h, 3, 3);   
H = H ./ H(3,3);  
end