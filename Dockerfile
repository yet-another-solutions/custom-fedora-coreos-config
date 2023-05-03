FROM quay.io/coreos-assembler/coreos-assembler

ENV COSA_NO_KVM=1
ENV COSA_SKIP_OVERLAY=1

COPY . /src
RUN mkdir /srv/target

RUN mkdir /srv/builds
RUN mkdir /srv/builds/latest
RUN mkdir /srv/builds/latest/x86_64
USER root
RUN touch /srv/builds/latest/x86_64/test_live_img

# RUN cosa init /src
# RUN git config --global --add safe.directory /src
# RUN cosa fetch
# RUN cosa build
# RUN cosa buildextend-metal
# RUN cosa buildextend-metal4k
# RUN cosa buildextend-live

USER root
RUN cp /srv/builds/latest/x86_64/*live* /srv/target