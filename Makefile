.ONESHELL:
.PHONY: test

# @ will make the output not repeat the command.

# Runs with the default parameters. Alternatively: train.py <alpha> <l1_ratio>
run:
	@ . venv/bin/activate && \
	python src/sklearn_elasticnet_wine/train.py;

mlflow:
	@ . venv/bin/activate && \
	mlflow ui;