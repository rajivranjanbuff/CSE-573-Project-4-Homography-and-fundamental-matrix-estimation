function errorget = errorfind(H, featPtsimg1, featPtsimg2)

error_points = featPtsimg1*H; 

changet =  error_points(:,3); 
changesec = featPtsimg2(:,3);  
xcoord1=error_points(:,1)./ changet; %scaling 
xcoord2=featPtsimg2(:,1) ./ changesec;
ycoord1=error_points(:,2)./ changet;
ycoord2=featPtsimg2(:,2) ./ changesec;
errorget = (xcoord1-xcoord2).* (xcoord1-xcoord2)+ (ycoord1-ycoord2).*(ycoord1-ycoord2);
end