syms t

T0 = 0.1   %   period
W0 = 2.*pi/T0


gt = heaviside(t) + (1/(-T0/2)).*(t-T0/2).*heaviside(t-T0/2) + (1/(T0/2)).*(t-T0).*heaviside(t-T0) %original function

% fplot(gt,'b','LineWidth',1.5)
% axis([-0.05 0.11 -1 2]) % from -0.5 to 0.1 in x, y from -1 to 2
% grid on


a0 = (1/T0).* int(gt,t,0,T0)
an = 0; bn = 0;


xan = []; xbn = [];

MSE = [];

for n = 1:1:3

    harmonicA = 2/T0 * int(gt.*cos(n*W0*t),t,0,T0) % for each iteration
    harmonicB = 2/T0 * int(gt.*sin(n*W0*t),t,0,T0)

    an = an  + harmonicA *cos(n*W0*t)
    bn = bn  + harmonicB * sin(n*W0*t)

    absoluteDiffSquare = ((an + bn +a0) - gt )^2
    MSN_each_iter = (1/T0) * int(absoluteDiffSquare,t,0,T0);
    MSE = [MSE,MSN_each_iter]

    xan = [xan,harmonicA] % list of all an from 1 to 3, and appends values
    xbn = [xbn, harmonicB] % list of all bn from 1 to 3


end

%fplot(a0+an + bn)
%hold on % to make 2 signals on one plot
%grid on
%axis([-0.005,0.11,-1,2])
%fplot(gt,'r','LineWidth',1.5)

anInf = 0; bnInf = 0;

% for n =1:1:50
%     newAinf = 2/T0 * int(gt*cos(n*W0*t),t,0,T0)
%     newBinf = 2/T0 * int(gt*sin(n*W0*t),t,0,T0)
%     anInf = anInf + newAinf.*cos(n*W0*t)
%     bnInf = bnInf + newBinf.*sin(n*W0*t)
%
% end

display(xan)
display(xbn)


MSE_THREE_VALUES = sprintf('MSE:\n');
MSE_THREE_VALUES=  MSE_THREE_ANWERS + sprintf("%f \n%f\n%f\n",MSE(1),MSE(2),MSE(3))


fplot((a0+an + bn),'g','LineWidth',1.5)
hold on % to make 2 signals on one plot
grid on
axis([-0.005,0.11,-1,2])
fplot(gt,'r','LineWidth',1.5)
xlabel('t')
ylabel('g(t), ga(t)')
title('g(t) VS ga(t)')
legend({'y=ga(t)', 'x = g(t)'})

%part IV




