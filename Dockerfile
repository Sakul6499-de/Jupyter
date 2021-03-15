FROM jupyter/minimal-notebook
LABEL maintainer="Lukas Weber <me@sakul6499.de>"

# Update image
USER root
RUN apt-get update 
RUN apt-get upgrade -y

# Clean image
USER root
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN rm -rf /var/lib/apt/lists/*

# Switch to Jupyter user
USER $NB_UID
