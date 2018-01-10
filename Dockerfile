#
# Docker environment for testing script 
# 
# ### to run the test container 
# just type the below line into your console
#   this line >>> docker build -t test ./ && docker run -it test /bin/bash <<<
#   (this build a container named test and enters it)
#   and manually make sure it's up to spec
#   you can also test on http://play-with-docker.com/ 
# ###
#

### I user oracle linux 6, for the most part
FROM oraclelinux:6

### get setup.sh file through
#   curl...
RUN curl -L goo.gl/7gHfnq -o ~/setup.sh
### - or -
#   copying local file...
# COPY ./setup.sh ~/setup.sh

### make the file executable 
RUN chmod +x ~/setup.sh

### you can let docker run it, if you want to 
# RUN ~/setup.sh
