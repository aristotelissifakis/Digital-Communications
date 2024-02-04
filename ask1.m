f0 = 5;
fs = 1000;
A = 2;
ph = pi/2;
T1 = 3;
[x,t] = mine_sin(f0,fs,A,ph,T1);

function[x,t] = mine_sin(f0,fs,A,ph,T1)
	t = 0:1/fs:T1-1/fs;
	x = A * sin(2 * pi *f0 * t+ph);

	%Plot the signal and time axis
 	plot(t,x);
      xlabel("Time");
      ylabel("Amplitude");
	  title("Sinusoidal Signal");
      grid on;
end
