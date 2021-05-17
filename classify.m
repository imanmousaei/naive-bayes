%% classification into classes
function gender = classify(givenFeatures, classesNo, featuresNo, means, vars)
    for c=1:classesNo
        p(c) = 0.5;
        for f=1:featuresNo
            p(c) = p(c) * exp( -(givenFeatures(f)-means(c,f))^2 / (2*vars(c,f)) ) / sqrt( 2*pi* vars(c,f) )
        end
        
    end
    
    [value, index] = max(p);
    gender = index;
end