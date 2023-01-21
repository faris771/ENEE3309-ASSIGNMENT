import numpy as np
import matplotlib.pyplot as plt

#
# def rec(t, x):
#     """Basic rectangular pulse"""
#     return 1 * (abs(t) < 0.5)
#
#
# def sgn(t, x):
#     """Sign function"""
#     return 1 * (t >= x) - 1 * (t < x)
#
#
# def u(t, x):
#     """Unit step function"""
#     return 1 * (t >= -x)


def step_function(t, x):
    return np.array(np.where(t>=-x,1,0))


# g = @(t)heaviside(t) + (1/(-T0/2)).*(t-T0/2).*heaviside(t-T0/2) + (1/(T0/2)).*(t-T0).*heaviside(t-T0)
t = np.linspace(-2, 2, 1000)
T0 =0.1



x = step_function(t, 0) + (1/(-T0/2))*(t-T0/2)*step_function(t,-T0/2) + (1/(T0/2))*(t-T0) * step_function(t,-T0)


plt.plot(t, x)
plt.show()


