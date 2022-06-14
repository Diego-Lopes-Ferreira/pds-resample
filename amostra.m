clear; clc;

tempo  = 5;  % 5 s de gravação
nBits  = 16;
canais = 1;
fsOriginal = 64000; % 64 kHz -> acima da frequencia de Nyquist

% Realizar a aquisição de um sinal de áudio diretamente pelo MatLab
mic1 = audiorecorder(fsOriginal, nBits, canais);

disp('Gravação iniciada');
recordblocking(mic1, tempo);
disp('Gravação finalizada');

recOriginal = getaudiodata(mic1);
%play(mic1);

tempo = ( length(recOriginal)-1 ) / fsOriginal; % para os plots depois

save('audioOriginal.mat', 'recOriginal', 'fsOriginal', 'tempo');

