# # Optimization Techniques for Bohachevsky 2 Problem

This repository contains MATLAB implementations of several optimization algorithms applied to the Bohachevsky 2 function.

## Files
- `bohachevsky2.m`: Defines the Bohachevsky 2 function.
- `grad_bohachevsky2.m`: Computes the gradient of the Bohachevsky 2 function.
- `hess_bohachevsky2.m`: Computes the Hessian matrix of the Bohachevsky 2 function.
- `newton_raphson.m`: Implements the Newton-Raphson optimization algorithm.
- `hestenes_stiefel.m`: Implements the Hestenes-Stiefel optimization algorithm.
- `polak_ribiere.m`: Implements the Polak-Ribiere optimization algorithm.
- `fletcher_reeves.m`: Implements the Fletcher-Reeves optimization algorithm.
- `run_optimization.m`: Script to run all algorithms, display results, and generate plots.

## Usage
1. Clone this repository to your local machine.
2. Add the cloned directory to your MATLAB path.
3. Run `run_optimization.m` to execute all optimization algorithms, display the results, and generate the plots.

## Algorithms
1. **Newton-Raphson**: Utilizes second-order derivatives (Hessian) for faster convergence.
2. **Hestenes-Stiefel**: A conjugate gradient method using gradient information.
3. **Polak-Ribiere**: Another conjugate gradient method improving search direction.
4. **Fletcher-Reeves**: A classic conjugate gradient method based on gradient norms.

## Results
The results include step counts and execution times for each algorithm starting from three different initial points. The optimization steps are visualized in the generated plots.

For more details, refer to the project report in the `report` directory.
