#################################################################
# Dockerfile
# File Author / Maintainer: cheng gong <512543469@qq.com>
#################################################################

FROM cgwyx/conda_debian_git

MAINTAINER cheng gong <512543469@qq.com>

RUN conda config --add channels defaults &&\
    conda config --add channels conda-forge &&\
    conda config --add channels r &&\
    conda config --add channels bioconda &&\
    conda update --all -y &&\
    conda install -y r &&\
    conda install-y -c bioconda r-wgcna &&\
    #conda install -y rpy2 &&\#
    #conda install -y -c r rpy2#
    conda install -c bioconda rpy2 &&\
    conda install -c conda-forge matplotlib
    #conda install -y matplotlib#
    #conda install -y r-wgcna=1.51#

RUN git clone https://github.com/cstoeckert/iterativeWGCNA.git &&\
    cd /iterativeWGCNA &&\
    python setup.py install
    
WORKDIR /iterativeWGCNA

CMD ["/bin/bash"]


