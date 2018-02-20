FROM nvidia/cuda:8.0-cudnn7-devel
MAINTAINER Karen Hambardzumyan <mahnerak@yerevann.com>

RUN apt-get update && \
    apt-get install -y git wget bzip2 build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=/opt/conda/bin:${PATH}

RUN echo $PATH

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.31-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-4.3.31-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-4.3.31-Linux-x86_64.sh && \
    conda install --yes conda==4.3.31

RUN conda install numpy scipy && \
    conda install --yes Theano -c conda-forge
