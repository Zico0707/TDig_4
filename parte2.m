%% Parâmetros da Simulação
% Ritmo binário
rb = 1000;

% Samples por bit
Spb = 100;

% Frequência de amostragem
fs = Spb * rb;

%% c)
% Tempo de simulação
tsim = 10e-3;

% Potência de ruído
sigmaquadrado = 1e-10;

out = sim('p2');

%% d) & e)
% Tempo de simulação
tsim = 1;

% Valores de potência ruído
sq_vals = [20, 40, 80, 160];

% Cálculo das probabilidades de erro
pe = zeros(length(sq_vals), 1);
for ii = 1:length(sq_vals)
    sigmaquadrado = sq_vals(ii);
    out = sim('p2');
    % Atraso introduzido pelo filtro
    sequencia = squeeze(out.seq.data(1:end-1));
    recebido = squeeze(out.rec.data(2:end));
    pe(ii) = sum(abs(sequencia - recebido)) / length(sequencia);
end

disp('Probabilidades de erro (teórica):');
fprintf('%0.6f\n', normcdf(-1, 0, sqrt(sq_vals / 100)));
disp('Probabilidades de erro (estimada):');
fprintf('%0.6f\n', pe);

%% g)
% Potência de ruído
sigmaquadrado = 0.2; % 20;

out = sim('p2');
