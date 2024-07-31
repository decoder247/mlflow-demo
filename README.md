# mlflow-demo

## Table of contents

- [Table of contents](#table-of-contents)
- [Project requirements](#project-requirements)
- [Mlflow tutorial references](#mlflow-tutorial-references)
- [Some outstanding questions](#some-outstanding-questions)
- [Mlflow components](#mlflow-components)
- [How to run](#how-to-run)

Taken from: <https://www.mlflow.org/docs/latest/tutorials-and-examples/tutorial.html>

Other examples

- <https://mlflow.org/docs/latest/quickstart.html>

## Project requirements

- [ ] Have a UI for tracking experiments
- [ ] Artifacts of the example pipeline is properly stored
- [ ] Serving of endpoint and deployment method of mlflow?

## Mlflow tutorial references

- [MLflow\: A Tool for Managing the Machine Learning Lifecycle — MLflow 2\.15\.0 documentation](https://www.mlflow.org/docs/latest/index.html "MLflow\: A Tool for Managing the Machine Learning Lifecycle — MLflow 2\.15\.0 documentation")
- [MLflow Tracking Quickstart — MLflow 2\.15\.0 documentation](https://www.mlflow.org/docs/latest/getting-started/intro-quickstart/index.html "MLflow Tracking Quickstart — MLflow 2\.15\.0 documentation")
- [Tutorial Overview — MLflow 2\.15\.0 documentation](https://www.mlflow.org/docs/latest/getting-started/logging-first-model/index.html "Tutorial Overview — MLflow 2\.15\.0 documentation")

## Some outstanding questions

- [ ] What is the difference between autolog on and off?
- [ ] How do we
- [ ] How do we do mlflow deployments?
  - [ ] <https://www.mlflow.org/docs/latest/getting-started/quickstart-2/index.html>
  - [ ] Try to deploy an API, query from it, but also as a container deployment

## Mlflow components

[MLflow\: A Tool for Managing the Machine Learning Lifecycle — MLflow 2\.15\.0 documentation](https://www.mlflow.org/docs/latest/index.html "MLflow\: A Tool for Managing the Machine Learning Lifecycle — MLflow 2\.15\.0 documentation")

![](https://www.mlflow.org/docs/latest/_static/images/intro/learn-core-components.png)

- UI
- Evaluation
- MLOps
- Tracking
- Deployment
- Registry

**Mlflow features**

1. Tracking server (this will listen to any runs that use the mlflow methods!)
   1. Server with UI
2. MLflow client -> used to interact directly with the tracking server
3. Mlflow UI -> used if want to see a frontend of the different components

**Databricks features**

[Databricks Managed MLflow \| Databricks](https://www.databricks.com/product/managed-mlflow "Databricks Managed MLflow \| Databricks")

- mlflow tracking
- mlflow models
- mlflow model registry
- mlflow deployments server
- mlflow projects
- mlflow recipes

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
