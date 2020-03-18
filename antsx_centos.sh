# yum install -y epel-release
# yum install -y wget
# yum install -y R
# yum install -y python3
# yum install -y git


sudo yum install -y pandoc
mkdir -p  /tmp/RLibs
echo "R_LIBS_USER=/tmp/RLibs/" > ~/.Renviron
Rscript -e 'install.packages( c(  "Rcpp", "magrittr","dplyr","devtools",  "RcppEigen",  "magic",  "misc3d",  "pander",  "pixmap",  "png",  "qlcMatrix",  "rsvd",  "colormap",  "viridis",    "abind",    "fastICA",    "fpc",    "ggplot2",    "igraph",    "keras",    "knitr",    "mvtnorm",    "pander",    "pracma", "prettydoc", "R6", "reticulate", "tensorflow", "testthat", "visreg",  "zeallot"), repos = "http://cran.us.r-project.org" )'

wget wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
tar -zxvf cmake-3.15.2.tar.gz
cd cmake-3.15.2
./bootstrap
make -j$(nproc)
make install
cd ..
git clone https://github.com/stnava/ITKR.git && R CMD INSTALL ITKR
git clone https://github.com/ANTsX/ANTsRCore.git && R CMD INSTALL ANTsRCore
git clone https://github.com/ANTsX/ANTsR.git && R CMD INSTALL ANTsR
git clone https://github.com/ANTsX/ANTsRNet.git && R CMD INSTALL ANTsRNet
git clone https://github.com/stnava/patchMatchR.git && R CMD INSTALL patchMatchR

#  pcluster create -c parallelcluster_config  myclust
# pcluster ssh myclust -i my.pem
#  aws s3 ls s3://mybucket
