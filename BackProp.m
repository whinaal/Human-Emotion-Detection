%%%%% Data Input %%%%%
for i=1:15
    angrymfcc{i}=mean(angrymfcc{i}');
end

%---------------------
for i=1:15
    sadmfcc{i}=mean(sadmfcc{i}');
end
%---------------------
for i=1:15
    normalmfcc{i}=mean(normalmfcc{i}');
end

%---------------------
semuaangry=[angrymfcc{1,1};angrymfcc{1,2};
            angrymfcc{1,3};angrymfcc{1,4};
            angrymfcc{1,5};angrymfcc{1,6};
            angrymfcc{1,7};angrymfcc{1,8};
            angrymfcc{1,9};angrymfcc{1,10};
            angrymfcc{1,11};angrymfcc{1,12};
            angrymfcc{1,13};angrymfcc{1,14};
            angrymfcc{1,15}]';

semuasad=[sadmfcc{1,1};sadmfcc{1,2};
          sadmfcc{1,3};sadmfcc{1,4};
           sadmfcc{1,5};sadmfcc{1,6};
           sadmfcc{1,7};sadmfcc{1,8};
           sadmfcc{1,9};sadmfcc{1,10};
           sadmfcc{1,11};sadmfcc{1,12};
           sadmfcc{1,13};sadmfcc{1,14};
           sadmfcc{1,15}]';

semuanormal=[normalmfcc{1,1};normalmfcc{1,2};
           normalmfcc{1,3};normalmfcc{1,4};
           normalmfcc{1,5};normalmfcc{1,6};
           normalmfcc{1,7};normalmfcc{1,8};
           normalmfcc{1,9};normalmfcc{1,10};
           normalmfcc{1,11};normalmfcc{1,12};
           normalmfcc{1,13};normalmfcc{1,14};
           normalmfcc{1,15}]';

Input=[semuaangry,semuasad,semuanormal];
Target =[ones(1,size(semuaangry,2)),ones(1,size(semuasad,2))*2,ones(1,size(semuanormal,2))*3];

%----------------------------------------------------------------------------------
%%%%% Preprocessing / Normalisasi %%%%%
%those variables means :

[Inputn,minInput,maxInput,Targetn,minTarget,maxTarget]=premnmx(Input,Target);
%Inputn=mapminmax(Input);
%Targetn=mapminmax(Target);

%-----------------------------------------------------------------------------------

%Feedforward
net=newff(minmax(Inputn),[4 1],{'logsig' 'purelin'},'traingdm');

%set parameters
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-3;
net.trainParam.lr = 0.5;
net.trainParam.show = 20;
net.trainParam.mc = 0.8;


%n those variables means :
%1000 = jumlah epoch (iterasi) learning maksimal BPNN kita
%1e-3 = jumlah error minimum yg kita inginkan
%0.1 = jumlah learning rate, antara 0-1
%10 = jumlah epoch dimana grafik error akan di-update
%0.8 = jumlah momentum (antara 0-1)

%Learning%
net=train(net,Inputn,Targetn);

%Simulate Our BPNN%
Simnetn = sim(net,Inputn);

%test=[ujimfcc1{1,1}];
%pnew = [mean(test')];
%pnewn= mapminmax(pnew');
%Output= sim(net,pnewn);

