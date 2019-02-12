FROM nvidia/cuda:8.0-cudnn7-devel
MAINTAINER Karen Hambardzumyan <mahnerak@yerevann.com>

RUN apt-get update \
 && apt-get install -y git \
                       wget \
                       bzip2 \
                       build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=/opt/conda/bin:${PATH}

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda2-4.3.31-Linux-x86_64.sh \
 && /bin/bash /Miniconda2-4.3.31-Linux-x86_64.sh -b -p /opt/conda \
 && rm Miniconda2-4.3.31-Linux-x86_64.sh

RUN conda install --yes numpy scipy Theano mkl=2017 mkl-service -c conda-forge

