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

RUN wget https://github.com/stnava/ITKR/releases/download/v0.5.3.0.1/ITKR_0.5.3_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN R CMD INSTALL ITKR_0.5.3_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN wget https://github.com/ANTsX/ANTsRCore/releases/download/v0.7.3.0.3/ANTsRCore_0.7.3.1_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN R CMD INSTALL ANTsRCore_0.7.3.1_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN wget https://github.com/ANTsX/ANTsR/releases/download/v0.5.4.1.2/ANTsR_0.5.4.1_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN R CMD INSTALL ANTsR_0.5.4.1_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN git clone https://github.com/ANTsX/ANTsRNet.git && R CMD INSTALL ANTsRNet
RUN git clone https://github.com/stnava/patchMatchR.git && R CMD INSTALL patchMatchR

CMD ["bash"]
