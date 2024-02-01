ARG ALPINE_TAG

FROM alpine:${ALPINE_TAG}

LABEL maintainer="pedroetb@gmail.com"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 2049

ARG BASH_VERSION \
    LIBCAP_VERSION \
    NFS_UTILS_VERSION

RUN apk --update --no-cache add \
        bash="${BASH_VERSION}" \
        libcap="${LIBCAP_VERSION}" \
        nfs-utils="${NFS_UTILS_VERSION}" && \
    rm -v \
        /etc/idmapd.conf \
        /etc/exports && \
    mkdir -p \
        /var/lib/nfs/rpc_pipefs \
        /var/lib/nfs/v4recovery && \
    echo "rpc_pipefs /var/lib/nfs/rpc_pipefs rpc_pipefs defaults 0 0" >> /etc/fstab && \
    echo "nfsd /proc/fs/nfsd nfsd defaults 0 0" >> /etc/fstab

COPY ./docker-nfs-server/entrypoint.sh /usr/local/bin
