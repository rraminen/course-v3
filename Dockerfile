ARG FROM_IMAGE

FROM ${FROM_IMAGE}

RUN \
    pip3 install mkl-devel && \
    git clone --recursive -b master https://github.com/ROCmSoftwarePlatform/pytorch.git && \
    cd pytorch && \
    USE_MKLDNN=1 USE_MKL=1 .jenkins/pytorch/build.sh && \
    cd .. && \
    git clone -b fastai-enablement https://github.com/rraminen/fastai.git && \
    cd fastai && \
    pip3 install -e ".[dev]" && \
    cd .. && \
    git clone -b fastai-enablement https://github.com/rraminen/course-v3.git && \
    pip3 install isoweek && \
    pip3 install fire && \
    git clone https://github.com/facebookresearch/fastText.git && \
    cd fastText && \
    pip3 install . && \
    cd .. && \
    pip3 install nmslib && \
    pip3 install -U --no-dependencies  bcolz && \
    git clone https://github.com/pytorch/audio.git && \
    cd audio && \
    sudo apt-get install -y sox libsox-dev libsox-fmt-all && \
    python3.6 setup.py install && \
    cd .. && \
    git clone --recursive https://github.com/ROCmSoftwarePlatform/apex && \
    cd apex && \
    python3.6 setup.py install && \
    cd ..
