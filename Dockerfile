FROM jupyter/minimal-notebook
LABEL maintainer="Lukas Weber <me@sakul6499.de>"

# Update image
USER root
RUN apt-get update 
RUN apt-get upgrade -y

# >>> IPython-Parallel
USER $NB_UID
RUN pip install ipyparallel
USER root
RUN ipcluster nbextension enable
# <<< IPython-Parallel

# Clean image
USER root
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN rm -rf /var/lib/apt/lists/*

# Switch to Jupyter user
USER $NB_UID
