function [y, m] = dnsample(x, n, M)
% Downsamplesequence x(n) by factor M to obtain y(m)

% Como usar:
% [y,m] = dnsample(x,n,M);
% Encontra qual a posicao do 0 (para separar o lado direito do esquerdo)
posZero = find (n==0);

% LADO NEGATIVO
% Inverte o eixo X negativo: do inicio ate o 0
x1 = fliplr(x(1:posZero));
% Faz o downsample da parte da direita utilizando a funcao do matlab
yEsquerdo = downsample(x1,M);
% Inverte novamente para voltar essas amostras para o lado negativo
yEsquerdo = fliplr(yEsquerdo);
% Monta a funcao m de saida (que e a funcao n de entrada, so que do inicio
% ate o 0) utilizando um T ("tamanho(1,2)") diferente
tamanho = size(yEsquerdo);
mEsquerdo = -fliplr( 1:tamanho(1,2)-1 );

% LADO POSITIVO
% Pega o lado positivo: do 0 ate o fim
x2 = x(posZero:end);
yDireito = downsample(x2,M);

% Monta a funcao m de saida (que e a funcao n de entrada, so que do 0
% ate o fim) utilizando um T ("tamanho(1,2)") diferente
tamanho = size(yDireito);
mDireito = 0:tamanho(1,2)-1;

% Por fim, retorna os valores de y e m:
% - y = yEsquerdo + yDireito
% ** remove o ultimo elemento do yEsquerdo que e o zero
y = [yEsquerdo(1:end-1), yDireito];
% - m = mEsquerdo + mDireito
m = [mEsquerdo, mDireito];
