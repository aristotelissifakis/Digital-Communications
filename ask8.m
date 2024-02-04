F1= 20; %sampling rate
T1 = 1/F1; %sampling interval
t1 = 0:T1:2;
x1 = sin(2*pi*1*t1);
F2= 1.5; %sampling rate
T2 = 1/F2; %sampling interval
t2 = 0:T2:2;
x2 = sin(2*pi*1*t2);
plot(t1,x1,t2,x2);
%sound(x1,F1);
%sound(x2,F2);
