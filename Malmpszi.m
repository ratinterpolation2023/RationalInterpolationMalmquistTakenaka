function [pszi] = Malmpszi(z,lambdaa)
pszi(1) = 1/sqrt(pi)*sqrt(imag(lambdaa(1)))./(z-conj(lambdaa(1)));

bak = (z-lambdaa)./(z-conj(lambdaa));

for I = 2:length(lambdaa)
    pszi(I) = 1/sqrt(pi)*sqrt(imag(lambdaa(I)))./(z-conj(lambdaa(I))).*prod(bak(1:I-1));    
end;

end

