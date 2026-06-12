% Digital guitar synthsizer

fs = 44000;         
duration = 2;
N = fs * duration;

% change frequency(f) to required note frequency
f = 246.94;         
D = round(fs/f);    

x = zeros(1, N); 
x(1:D) = randn(1, D); 
y = zeros(1, N);


for n = 1:N
    if n > D
        if n-D-1 >= 1
            y(n) = x(n) + (y(n-D) + y(n-D-1)) * 1/2;
        else
            y(n) = x(n) + y(n-D) * 1/2;  
        end
    else
        y(n) = x(n);
    end
end

sound(y, fs)