function [phi] = Malmphi(z,a)
phi(1) = sqrt(1-abs(a(1))^2)/(1-conj(a(1))*z);

bak = (z-a)./(1-conj(a)*z);

for I = 2:length(a)
    phi(I) = sqrt(1-abs(a(I)).^2)/(1-conj(a(I))*z)*prod(bak(1:I-1));
end;

end

