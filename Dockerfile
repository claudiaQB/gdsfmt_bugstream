FROM rocker/r-base

#for Rcurl used by devtools
RUN apt-get update && apt-get install -y --no-install-recommends libcurl4-openssl-dev
RUN apt-get install -y ssh libxml2-dev git
	
#devtools
RUN Rscript -e 'install.packages("devtools")'

#gdsfmt from github
RUN Rscript -e 'library(devtools);install_github("zhengxwen/gdsfmt")'

COPY bug_gdsfmt.R bug_gdsfmt.R

CMD Rscript bug_gdsfmt.R


