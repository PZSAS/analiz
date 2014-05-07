close all
clear all
%jakas komenda sciagania
load wdech
wdech_1=wdech1(1:12000);
for i=2:3
    wdech_2=wdech1(1+(i-1)*12000:i*12000);
    wdech(1:12000)=wdech_1;
    wdech(12001:24000)=wdech_2;
    [X,Y]=size(wdech);
    g=zeros(1,Y);
    sr=sum(wdech,2)/Y;
    for k = 1:Y
        idx=find(wdech>sr);
        g(idx) = 1;
    end
    wdech_1=wdech_2;
    save online wdech g Y
end
plot(g)