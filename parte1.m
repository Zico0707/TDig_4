%% Parâmetros da Simulação
% Ritmo binário
rb = 1000;

% Samples per bit
Spb = 100;

% Frequência de amostragem
fs = Spb * rb;

%% b)
% Tempo de simulação
tsim = 10e-3;

% Potência de ruído
sigmaquadrado = 0.2;

out = sim('p1');

%% d) & e)
% Tempo de simulação
tsim = 1;

% Valores de potência ruído
sq_vals = [0.2, 0.4, 0.8, 1.6];

% Cálculo das probabilidades de erro
pe = zeros(length(sq_vals), 1);
for ii = 1:length(sq_vals)
    sigmaquadrado = sq_vals(ii);
    out = sim('p1');
    pe(ii) = sum(abs(out.seq.data - out.rec.data)) / length(out.seq.data);
end

disp('Probabilidades de erro (teórica):');
fprintf('%0.6f\n', normcdf(-1, 0, sqrt(sq_vals)));
disp('Probabilidades de erro (estimada):');
fprintf('%0.6f\n', pe);

%% f)
% Potência de ruído
sigmaquadrado = 0.2;

out = sim('p1');