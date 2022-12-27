% Ritmo binário
rb = 1000;

% Valores de potência ruído
sq_vals = [20, 40, 80, 160];

% Samples por bit
Spb = 100;

% Frequência de amostragem
fs = Spb*rb;

% Tempo de simulação
tsim = 10e-3;

pe = zeros(length(sq_vals), 1);
for ii = 1:length(sq_vals)
    sigmaquadrado = sq_vals(ii);
    out = sim('p2_simulink');
    % atraso introduzido pelo filtro
    sequencia = squeeze(out.seq.data(1:end-1));
    recebido = squeeze(out.rec.data(2:end));
    pe(ii) = sum( abs(sequencia - recebido) )/length(sequencia);
end

disp('Probabilidades de erro:');
disp(pe);



