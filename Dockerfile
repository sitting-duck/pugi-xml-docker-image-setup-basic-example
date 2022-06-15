# syntax=docker/dockerfile:1
FROM ubuntu:18.04
RUN apt-get update

RUN echo "set nu\nset tabstop=4\nset shiftwidth=4\nset expandtab\nset hlsearch" >> ~/.vimrc

RUN echo 'alias ls="ls -halp"' >> ~/.bashrc
RUN echo 'alias dir="ls -halp"' >> ~/.bashrc
RUN echo 'alias gcc="gcc-8"' >> ~/.bashrc
RUN echo 'alias g++="g++-8"' >> ~/.bashrc

RUN apt-get -y install git gcc-8 g++-8 python3 python3-pip cmake make patch unrar
RUN apt-get -y install python3-dev pkg-config autoconf cvs bzr vim
RUN python3 -m pip install distro requests

# Build tinyxml2 ##################################################
RUN apt-get -y install curl zip unzip tar
RUN git clone https://github.com/Microsoft/vcpkg.git
WORKDIR /vcpkg
RUN ./bootstrap-vcpkg.sh
RUN ./vcpkg integrate install
RUN ./vcpkg install tinyxml2
WORKDIR /home
RUN git clone https://github.com/leethomason/tinyxml2.git
RUN cp /home/tinyxml2/tinyxml2.h /source/ns-3.34/scratch
RUN cp /home/tinyxml2/tinyxml2.cpp /source/ns-3.34/scratch
##################################################################

# Build pugi xml #################################################
WORKDIR /home
RUN git clone https://github.com/zeux/pugixml.git
WORKDIR /home/pugixml
RUN git checkout tags/v1.12.1
RUN make
RUN cp /home/pugixml/src/pugiconfig.hpp /source/ns-3.34/scratch
RUN cp /home/pugixml/src/pugixml.hpp /source/ns-3.34/scratch
RUN cp /home/pugixml/src/pugixml.cpp /source/ns-3.34/scratch
##################################################################

# Build tidy xml #################################################
WORKDIR /home
RUN git clone https://github.com/htacg/tidy-html5.git
WORKDIR /home/tidy-html5
RUN git checkout tags/5.8.0
WORKDIR /home/tidy-html5/build/cmake
RUN cmake ../.. -DCMAKE_INSTALL_PREFIX=/usr/local/bin
RUN make install
RUN echo 'alias tidy="/home/tidy-html5/build/cmake/tidy"' >> ~/.bashrc
##################################################################

