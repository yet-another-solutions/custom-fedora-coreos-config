FROM quay.io/coreos-assembler/coreos-assembler
ENV COSA_NO_KVM=1
ENV COSA_SKIP_OVERLAY=1

COPY . /src
RUN cosa init /src
# RUN mkdir /srv/aaa
# COPY . /srv/aaa
# RUN mkdir /srv/builds
# RUN mkdir /srv/tmp
# RUN mkdir /srv/tmp/override
RUN git config --global --add safe.directory /src
# RUN git config --global --add safe.directory /srv/src/config
# RUN cosa init /srv/src/config --force
RUN cosa fetch
RUN cosa build