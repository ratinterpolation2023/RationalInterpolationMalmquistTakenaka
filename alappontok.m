function [z_] = alappontok(k_,N_)

for I = 0 : k_
    r = (2^I-2^(-I))/(2^I+2^(-I));
    z_(:,I+1) = r*exp(1i*2*pi*(0:N_-1)/(2^(2*I)));
end;
end

