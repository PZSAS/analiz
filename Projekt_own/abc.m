clear all
close all
load online
kanal_1=g;
%kanal_2=g(2,:);
check=20;
for l=1:Y
    if l>Y-check
        break;
    end
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
save abc m wynik g;
%----------------------
%----------------------
%----------------------
subplot(2,1,1)
plot(g);
title('Sygna� po dokonaniu detekcji');
axis([0 4500 0 1]);
subplot(2,1,2)
bar(wynik);
title('Sygna� po uzupe�nieniu luk');
axis([0 4500 0 1]);
        
            
        