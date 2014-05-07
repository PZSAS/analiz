close all
clear all
load abc
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
%----------------------
%----------------------
%----------------------
subplot(3,1,1)
bar(wdech_t);
title('D³ugoœci poszczególnych wdechów');
grid on
subplot(3,1,2)
bar(wydech_t);
title('D³ugoœci poszczególnych wydechów');
grid on
subplot(3,1,3)
bar(okres_t);
title('D³ugoœci poszczególnych okresów');
grid on