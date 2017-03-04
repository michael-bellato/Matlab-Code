function [rocCurve] = mbROC(distA,Xa,distB,Xb)
% Receiver Operating Characteristic function
% Generate vector for roc curve

if min(Xa)>=min(Xb)  % distA/X = upper
    check=0;
elseif min(distB)>min(distA) % distB/Y = lower
    distAhold=distA; Xahold=Xa;
    distA = distB; Xa = Xb;
    distB = distAhold; Xb = Xahold;
    check=1;
end
distA = distA-min(distA); distB = distB-min(distB);

aucA = trapz(Xa,distA);
aucB = trapz(Xb,distB);

Aax = Xb(Xb<min(Xa));
Bax = Xa(Xa>max(Xb));
gap = min([length(Aax) length(Bax)]);
zpadAax = linspace(min(Xb),min(Xa),gap);
zpadBax = linspace(max(Xb),max(Xa),gap);

distAf = [zeros(1,length(zpadAax)) distA]; distax = [zpadAax Xa]; % xax
distBf = [distB zeros(1,length(zpadBax))]; distbx = [Xb zpadBax]; % xax
figure;plot(distax,distAf);hold on;plot(distbx,distBf);
C = [distAf;distBf];
LC = length(C);
dx = 1:LC; dx = flip(dx);

Ararea = NaN(1,LC-1);
Brarea = NaN(1,LC-1);
for as = 2:LC
    Ararea(dx(as)) = trapz(distax(dx(as):end),distAf(dx(as):end))/aucA;
    Brarea(dx(as)) = trapz(distbx(dx(as):end),distBf(dx(as):end))/aucB;
end
figure;
% plot(Brarea,Ararea)
rocCurve = [Ararea;Brarea];
end
%%
% A = 850:1:1250;         % range of distribution
% B = 800:1:1200;         % range of distribution
% X = normpdf(A,1050,50); % normal distribution for A
% Y = normpdf(B,1000,50); % normal distribution for B
% [rocCurve] = mbROC(X,A,Y,B);