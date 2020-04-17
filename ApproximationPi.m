% Goal: Sum((-1)^k/(2k+1)) accurate to 8 digits
% Use Aitken's delta-squared method for acceleration 

% Initialization
NMax = intmax;
Tol = 1e-8;

% Iterations
FALSE = 0; TRUE = 1;
DONE = FALSE;
k = 0;
while k <= NMax && DONE == FALSE
    s0 = aitken(k);
    s1 = aitken(k+1);
    error = abs(s1 - s0);
    disp([num2str(k+1),' ',num2str(s0,'%0.8e'),' ',num2str(s1,'%0.8e')]);
    if error < Tol   % (Error<1e-8)
        % procedure completed successfully
        disp(['My approximate pi/4 = ',num2str(s1,8)]);
        disp(['Number of iterations = ',num2str(k+1),' Tolerance = ',num2str(Tol)]);
        disp(['(Verify Only) True value of Pi/4 = ',num2str(pi/4 ,10)]);
        DONE = TRUE;
    else
        k = k + 1;
    end
end

% function for summation
function s = summation(j)
    s=0;
    for n = 0:j
        s = s + (-1)^n/(2*n+1);
        %s = s + 2/((4*n+1)*(4*n+3));   % (2)
    end
end

% function for aitken's delta-squared method
function g = aitken(i)
    g0 = summation(i);
    g1 = summation(i+1);
    g2 = summation(i+2);
    g = g2 - ((g2-g1)^2)/((g2-g1)-(g1-g0));
end