.ONESHELL:
.PHONY: test

run:
	@ . venv/bin/activate && \
	python src/sklearn_elasticnet_wine/train.py;

test:
	@ echo ${PWD} && \
	echo another