pnew = [mean(ujimfcc')];
pnewn= tramnmx(pnew',minInput,maxInput);
simpnewn= sim(net,pnewn);
Output=round(postmnmx(simpnewn,minTarget,maxTarget));
