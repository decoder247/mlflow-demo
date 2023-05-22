py-setup:
	@bash ./scripts/python/setup_env.sh

py-install:
	@. venv/bin/activate && \
	pip install -r requirements.txt

py-clean: # # Cleanup build files created by python
	@source venv/bin/activate && \
	python -um dc2_python_utils.python_utils_general.utils_setuptools -m clean

run: # Runs with the default parameters. Alternatively: train.py <alpha> <l1_ratio>
	@. venv/bin/activate && \
	python -u src/sklearn_elasticnet_wine_train.py

mlflow: # Activates UI for MLFlow
	@. venv/bin/activate && \
	mlflow ui;

test: # Executes test functions
	@. venv/bin/activate && \
	pip list