clear;
close all;
clc;

zeros_guess=readmatrix("BZerosGuess.xlsx");

num_roots=size(zeros_guess,1);

num_functions=size(zeros_guess,2);

bzeros = zeros(num_roots, num_functions);

for k = 1:num_roots
    for n = 1:num_functions
        fun = @(x) besselj(n-1, x);
        bzeros(k, n) = fzero(fun, zeros_guess(k, n));
    end
end

rownames = string(zeros(num_roots, 1));
columnnames = string(zeros(num_functions, 1));

for i = 1:num_roots
    rownames(i) = string(i);
end


for i = 1:num_functions
    columnnames(i) = sprintf("J%d(x)", i-1);
end

Tzeros=array2table(bzeros, "RowNames", rownames', "VariableNames", columnnames');

%Export in .xlsx file
writematrix(bzeros,"BesselZeros.xlsx","WriteMode","overwritesheet");

legend_labels = cell(ones(1,num_functions));

for i = 1:num_functions
    fplot(@(x) besselj(i-1, x), [0 30]);
    hold on;
    legend_labels{i} = sprintf('$n=%d$', i-1);
end

legend(legend_labels, 'Interpreter', 'latex', 'FontSize', 14);

grid on;
box on;
axis fill;
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$J_n(x)$', 'Interpreter', 'latex', 'FontSize', 14);
title('Bessel functions of the first kind', 'Interpreter', 'latex', 'FontSize', 16);

prime_zeros_guess=readmatrix("BPrimeZerosGuess.xlsx");

num_roots=size(zeros_guess,1);

num_functions=size(zeros_guess,2);

bprimezeros = zeros(num_roots, num_functions);

syms x;

for k = 1:num_roots
    for n = 1:num_functions
        f(x) = besselj(n-1, x);
        bprimezeros(k, n) = vpasolve(diff(f,x), prime_zeros_guess(k, n));
    end
end

columnprimenames = string(zeros(num_functions,1));

for i = 1:num_functions
    columnprimenames(i) = sprintf("J'%d(x)", i-1);
end

Tprimezeros=array2table(bprimezeros,"RowNames",rownames,"VariableNames",columnprimenames');

%Export in .xlsx file
writematrix(bprimezeros,"BesselPrimeZeros.xlsx","WriteMode","overwritesheet");

figure();

for i = 1:num_functions
    fplot(diff(besselj(i-1, x),x),[0 30]);
    hold on;
    legend_labels{i} = sprintf('$n=%d$', i-1);
end

legend(legend_labels, 'Interpreter', 'latex', 'FontSize', 14);

grid on;
box on;
axis fill;
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$J\prime_n(x)$', 'Interpreter', 'latex', 'FontSize', 14);
title('Bessel prime functions of the first kind', 'Interpreter', 'latex', 'FontSize', 16);