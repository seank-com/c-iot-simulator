FROM ubuntu:latest

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y git && \
  apt-get install -y cmake && \
  apt-get install -y build-essential && \
  apt-get install -y curl && \
  apt-get install -y libcurl4-openssl-dev && \
  apt-get install -y libssl-dev && \
  apt-get install -y uuid-dev && \
  apt-get install -y nano && \
  cmake --version && \
  gcc --version && \
  mkdir /src && \
  cd /src && \
  git clone -b lts_07_2019 --recursive https://github.com/Azure/azure-iot-sdk-c.git && \
  cd /src/azure-iot-sdk-c && \
  mkdir cmake

WORKDIR /src/azure-iot-sdk-c

ARG connection_string

RUN sed -i "s#<connectionstring>#${connection_string}#g" samples/solutions/remote_monitoring_client/remote_monitoring.c

WORKDIR /src/azure-iot-sdk-c/cmake

RUN cmake ..
RUN cmake --build .
#RUN make install

CMD ["bash"]
