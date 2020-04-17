% Setup function & domain
% f=@(x) x^3-2*x-5;
g=@(x) x-(x^3-2*x-5)/20;
a=2.0;
NMax=14;
Tol=1e-5;

% Setup variables for iterations
FALSE=0; TRUE=1;
I = 1;
x0 = a;
xn = g(x0); % x1 = g(x0)

% Fixed Point Iterations
DONE = FALSE;
while I <= NMax && DONE == FALSE
    Gxn = g(xn);
    error = abs(Gxn - xn);
    disp([num2str(I),' ',num2str(xn,'%0.8e'),' ',num2str(Gxn,'%0.8e')]);
    if error < Tol   % (Error<1e-5)
        % procedure completed successfully
        disp(['approximate solution x = ',num2str(xn,9)]);
        disp(['with g(x) = ',num2str(Gxn,9)]);
        disp(['Number of iterations = ',num2str(I),' Tolerance = ',num2str(Tol)]);
        DONE = TRUE;
    else
        I = I+1;
        xn = Gxn;
    end
end