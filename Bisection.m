% Setup function & domain
f=@(x) x^2-5;
a0=2; b0=3;
NMax=27; Tol=1e-8;
a=a0; b=b0;
Fa=f(a); Fb=f(b);

% Setup variables for iterations
FALSE = 0;
TRUE  = 1;
I = 1;

% Bisection
DONE = FALSE;
while I <= NMax && DONE == FALSE
    C = (b - a) / 2.0;
    P = a + C;
    FP = f(P);
    disp([num2str(I),' ',num2str(a,'%0.8e'),' ',num2str(P,'%0.8e'),' ',num2str(b,'%0.8e'),' ',num2str(FP,'%0.8e')]);
    if abs(FP) < 0.1*eps || C < Tol   % (Error < 1e-8)
        % procedure completed successfully
        disp(['approximate solution p = ',num2str(P,8)]);
        disp(['with F(P) = ',num2str(FP,8)]);
        disp(['Number of iterations = ',num2str(I),' Tolerance = ',num2str(Tol)]);
        DONE = TRUE;
    else
        I = I+1;
        % compute a(I) and b(I)
        if Fa*FP > 0
            a = P; Fa = FP;
        else
            b = P; Fb = FP;
        end
    end
end