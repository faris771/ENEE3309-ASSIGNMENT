syms t
T0 = 0.1;   %   period
W0 = 2.*pi/T0;
gt = heaviside(t) + (1/(-T0/2)).*(t-T0/2).*heaviside(t-T0/2) + (1/(T0/2)).*(t-T0).*heaviside(t-T0); %original function
% Define the original function g(t) as a piecewise function with three parts:
% 1. The Heaviside function
% 2. A linear function with a slope of 1/(-T0/2) and starts at t = T0/2
% 3. A linear function with a slope of 1/(T0/2) and starts at t = T0
a0 = (1/T0).* int(gt,t,0,T0) % Calculate the DC component of the Fourier series expansion
an = 0; bn = 0;
xan = []; xbn = [];
MSE = [];

for n = 1:1:3
   harmonicA = 2/T0 * int(gt.*cos(n*W0*t),t,0,T0); %  % calculate the nth harmonic cosine term of the Fourier series expansion
   harmonicB = 2/T0 * int(gt.*sin(n*W0*t),t,0,T0); % calculate the nth harmonic sine term of the Fourier series expansion
   an = an  + harmonicA *cos(n*W0*t);
   bn = bn  + harmonicB * sin(n*W0*t);

   absoluteDiffSquare = ((an + bn +a0) - gt )^2;
   MSN_each_iter = (1/T0) * int(absoluteDiffSquare,t,0,T0);
   MSE = [MSE,MSN_each_iter];


   xan = [xan,harmonicA]; % list of all an from 1 to 3, and appends values
   xbn = [xbn, harmonicB]; % list of all bn from 1 to 3
end
display(xan) % prints values of an, a1, a2,a3
display(xbn) % prints values of an, b1, b2,b3
MSE_THREE_VALUES = sprintf('MSE:\n');
MSE_THREE_VALUES =  MSE_THREE_VALUES + sprintf("%f \n%f\n%f\n",MSE(1),MSE(2),MSE(3))

%Q2
gat = a0+an + bn;
figure;
fplot(gat,'g','LineWidth',1.5)
hold on % to make 2 signals on one plot
grid on
axis([-0.005,0.11,-1,2])
fplot(gt,'r','LineWidth',1.5)
xlabel('t')
ylabel('g(t), ga(t)')
title('g(t) VS ga(t)')
legend({'y=ga(t)', 'x = g(t)'})

