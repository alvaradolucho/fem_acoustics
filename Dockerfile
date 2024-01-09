FROM ubuntu:latest
# FROM conda/miniconda3

COPY fem_analysis.ipynb /app/
# COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN apt-get update && apt-get install -yq \ 
    curl wget jq vim \
    software-properties-common

# RUN add-apt-repository ppa:fenics-packages/fenics
# RUN apt-get update
# RUN apt-get install --no-install-recommends -y fenicsx

# Use the above args 
ARG CONDA_VER=latest
ARG OS_TYPE=x86_64
# Install miniconda to /miniconda
RUN curl -LO "http://repo.continuum.io/miniconda/Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh"
RUN bash Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh -p /miniconda -b
RUN rm Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda
RUN conda create -n femacoustics -y python=3.11
RUN conda init bash
# RUN conda init zsh
# RUN source activate
## RUN conda init && conda activate
# RUN conda activate femacoustics
RUN conda install -c conda-forge -y fenics-dolfinx \ 
    mpich pyvista jupyterlab
## RUN conda install jupyter lab

# CMD ["jupyter", "lab"]



######### otra oporunidad


# RUN export PATH="/root/miniconda3/bin"
# RUN PATH=$install_dir/miniconda3/bin:$PATH # este si
# RUN conda init
# RUN conda activate
# RUN conda install -c conda-forge -y fenics-dolfinx mpich pyvista

#########

CMD ["/bin/bash"]

EXPOSE 8888