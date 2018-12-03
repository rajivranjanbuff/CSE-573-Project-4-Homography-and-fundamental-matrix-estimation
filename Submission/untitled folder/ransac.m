function [ H, inlierIndices ] = ransac( featPtsimg1, featPtsimg2 )
% iterationcount=150;
% sizesubset=4;
% threshold=10;
% mininlinerratio=.3;
    [size1, l] = size(featPtsimg1);
    numInliersEachIteration = zeros(150,1);
    storedModels = {};
    
    for i = 1 : 150
        
        subsetIndices = randsample(size1, 4);
        x_subset = featPtsimg1(subsetIndices, :);
        y_subset = featPtsimg2(subsetIndices, :);
        H = homography(x_subset, y_subset);
        errorget = errorfind(H, featPtsimg1, featPtsimg2);
        
        
        inlierIndices = find(errorget < 10);      
        numInliersEachIteration(i) = length(inlierIndices);
        
        currentInlierRatio = numInliersEachIteration(i)/size1;
        if currentInlierRatio >=  0.3
        
            x_inliers = featPtsimg1(inlierIndices, :);
            y_inliers = featPtsimg2(inlierIndices, :);
            storedModels{i} = homography(x_inliers, y_inliers);
        end
    end
    
    
    
    bestIteration = find(numInliersEachIteration == max(numInliersEachIteration));
    bestIteration = bestIteration(1); 
    bestFitModel = storedModels{bestIteration};
    
   
    residualErrors = errorfind(bestFitModel, featPtsimg1, featPtsimg2);
    inlierIndices = find(residualErrors < 10);
end