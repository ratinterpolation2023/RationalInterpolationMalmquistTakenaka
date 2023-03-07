clear all;
close all;
clc;

k = 3;
N = 2^(2*k); %ennyi l elemszáma (0-át is beleszámolva)


A = alappontok(k,N);

a = sorozat(A,k);

lambdaa = lambda_f(a); 
%ba = ba_f(A,lambdaa);

f = fuggveny(lambdaa);

pszi = Malmpszi(lambdaa(1),lambdaa);

bconj=zeros(length(lambdaa));
bconj(1,1) = 1/pszi(1);

for I = 2: length(lambdaa)
    M=zeros(I);
    for J =1:I        
        pszi = Malmpszi(lambdaa(I-J+1),lambdaa);
        M(J:I,J)=pszi(I-J+1:-1:1);
    end;
    ev = zeros(I,1);
    ev(1) = 1;
    cv = M\ev; %inv(M)*ev %c conj
    bconj (1:I,I) = cv;
end;

for I = 1:length(lambdaa)
    skszor(I) = sum(bconj(I:-1:1,I).*f(1:I).');
end;


%z = [2-i 3 4*1i];
z = lambdaa;
for I = 1:length(z)
    pszi_z = Malmpszi(z(I),lambdaa);
    PNf(I) = sum(skszor.*pszi_z);
end;

plot(real(fuggveny(z)),imag(fuggveny(z)),'*');
hold on;
plot(real(PNf),imag(PNf),'o');
%plot(real(lambdaa), imag(lambdaa),'+');


% c elemeinél az oszlopok lesznek k=1, k=2, k=3, stb... eset
%abrazol1(A,k);
%hold on;
%plot(real(phi),imag(phi),'*');

