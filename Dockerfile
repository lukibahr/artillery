ARG VERSION=${VERSION}
FROM ubuntu:${VERSION}

ENV DEBIAN_FRONTEND noninteractive
ARG SIEGE=${SIEGE}
RUN apt-get update \
    && apt --no-install-recommends install siege=${SIEGE} -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists 

ENTRYPOINT ["siege"]
CMD [""]