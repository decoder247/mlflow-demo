py-setup:
	@bash ./scripts/python/setup_env.sh

py-install:
	@bash -c "source ./scripts/python/activate_env.sh && \
	pip install -r requirements.txt"

run: # Runs with the default parameters. Alternatively: train.py <alpha> <l1_ratio>
	@ . venv/bin/activate && \
	python src/sklearn_elasticnet_wine/train.py;

mlflow-ui:
	@ . venv/bin/activate && \
	mlflow ui;

test:
	@ . venv/bin/activate