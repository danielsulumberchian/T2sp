clear all
close all

P = 40; % perioada = 40

F=1/P; % frecventa semnalului 

D = 25; % durata semnalului

w0=2*pi/P; % pulsatia

Ts = P/4000; % perioada de esantionare 

Fs = 1/ Ts; % frecvanta de esantionare

t=0:Ts:5*P; % generarea vectorului de timp

x = square(2*pi*F*t,(D/P)*25); % generarea semnalului dreptunghiular cu factorul de umplere corespunzator

figure(1);

plot(t,x); % afisarea semnalului 

title('Semnalul x, semnalul x refacut(cu verde)');

xlabel('Timp [s]');

ylabel('Amplitudine [V]');

% calculul coeficientilor cu ajutorul integralei

for k = -25:25

fun = @(t) square(2*pi*F*t,(D/P)*25).*exp(-i*k*w0*t);

q(k+26) = integral(fun,0,39);

end

w = -25*w0:w0:25*w0; % generarea vectorului de pulsatii

figure(2);

stem(w/(2*pi),abs(q)); % afisarea coeficientilor calculati

title('Spectrul de amplitudini al semnalului x');

X_25(1:length(t)) = 0; % initializarea semnalului 

for t_i = 1:length(t);

for k = -25:25

X_25(t_i) = X_25(t_i) + (1/P)*q(k+26)*exp(i*k*w0*t(t_i)); 

end

end

figure(1);

hold on

plot(t,X_25,'g'); % afisarea cu verde a semnalului reconstruit
