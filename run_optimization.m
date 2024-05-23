% run_optimization.m
% Function definition
f = @bohachevsky2;

% Gradian and Hessian definitions
grad_f = @grad_bohachevsky2;
hess_f = @hess_bohachevsky2;

% Initial Guesses
x0_1 = [-10; 20];
x0_2 = [15; -30];
x0_3 = [0; 0];

% Error bound
epsilon = 1e-4;

% Newton-Raphson results
tic;
[x_nr1, steps_nr1] = newton_raphson(f, grad_f, hess_f, x0_1, epsilon);
time_nr1 = toc;

tic;
[x_nr2, steps_nr2] = newton_raphson(f, grad_f, hess_f, x0_2, epsilon);
time_nr2 = toc;

tic;
[x_nr3, steps_nr3] = newton_raphson(f, grad_f, hess_f, x0_3, epsilon);
time_nr3 = toc;

% Hestenes-Stiefel results
tic;
[x_hs1, steps_hs1] = hestenes_stiefel(f, grad_f, x0_1, epsilon);
time_hs1 = toc;

tic;
[x_hs2, steps_hs2] = hestenes_stiefel(f, grad_f, x0_2, epsilon);
time_hs2 = toc;

tic;
[x_hs3, steps_hs3] = hestenes_stiefel(f, grad_f, x0_3, epsilon);
time_hs3 = toc;

% Polak-Ribiere results
tic;
[x_pr1, steps_pr1] = polak_ribiere(f, grad_f, x0_1, epsilon);
time_pr1 = toc;

tic;
[x_pr2, steps_pr2] = polak_ribiere(f, grad_f, x0_2, epsilon);
time_pr2 = toc;

tic;
[x_pr3, steps_pr3] = polak_ribiere(f, grad_f, x0_3, epsilon);
time_pr3 = toc;

% Fletcher-Reeves results
tic;
[x_fr1, steps_fr1] = fletcher_reeves(f, grad_f, x0_1, epsilon);
time_fr1 = toc;

tic;
[x_fr2, steps_fr2] = fletcher_reeves(f, grad_f, x0_2, epsilon);
time_fr2 = toc;

tic;
[x_fr3, steps_fr3] = fletcher_reeves(f, grad_f, x0_3, epsilon);
time_fr3 = toc;

% Showing results on table
algorithms = {'Newton-Raphson', 'Hestenes-Stiefel', 'Polak-Ribiere', 'Fletcher-Reeves'};
steps1 = [steps_nr1, steps_hs1, steps_pr1, steps_fr1];
steps2 = [steps_nr2, steps_hs2, steps_pr2, steps_fr2];
steps3 = [steps_nr3, steps_hs3, steps_pr3, steps_fr3];
time1 = [time_nr1, time_hs1, time_pr1, time_fr1];
time2 = [time_nr2, time_hs2, time_pr2, time_fr2];
time3 = [time_nr3, time_hs3, time_pr3, time_fr3];

results_table = table(algorithms', steps1', steps2', steps3', time1', time2', time3', ...
                      'VariableNames', {'Algorithm', 'Steps1', 'Steps2', 'Steps3', 'Time1', 'Time2', 'Time3'});

disp(results_table);

% Graph
figure;
hold on;
colors = {'r', 'g', 'b', 'c'};

% Newton-Raphson results
plot(x0_1(1), x0_1(2), 'ro', 'MarkerSize', 10, 'DisplayName', 'NR Start 1');
plot(x_nr1(1), x_nr1(2), 'r*', 'MarkerSize', 10, 'DisplayName', 'NR End 1');
plot([x0_1(1), x_nr1(1)], [x0_1(2), x_nr1(2)], 'r--');

plot(x0_2(1), x0_2(2), 'go', 'MarkerSize', 10, 'DisplayName', 'NR Start 2');
plot(x_nr2(1), x_nr2(2), 'g*', 'MarkerSize', 10, 'DisplayName', 'NR End 2');
plot([x0_2(1), x_nr2(1)], [x0_2(2), x_nr2(2)], 'g--');

