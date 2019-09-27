function [t] = lab1b(nd,nw)
if (nargin < 1), nd = 10; nw = 8; end
pow = [1e3, 1e5, 1e7];
hp = gcp('nocreate');

if isempty(hp), hp=parpool(nw); end
for i = 1:3
    np = pow(i);
    tic;
    A = randn(np,nd); B = randn(np,nd);
    d = zeros(np,1);

    parfor i = 1:np
        for j = 1:nd
            d(i) = d(i) + (B(i,j)-A(i,j)).^2;
        end
        d(i) = sqrt(d(i));
    end
    t = toc;
    display(t);
end
delete(hp);