clear all
close all
y = wavread('przemopijak.wav');
[y,Fs,bits] = wavread('przemopijak.wav');
a=abs(y');
[M,N]=size(a);
for i = 1:N/100
    d(i)= sum(a(1,1+(i-1)*100:i*100),2)/100;
    e(i)= sum(a(2,1+(i-1)*100:i*100),2)/100;
end
f=[d;e];
[X,Y]=size(f);
kanal_1=zeros(1,Y);
kanal_2=zeros(1,Y);
sr1=sum(d,2)/Y;
sr2=sum(e,2)/Y;
for k = 1:Y
idx=find(d>sr1);
kanal_1(idx) = 1;
idz=find(e>sr2);
kanal_2(idz) = 1;
end
g=[kanal_1;kanal_2];
save test g Y;
%------------------
%------------------
%------------------
subplot(3,1,1)
plot(y)
title('Sygna³ oryginalny');
subplot(3,1,2)
plot(f')
title('Sygna³ po zmniejszeniu czêstotliwoœci próbkowania');
subplot(3,1,3)
plot(g')
title('Sygna³ po dokonaniu detekcji');
%set(gca,'XTickLabel',linspace(0,10*N/Fs)) 


