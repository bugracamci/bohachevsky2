function [x, num_steps] = fletcher_reeves(f, grad_f, x0, epsilon)
    max_iter = 1000;
    x = x0;
    g = grad_f(x);
    d = -g;
    num_steps = 0;
    while norm(g) > epsilon
        alpha = fminbnd(@(alpha) f(x + alpha * d), 0, 1);
        x_new = x + alpha * d;
        g_new = grad_f(x_new);
        beta = (g_new' * g_new) / (g' * g);
        d = -g_new + beta * d;
        x = x_new;
        g = g_new;
        num_steps = num_steps + 1;
        if num_steps > max_iter
            break;
        end
    end
end
