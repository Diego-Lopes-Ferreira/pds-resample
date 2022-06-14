clear; clc;

load('audioOriginal.mat'); % recOriginal, fsOriginal e tempo

% Plotar o espectro de frequência
figure('Name', 'Audio Original');
    title('Audio Original');

    x = 0:(1/fsOriginal):tempo;
    Y = fft(recOriginal, length(recOriginal));
    subplot(3,1,1);
        plot(x, recOriginal, 'b');
        xlabel('Audio Original')

    subplot(3,1,2);
        plot(x, abs(Y), 'r');
        xlabel('Modulo do Audio Original')

    subplot(3,1,3);
        plot(x, angle(Y), 'g');
        xlabel('Fase do Audio Original')

