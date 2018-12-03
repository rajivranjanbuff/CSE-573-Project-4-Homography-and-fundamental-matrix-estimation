I1 = imread('../data/part2/house1.jpg');
I2 = imread('../data/part2/house2.jpg');
matches = load('house_matches.txt'); 

N = size(matches,1);

imshow([I1 I2]); hold on;
plot(matches(:,1), matches(:,2), '+r');
plot(matches(:,3)+size(I1,2), matches(:,4), '+r');
line([matches(:,1) matches(:,3) + size(I1,2)]', matches(:,[2 4])', 'Color', 'r');
pause;
