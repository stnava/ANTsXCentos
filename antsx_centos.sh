yum install -y epel-release
yum install -y wget
# yum install -y R
# yum install -y python3
# yum install -y pip3
yum install -y pandoc
yum install -y git
mkdir -p  ~/local/R_libs/
echo "R_LIBS_USER=~/local/R_libs/" > ~/.Renviron
Rscript -e 'install.packages(
  c(
  "Rcpp", # "magrittr","dplyr","devtools",
  "RcppEigen",
  "magic",
  "misc3d",
  "pander",
  "pixmap",
  "png",
  "qlcMatrix",
  "rsvd",
  "colormap",
  "viridis",
    "abind",
    "fastICA",
    "fpc",
    "ggplot2",
    "igraph",
    "keras",
    "knitr",
    "mvtnorm",
    "pander",
    "pracma",
    "prettydoc",
    "R6",
    "reticulate",
    "tensorflow",
    "testthat",
    "tfruns",
    "visreg",
    "zeallot"),
    repos = "http://cran.us.r-project.org"
    )'

vR=R3.6
wget https://github.com/stnava/ITKR/releases/download/v0.5.3.0.1/ITKR_0.5.3_R_x86_64-pc-linux-gnu_${vR}.tar.gz
wget https://github.com/ANTsX/ANTsRCore/releases/download/v0.7.3.0.3/ANTsRCore_0.7.3.1_R_x86_64-pc-linux-gnu_${vR}.tar.gz
wget https://github.com/ANTsX/ANTsR/releases/download/v0.5.4.1.2/ANTsR_0.5.4.1_R_x86_64-pc-linux-gnu_${vR}.tar.gz
R CMD INSTALL ITKR_0.5.3_R_x86_64-pc-linux-gnu_${vR}.tar.gz
R CMD INSTALL ANTsRCore_0.7.3.1_R_x86_64-pc-linux-gnu_${vR}.tar.gz
R CMD INSTALL ANTsR_0.5.4.1_R_x86_64-pc-linux-gnu_${vR}.tar.gz
git clone https://github.com/ANTsX/ANTsRNet.git && R CMD INSTALL ANTsRNet
git clone https://github.com/stnava/patchMatchR.git && R CMD INSTALL patchMatchR