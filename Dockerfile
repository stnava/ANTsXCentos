FROM centos:7
ENV container docker

USER root
COPY ./scripts/* ${HOME}

RUN yum install -y sudo
RUN yum install -y epel-release
RUN yum install -y wget
RUN yum install -y R
RUN yum install -y pandoc
RUN yum install -y python3
RUN yum install -y git
RUN mkdir -p  ~/local/R_libs/
RUN echo "R_LIBS_USER=~/local/R_libs/" > ~/.Renviron
RUN Rscript -e 'install.packages( c(  "Rcpp", "magrittr","dplyr","devtools",  "RcppEigen",  "magic",  "misc3d",  "pander",  "pixmap",  "png",  "qlcMatrix",  "rsvd",  "colormap",  "viridis",    "abind",    "fastICA",    "fpc",    "ggplot2",    "igraph",    "keras",    "knitr",    "mvtnorm",    "pander",    "pracma", "prettydoc", "R6", "reticulate", "tensorflow", "testthat", "visreg",  "zeallot"), repos = "http://cran.us.r-project.org" )'
RUN wget wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
RUN tar -zxvf cmake-3.15.2.tar.gz
RUN cd cmake-3.15.2
RUN ./bootstrap
RUN make -j$(nproc)
RUN make install
RUN cd ..
RUN git clone https://github.com/stnava/ITKR.git && R CMD INSTALL ITKR
RUN git clone https://github.com/ANTsX/ANTsRCore.git && R CMD INSTALL ANTsRCore
RUN git clone https://github.com/ANTsX/ANTsR.git && R CMD INSTALL ANTsR
RUN git clone https://github.com/ANTsX/ANTsRNet.git && R CMD INSTALL ANTsRNet
RUN git clone https://github.com/stnava/patchMatchR.git && R CMD INSTALL patchMatchR

CMD ["bash"]
