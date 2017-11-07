#####
#
# Docker file to build container with Keras
#

FROM tensorflow/tensorflow:latest-gpu

MAINTAINER Hidy Chiu, Wei-Yi Cheng

RUN apt-get update && apt-get install -y git-core && \
    rm -rf /var/apt/lists/*


RUN pip install keras pandas h5py && \
    pip install boto3 && \
    rm -rf /root/.cache/pip/*

RUN cd /root && git clone https://github.com/Hidysabc/iceburger.git && \
    cd iceburger && pip install .

WORKDIR /root/iceburger/