plot(x0_3(1), x0_3(2), 'bo', 'MarkerSize', 10, 'DisplayName', 'NR Start 3');
plot(x_nr3(1), x_nr3(2), 'b*', 'MarkerSize', 10, 'DisplayName', 'NR End 3');
plot([x0_3(1), x_nr3(1)], [x0_3(2), x_nr3(2)], 'b--');

% Hestenes-Stiefel results
plot(x0_1(1), x0_1(2), 'r+', 'MarkerSize', 10, 'DisplayName', 'HS Start 1');
plot(x_hs1(1), x_hs1(2), 'r^', 'MarkerSize', 10, 'DisplayName', 'HS End 1');
plot([x0_1(1), x_hs1(1)], [x0_1(2), x_hs1(2)], 'r-.');

plot(x0_2(1), x0_2(2), 'g+', 'MarkerSize', 10, 'DisplayName', 'HS Start 2');
plot(x_hs2(1), x_hs2(2), 'g^', 'MarkerSize', 10, 'DisplayName', 'HS End 2');
plot([x0_2(1), x_hs2(1)], [x0_2(2), x_hs2(2)], 'g-.');

plot(x0_3(1), x0_3(2), 'b+', 'MarkerSize', 10, 'DisplayName', 'HS Start 3');
plot(x_hs3(1), x_hs3(2), 'b^', 'MarkerSize', 10, 'DisplayName', 'HS End 3');
plot([x0_3(1), x_hs3(1)], [x0_3(2), x_hs3(2)], 'b-.');

% Polak-Ribiere results
plot(x0_1(1), x0_1(2), 'rs', 'MarkerSize', 10, 'DisplayName', 'PR Start 1');
plot(x_pr1(1), x_pr1(2), 'rd', 'MarkerSize', 10, 'DisplayName', 'PR End 1');
plot([x0_1(1), x_pr1(1)], [x0_1(2), x_pr1(2)], 'r-');

plot(x0_2(1), x0_2(2), 'gs', 'MarkerSize', 10, 'DisplayName', 'PR Start 2');
plot(x_pr2(1), x_pr2(2), 'gd', 'MarkerSize', 10, 'DisplayName', 'PR End 2');
plot([x0_2(1), x_pr2(1)], [x0_2(2), x_pr2(2)], 'g-');

plot(x0_3(1), x0_3(2), 'bs', 'MarkerSize', 10, 'DisplayName', 'PR Start 3');
plot(x_pr3(1), x_pr3(2), 'bd', 'MarkerSize', 10, 'DisplayName', 'PR End 3');
plot([x0_3(1), x_pr3(1)], [x0_3(2), x_pr3(2)], 'b-');

% Fletcher-Reeves results
plot(x0_1(1), x0_1(2), 'rp', 'MarkerSize', 10, 'DisplayName', 'FR Start 1');
plot(x_fr1(1), x_fr1(2), 'rh', 'MarkerSize', 10, 'DisplayName', 'FR End 1');
plot([x0_1(1), x_fr1(1)], [x0_1(2), x_fr1(2)], 'r-');

plot(x0_2(1), x0_2(2), 'gp', 'MarkerSize', 10, 'DisplayName', 'FR Start 2');
plot(x_fr2(1), x_fr2(2), 'gh', 'MarkerSize', 10, 'DisplayName', 'FR End 2');
plot([x0_2(1), x_fr2(1)], [x0_2(2), x_fr2(2)], 'g-');

plot(x0_3(1), x0_3(2), 'bp', 'MarkerSize', 10, 'DisplayName', 'FR Start 3');
plot(x_fr3(1), x_fr3(2), 'bh', 'MarkerSize', 10, 'DisplayName', 'FR End 3');
plot([x0_3(1), x_fr3(1)], [x0_3(2), x_fr3(2)], 'b-');

xlim([-50, 50]);
ylim([-50, 50]);

legend('show');
title('Optimization Paths from Different Initial Points');
xlabel('x1');
ylabel('x2');
hold off;
