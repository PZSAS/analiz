clear all
close all
for i=1:120
    wdech(i)=round(50+250*rand());
    wydech(i)=round(80+360*rand());
    okres(i)=wdech(i)+wydech(i);
end
n=0;
m=60*60*200;
k=1;
i=1;
while k<m
    for j=k:m
        n=n+1;
        if j>=k+wdech(i)
            break;    
        end
        wdech1(n)=(-0.2+0.7*rand());
    end
    for l=j:m
        n=n+1;
        if l>=k+wydech(i)
           break; 
        end
        wdech1(n)=0.02*rand();
    end
    k=l+1;
    if i==120
        i=1;
    else
    i=i+1;
    end
end
plot(wdech1)
axis([0 3000 -0.5 0.8]);
save wdech wdech wydech okres wdech1
