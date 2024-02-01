# nfs-server-image

Build Docker images for ehough/docker-nfs-server releases, including multi-arch support

## Project status

Since `v2.3.0`, verion numbers are not following releases from <https://github.com/ehough/docker-nfs-server>, because there was no updates for almost 5 years.

Now this project is using own Dockerfile definition, based on [original Dockerfile](https://github.com/ehough/docker-nfs-server/blob/develop/Dockerfile) and importing same entrypoint script.

Images are built for multiple platform architectures (`linux/amd64`, `linux/386`, `linux/arm64/v8`, `linux/arm/v7`, `linux/arm/v6`) and pushed to GitLab Registry (`registry.gitlab.com/pedroetb-projects/nfs-server-image`) and [Docker Hub](https://hub.docker.com/r/pedroetb/nfs-server).
