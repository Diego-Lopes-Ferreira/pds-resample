clear; clc;

load('audioOriginal.mat'); % recOriginal, fsOriginal e tempo

% Reamostrar o sinal em 8 kHz e salvá-lo em uma nova variável
fs8kHz = 8000; % 8 kHz
rec8kHz = resample(recOriginal, fs8kHz, fsOriginal);

% Plotar o espectro de frequência
figure('Name', 'Comparacao Original x 8kHz');
    title('Comparacao Original x 8kHz');

    x = 0:(1/fsOriginal):tempo;
    Y = fft(recOriginal, length(recOriginal));
    subplot(3,2,1);
        plot(x, recOriginal, 'b');
        xlabel('Audio Original')

    subplot(3,2,3);
        plot(x, abs(Y), 'r');
        xlabel('Modulo do Audio Original')

    subplot(3,2,5);
        plot(x, angle(Y), 'g');
        xlabel('Fase do Audio Original')

    title('Comparacao Original x 8kHz');

    x = 0:(1/fs8kHz):tempo;
    Y = fft(rec8kHz, length(rec8kHz));
    subplot(3,2,2);
        plot(x, rec8kHz, 'b');
        xlabel('Audio Reamostrado')

    subplot(3,2,4);
        plot(x, abs(Y), 'r');
        xlabel('Modulo do Audio Reamostrado')

    subplot(3,2,6);
        plot(x, angle(Y), 'g');
        xlabel('Fase do Audio Reamostrado')

