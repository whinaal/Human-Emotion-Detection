for i=1:15
    angrymfcc{i}=mfcc(angry{i},11000,50);
    sadmfcc{i}=mfcc(sad{i},11000,50);
    normalmfcc{i}=mfcc(normal{i},11000,50);
end