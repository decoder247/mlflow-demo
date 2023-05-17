py-setup:
	@bash ./scripts/python/setup_env.sh

py-install:
	@. venv/bin/activate && \
	pip install -r requirements.txt

run: # Runs with the default parameters. Alternatively: train.py <alpha> <l1_ratio>
	@. venv/bin/activate && \
	python -u src/sklearn_elasticnet_wine/train.py

mlflow-ui:
	@. venv/bin/activate && \
	mlflow ui;

test:
	@. venv/bin/activate && \
	pip list