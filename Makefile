tmux_dev_mlflow_session='mlflow-dev-server-ui'
tmux_dev_nb_session='mlflow-nb-dev'

# Stores local artifacts in ./mlruns
# NOTE: Doing it this way will make the loading of models be called from the
#       local filesystem VS mlflow-artifacts:/ convention!
mlflow_cmd_1="mlflow server \
	--backend-store-uri sqlite:///local/mlflow.db \
	--no-serve-artifacts \
	--default-artifact-root ./mlruns"

# Stores local artifacts in ./mlartifacts per config default of --serve-artifacts option with --default-artifact-root
mlflow_cmd_2='mlflow server \
	--backend-store-uri sqlite:///local/mlflow.db \
	--serve-artifacts'

py-setup:
	@python3 -m venv venv && \
		source venv/bin/activate && \
		pip install --upgrade pip && \
		pip install -r requirements.txt

py-install:
	@. venv/bin/activate && \
		pip install -r requirements.txt

py-clean: # Cleanup build files created by python
	@source venv/bin/activate && \
		python -um dc2_python_utils.python_utils_general.utils_setuptools -m clean

train: # Runs with the default parameters. Alternatively: train.py <alpha> <l1_ratio>
	@. venv/bin/activate && \
		python -u src/sklearn_elasticnet_wine_train.py

mlflow:
	@. venv/bin/activate && \
		mlflow ui;

mlflow-dev-cleanup:
	@rm -r mlruns mlartifacts local/mlflow.db

mlflow-dev: # Clears previous session + activates UI for MLFlow in tmux
	@make mlflow-dev-cleanup; echo "";
	@tmux new -d -s $(tmux_dev_mlflow_session)
	@tmux send-keys -t $(tmux_dev_mlflow_session).0 "source venv/bin/activate && "
	@tmux send-keys -t $(tmux_dev_mlflow_session).0 $(mlflow_cmd_1) ENTER
	@echo "Training now x3..." && sleep 3 && make train && make train && make train

mlflow-dev-stop:
	@echo "Sending stop signal (ctrl+c) to mlflow session" && \
        tmux send-keys -t $(tmux_dev_mlflow_session).0 "C-c" ENTER && \
        echo "Killing session in a few secs..." && sleep 2 && \
        tmux kill-session -t $(tmux_dev_mlflow_session)

nb:
	@tmux new -d -s $(tmux_dev_nb_session)
	@tmux send-keys -t $(tmux_dev_nb_session).0 "source venv/bin/activate && jupyter-notebook" ENTER

nb-stop:
	@echo "Sending stop signal (ctrl+c) to nb session" && \
        tmux send-keys -t $(tmux_dev_nb_session).0 "C-c" ENTER && \
        echo "Killing session in a few secs..." && sleep 2 && \
        tmux kill-session -t $(tmux_dev_nb_session)

test: # Executes test functions
	@echo asd