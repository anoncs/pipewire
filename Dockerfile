FROM ubuntu:18.04
ENV DEBIAN_FRONTEND    noninteractive
RUN apt-get update -qq && apt-get install -y gcc expect build-essential curl python3 pkg-config
RUN if [ `arch` = "x86_64" ]; then curl -L -O http://mirrors.kernel.org/ubuntu/pool/main/d/dbus/libdbus-1-dev_1.12.2-1ubuntu1_amd64.deb; dpkg -i libdbus-1-dev_1.12.2-1ubuntu1_amd64.deb; fi
RUN if [ `arch` = "x86_64" ]; then curl -L -O http://mirrors.kernel.org/ubuntu/pool/main/j/jackd2/libjack-jackd2-dev_1.9.12~dfsg-2_amd64.deb; dpkg -i libjack-jackd2-dev_1.9.12~dfsg-2_amd64.deb; fi
RUN if [ `arch` = "x86_64" ]; then curl -L -O http://mirrors.kernel.org/ubuntu/pool/main/p/pulseaudio/libpulse-dev_11.1-1ubuntu7_amd64.deb; dpkg -i libpulse-dev_11.1-1ubuntu7_amd64.deb; fi
#RUN if [ `arch` = "x86_64" ]; then curl -L -O ; dpkg -i ; fi
COPY . /build/
WORKDIR /build
ENTRYPOINT ./build-ubuntu-18.04.sh
