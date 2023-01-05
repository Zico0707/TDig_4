%% Parâmetros da Simulação
% Ritmo binário
rb = 1000;

% Samples por bit
Spb = 100;

% Frequência de amostragem
fs = Spb * rb;

%% b)
% Tempo de simulação
tsim = 10e-3;

% Potência de ruído
sigmaquadrado = 1e-10;

out = sim('p3');

%% c), d) & e)
% Tempo de simulação
tsim = 10;

% Valores da potência ruído
sq_vals = [20, 40, 80, 160];

% Energia do bit (Tb)
Eb = 1/rb;

% Razão Eb/N0
rEN = zeros(length(sq_vals), 1);

pe = zeros(length(sq_vals), 1);
for ii = 1:length(sq_vals)
    sigmaquadrado = sq_vals(ii);
    out = sim('p3');
    %Atraso introduzido pelo filtro
    sequencia = squeeze(out.seq.data(1:end-1));
    recebido = squeeze(out.rec.data(2:end));
    pe(ii) = sum(abs(sequencia - recebido)) / length(sequencia);
    N0 = 2 * sigmaquadrado / fs;
    rEN(ii) = 10 * log10(Eb/N0);
end

disp('Probabilidades de erro (teórica):');
fprintf('%0.6f\n', qfunc(1 ./ sqrt(sq_vals / 100)));
disp('Probabilidades de erro (estimada):');
fprintf('%0.6f\n', pe);
disp('Razão Eb/N0 [dB]:');
disp(rEN);

figure(1);
semilogy(rEN, pe, "LineWidth", 2);
xlabel('$E_b/N_0$ [dB]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$P_e$', 'Interpreter', 'latex', 'FontSize', 18);
set(gca, 'TickLabelInterpreter', 'latex');
set(gca, "fontsize", 14); 
grid on

%% g)
% Tempo de simulação
tsim = 1;

% Potência de ruído
sigmaquadrado = 0.2; % 20;

out = sim('p3');
