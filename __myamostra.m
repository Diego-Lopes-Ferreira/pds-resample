clear; clc;

[recOriginal, fsOriginal] = audioread('audioWhats.wav');
% [siz] = audioread('audioWhats.wav', 'size');

tempo = ( length(recOriginal)-1 ) / fsOriginal

save('audioOriginal.mat', 'recOriginal', 'fsOriginal', 'tempo');

