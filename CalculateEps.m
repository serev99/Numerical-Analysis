S = 1;
T = 0;

for i = 1:1000
    S = S + 1/factorial(i);
end

for i = 1:1001
    T = T + 1/factorial(1001-i);
end

% IN COMMAND LINE:
% >> format long
% >> sprintf('%0.17g',S)
% >> sprintf('%0.17g',T)
