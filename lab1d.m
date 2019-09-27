np = 1e7; nd = 10; nl = 8;

hp = gcp('nocreate');
if isempty(hp), hp=parpool(nl); end

tic;
spmd
    A = randn(np/nl,nd); B = randn(np/nl,nd);
    d = zeros(np/nl,1);
    
    for i = 1: np/nl
        for j = 1:nd
            d(i) = d(i) + (B(i,j)-A(i,j)).^2;
        end
        d(i) = sqrt(d(i));
    end
    da = gcat(d,1,1);
end
t = toc;
d1 = da{1};

delete(hp);
