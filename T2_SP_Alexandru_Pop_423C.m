T=40;
f=1/T;
w=2*pi*f;
t = 0:0.002:20;
N=50;
C = zeros(1,2*N+1);

x=sawtooth(w*t, 0.5)

for n = -N:N
    C(n+N+1) = 1/T * integral(@(t)(sawtooth(w*t,0.5)).*exp(-1j*n*w*t),0,T) ;
    re = real(C(n+N+1));
    im = imag(C(n+N+1));
    end
   
    C(n+N+1) = re+1j*im 
 
xr = 0;
for n = -N:N
    xr = xr + C(n+N+1)*exp(1j*n*w*t) ;
end

figure(1);
hold on
plot(t,xr);
plot(t,x);
xlabel('Timpul[s]');
title('Suprapunerea semnalelor x(t) si xr(t)')

hold off

figure(2);
hold on
stem((-N:N)*w,2*abs(C));
plot((-N:N)*w,2*abs(C),'-go');
xlabel('K');
ylabel('Amplitudinile');
title('Spectrul de Amplitudini');
hold off