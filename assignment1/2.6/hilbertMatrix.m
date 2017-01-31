%% Solves qs 2.6 for assignment 1

% This function builds hilbert matrix of size n, solves it after computing
% its cholesky factorization and finds the infinity norm of residual and
% the error (deltaX) which are returned respectively
function [infinity_norm_r, infinity_norm_deltaX] = hilbertMatrix(n)

% initialize H and x, with all values of 1
H = ones(n, n);
x = ones(n, 1);

% set values of H(i,j) according to the provided formula of question
for i = 1 : n
    for j = 1 : n
        H(i, j) = 1/(i + j - 1);
    end
end

% compute b
b = H*x;

% cholesky factorization of H
cholH = chol(H);
% find x-hat. b.' is the transpose of b from column to row, to facilitate
% the division
x_hat = b.'/cholH;

% residual
r = b - H*x_hat.';
infinity_norm_r = max(abs(r));

% error
deltaX = x_hat - x.';
infinity_norm_deltaX = max(abs(deltaX));

end
