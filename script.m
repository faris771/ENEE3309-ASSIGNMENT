syms t

T0 = 0.1 % period
W0 = 2.*pi/T0


gt = heaviside(t) + (1/(-T0/2)).*(t-T0/2).*heaviside(t-T0/2) + (1/(T0/2)).*(t-T0).*heaviside(t-T0)

fplot(gt,'b','LineWidth',1.5)
axis([-0.05 0.11 -1 2]) % from -0.5 to 0.1 in x, y from -1 to 2
grid on

% a0
        a0 = (1/T0).* int(gt,t,0,T0)
an = 0; bn = 0;


xan = []; xbn = [];

for n = 1:1:3

harmonicA = 2/T0 * int(gt.*cos(n*W0*t),t,0,T0) % for each iteration
harmonicB = 2/T0 * int(gt.*sin(n*W0*t),t,0,T0)

an = an  + harmonicA *cos(n*W0*t)
bn = bn  + harmonicB * sin(n*W0*t)

xan = [xan,harmonicA] % list of all an from 1 to 3, and appends values
        xbn = [xbn, harmonicB] % list of all bn from 1 to 3


end

display(xan)
display(xbn)

fplot(a0+an + bn)
hold on % to make 2 signals on one plot
grid on
axis([-0.005,0.11,-1,2])
fplot(gt,'r','LineWidth',1.5)


