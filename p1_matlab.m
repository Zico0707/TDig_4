% Ritmo binário
rb = 1000;

% Valores de potência ruído
sq_vals = [0.2, 0.4, 0.8, 1.6];

% Samples por bit
Spb = 10;

% Frequência de amostragem
fs = Spb*rb;

% Tempo de simulação
tsim = 10e-3;

pe = zeros(length(sq_vals), 1);
for ii = 1:length(sq_vals)
    sigmaquadrado = sq_vals(ii);
    out = sim('p1_simulink');
    pe(ii) = p_erro(out.seq.data, out.rec.data);
end

disp('Probabilidades de erro:');
disp(pe);

function pe = p_erro(seq_bin, seq_recebida)
    pe = sum( abs(seq_bin - seq_recebida) )/length(seq_bin);
end


