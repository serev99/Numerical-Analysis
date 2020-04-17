% Setup function & domain
% f=@(x) x^3-2*x-5;
g=@(x) x-(x^3-2*x-5)/20;
a=2.0; % Start at x0=2
NMax=14;
Tol=1e-5;

% Setup variables for iterations
FALSE=0; TRUE=1;
I = 1;
x0 = a; x1 = g(x0); x2 = g(x1);
% x0(1) = Aitken(x0(0),x1(0),x2(0))
xn = x0 - (x1-x0)^2/(x2-2*x1+x0);

% Steffensen's
DONE = FALSE;
while I <= NMax && DONE == FALSE
    xn0 = xn;
    xn1 = g(xn0);
    xn2 = g(xn1);
    aitken = xn0 - (xn1-xn0)^2/(xn2-2*xn1+xn0);
    disp([num2str(I),' ',num2str(xn,'%0.8e'),' ',num2str(aitken,'%0.8e')]);
    if abs(aitken-xn) < Tol   % (Error<1e-5)
        % procedure completed successfully
        disp(['approximate solution x = ',num2str(xn,15)]);
        disp(['with Aitken(x0(j),x1(j),x2(j)) = ',num2str(aitken,9)]);
        disp(['Number of iterations = ',num2str(I),' Tolerance = ',num2str(Tol)]);
        DONE = TRUE;
    else
        I = I+1;
        xn = aitken;
    end
end