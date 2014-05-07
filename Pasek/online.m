close all
clear all
%jakas komenda sciagania
load slp32m
x=[val,val,val,val];
pom2=ones(1,size(x,2)); %dodatkowy wektor zeby wyswietlic wszystko na jednym wykresie
k=1; % tablica z numerami probek w ktorych nastapilo przejscie
for i=2:3
for i=1:5:size(x,2)
    z=[x(i),x(i+1),x(i+2),x(i+3),x(i+4)]; %bierze 5 probek
    err=erf(z); %u¿ywa na tym funkcji b³êdu
    pom=err(5)-err(1); %sprawdza ró¿nice pierwszej i ost probki (max 2)
    if(pom>=0.5)  %Jak bedzie wieszka niz 0.5 to znaczy ze bylo przejscie przez zero ( w gore) 
        
        MZ(k)=((i+4)+i)/2; %tablica z numerem probki w ktorej teoretycznie nast¹pi³o przejscie (œrednia arytmetyczna skrajnych punktów)
        k=k+1; %wpis do tablicy z probkami
        pom2(((i+4)+i)/2)=0; %wpisanie 0 na wektorze
        
    end
    
    if(pom<=-0.5) %Jak bedzie mniejsza niz 0.5 to znaczy ze bylo przejscie przez zero ( w dó³)
        
        MZ(k)=((i+4)+i)/2; 
        k=k+1;
        pom2(((i+4)+i)/2)=0;
        
    end
    
end
end
n=1:size(x,2);
plot(n,x,'.r'); %rysunek ca³ej funkcji
hold on;
plot(n,pom2,'o') %z zaznaczonymi punktami przejscia (To tylko dodatkowo
                 %¿eby by³o widaæ czy mniej wiecej przy 0 przecina funkcje
                 %ten spam na wysokoœci 1 olejcie bo tam poprostu musialo
                 %cos byc :P)