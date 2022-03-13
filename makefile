run:
	docker run \
                --name jupyter-covid \
                --rm \
		-p 12022:8888 \
		--user root \
		-e NB_USER=callisto \
		-e NB_UID="$(id -u)" \
		-e NB_GID="$(id -g)"  \
                -v `pwd`:/home/jovyan/work \
		-d \
		jupyter/datascience-notebook \
		/bin/bash -c "pip install jupyterthemes -q; jt -t monokai; jt -r; \
		jupyter notebook --ip="*" --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''"
