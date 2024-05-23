function [x, num_steps] = newton_raphson(f, grad_f, hess_f, x0, epsilon)
    max_iter = 1000;
    x = x0;
    num_steps = 0;
    while true
        g = grad_f(x);
        H = hess_f(x);
        if norm(g) < epsilon
            break;
        end
        x = x - H \ g; % Newton step
        num_steps = num_steps + 1;
        if num_steps > max_iter
            break;
        end
    end
end
