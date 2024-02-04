function num = ask2(f,T) %Η περίοδος δίνεται σε ms
    dt = (T / 100) * exp(1) - 3; %Δειγματοληψία στο χρόνο
    Tw = T * exp(1) - 3; %Χρονική διάρκεια
    t = dt:dt:Tw;

    y = sin(2 * pi * f * t);
    N = length(y);

    y = fft(y);
    num = fftshift(y)/N
end 