clear all;
close all;
clc;

k = 3;
N = 2^(2*k); %ennyi l elemszáma (0-át is beleszámolva)


A = alappontok(k,N);

a = sorozat(A,k);

f = fuggveny(a);

phi = Malmphi(a(1),a);

cconj=zeros(length(a));
cconj(1,1) = 1/phi(1);

for I = 2: length(a)
    M=zeros(I);
    for J =1:I        
        phi = Malmphi(a(I-J+1),a);
        M(J:I,J)=phi(I-J+1:-1:1);
    end;
    ev = zeros(I,1);
    ev(1) = 1;
    cv = M\ev; %inv(M)*ev %c conj
    cconj (1:I,I) = cv;
end;

for I = 1:length(a)
    skszor(I) = sum(cconj(I:-1:1,I).*f(1:I).');
end;


%z = [2-i 3 4*1i];
z = a;
for I = 1:length(z)
    phi_z = Malmphi(z(I),a);
    PNf(I) = sum(skszor.*phi_z);
end;

plot(real(fuggveny(z)),imag(fuggveny(z)),'*');
hold on;
plot(real(PNf),imag(PNf),'o');
plot(real(a), imag(a),'+');

% c elemeinél az oszlopok lesznek k=1, k=2, k=3, stb... eset
%abrazol1(A,k);
%hold on;
%plot(real(phi),imag(phi),'*');

