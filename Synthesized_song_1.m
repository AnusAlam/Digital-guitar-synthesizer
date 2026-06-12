


fs = 44000;         
notes = [246.94,293.66,246.94,185.00,293.66,246.94,123.47,246.94,293.66,185.00,329.63,392.00,246.94,392.00,329.63,164.81,329.63,392.00,246.94,369.99,277.18,277.18,233.08,369.99,277.18,138.59,277.18,369.99,233.08,246.94,293.66,185.00,329.63,246.94,123.47,246.94,369.99,185.00,293.66,246.94,246.94,185.00,293.66,246.94,123.47,246.94,293.66,185.00,392.00,329.63,246.94,329.63,392.00,164.81,392.00,329.63,246.94,369.99,277.18,277.18,233.08,277.18,369.99,138.59,369.99,277.18,233.08,246.94,293.66,185.00,329.63,246.94,123.47,369.99,246.94,185.00];  
durations = [0.24,0.24,0.14,1.15,0.69,0.69,2.28,0.27,0.27,0.72,0.42,0.42,1.15,0.69,0.69,2.28,0.27,0.27,0.72,0.24,0.24,0.14,1.15,0.69,0.69,2.28,0.27,0.27,0.72,0.42,0.42,1.15,0.69,0.69,2.28,0.27,0.27,0.72,0.24,0.24,0.14,1.15,0.69,0.69,2.28,0.27,0.27,0.72,0.42,0.42,1.15,0.69,0.69,2.28,0.27,0.27,0.72,0.24,0.24,0.14,1.15,0.69,0.69,2.28,0.27,0.27,0.72,0.42,0.42,1.15,0.69,0.69,2.28,0.27,0.27,0.72];  


total_duration = sum(durations);
total_samples = round(fs * total_duration);
full_song = zeros(1, total_samples);

current_sample = 1;

for i = 1:length(notes)
    f = notes(i);          
    duration = durations(i);


    N = round(fs * duration);  
    D = round(fs/f);           


    x = zeros(1, N);
    x(1:D) = randn(1, D) * 0.5;  


    y = zeros(1, N);


    for n = 1:N
        if n > D

            y(n) = x(n) + 0.5 * (y(n-D) + (y(max(1, n-D-1))));
        else
            y(n) = x(n);
        end
    end


    envelope = exp(-3 * (0:N-1) / N);  
    y = y .* envelope;

    % Add to full song
    end_sample = current_sample + N - 1;
    if end_sample <= total_samples
        full_song(current_sample:end_sample) = y;
        current_sample = end_sample + 1;
    end
end


sound(full_song, fs)


figure;
plot((0:length(full_song)-1)/fs, full_song);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Synthesized Guitar Song');



