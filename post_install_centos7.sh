#!/bin/bash
echo "R_LIBS_USER=/fsx/R_Libs_centos7/" > ~/.Renviron
# echo "R_LIBS_USER=/local/R_Libs_centos7/" > ~/.Renviron
# python3 -m pip install tensorflow --user
Rscript -e 'library(tensorflow); install_tensorflow()'
