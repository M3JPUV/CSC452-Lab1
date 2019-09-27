function [t] = lab1a(np, nd)
if (nargin < 1), np = 1e7; nd = 10; end
A = randn(np, nd);
B = randn(np, nd);
C = zeros(np, 1);

tic;
for i = 1:np
    for j = 1:nd
        C(i) = C(i) + (B(i, j) - A(i,j)).^2;
    end
    C(i) = sqrt(C(i));
end
t = toc;
