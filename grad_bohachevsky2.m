function g = grad_bohachevsky2(x)
    g = [2*x(1) + 0.9*pi*sin(3*pi*x(1))*cos(4*pi*x(2));
         4*x(2) + 1.2*pi*cos(3*pi*x(1))*sin(4*pi*x(2))];
end
