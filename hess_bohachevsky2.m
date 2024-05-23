function H = hess_bohachevsky2(x)
    H = [2 + 8.1*pi^2*cos(3*pi*x(1))*cos(4*pi*x(2)), -4.8*pi^2*sin(3*pi*x(1))*sin(4*pi*x(2));
         -4.8*pi^2*sin(3*pi*x(1))*sin(4*pi*x(2)), 4 + 19.2*pi^2*cos(3*pi*x(1))*cos(4*pi*x(2))];
end
