# Galaxy Platform Container Images

This repository contains documentations and dockerfile specifications of base
images for Galaxy.

To build an image and push it to Docker Hub (eg, `uplab/meteor-galaxy-puppeteer`), run
`./build-publish-image.sh ubuntu uplab/meteor-galaxy-ubuntu`.  The script will generate a version tag
automatically based on the date and git commit.  (Only Galaxy admins have
permissions to push these images; see the internal Galaxy README for more
details.)

The script assumes you can run `docker` without any additional setup; this is
the case on Linux or with Docker for Mac, but not with the older Mac
`docker-machine`. If you're using `docker-machine`, make sure to first run

    eval "$(docker-machine env dev)"


If you receive `denied: requested access to the resource is denied` then run `docker login docker.io`
entering you credentials and repeat the publishing process