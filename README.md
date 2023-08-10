# mlflow-demo

## Table of contents

- [Table of contents](#table-of-contents)
- [Project requirements](#project-requirements)
- [Mlflow components](#mlflow-components)
- [How to run](#how-to-run)

Taken from: <https://www.mlflow.org/docs/latest/tutorials-and-examples/tutorial.html>

Other examples

- <https://mlflow.org/docs/latest/quickstart.html>

## Project requirements

- [ ] Have a UI for tracking experiments
- [ ] Artifacts of the example pipeline is properly stored
- [ ] Serving of endpoint and deployment method of mlflow?

## Mlflow components

Ref: <https://www.mlflow.org/docs/latest/what-is-mlflow.html>

1. Tracking
   1. Server with UI
2. sss

## How to run

To run the training loop, simply run the below

```bash
make run
```

To run with parameters, execute the python file directly, with parameters

```bash
python -u src/train.py <alpha> <l1_ratio>
```

To execute the mlflow ui

```bash
make mlflow

# Will start server on: http://localhost:5000
```

Each time you run the example, MLflow logs information about your experiment runs in the directory `mlruns`.
