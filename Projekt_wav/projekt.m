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
wynik=zeros(1,Y);
wynik1=zeros(1,Y);
sr=sum(d,2)/Y;
sr1=sum(e,2)/Y;
for k = 1:Y
idx=find(d>sr);
wynik(idx) = 1;
idz=find(e>sr1);
wynik1(idz) = 1;
idy=find(wynik ~= wynik1);
end
g=[wynik;wynik1];
RysujWykres(wynik,Y);


function RysujWykres(wynik,Y);
kanal_1=g(1,:);
kanal_2=g(2,:);
check=100;
for l=1:Y
    oddech=0;
if kanal_1(l)==1
    for m = l:l+check-1
        if kanal_1(m)==1
            oddech=oddech + 1;
        end
    end
        if oddech >5;
            wynik(l:l+check-1)=1;
        else
            wynik(l:l+check-1)=0;
        end
    l=l+check;
end
end
LiczWdechy(m, wynik, g);



function LiczWdechy(m, wynik, g);
j=1;
k=1;
while k<m 
for i=k:m
    if wynik(i)==1
       start(j)=i;
       break; 
    end
end
if i>=m
    break;
end
for l=i+1:m
    if wynik(l)==0
       stop(j)=l;
       break; 
    end
end
akcja(j)=stop(j)-start(j);
j=j+1;
k=l+1;
end
for a=1:j-2
okres(a)=start(a+1)-start(a);
wdech(a)=stop(a)-start(a);
wydech(a)=start(a+1)-stop(a);
end
okres_t=okres/441;
wdech_t=wdech/441;
wydech_t=wydech/441;