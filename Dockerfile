FROM alpine:3.5

#
# This automatically uses the SOURCE_BRANCH branch name of the
# automated build to pick the agilo version.
# When building locally, you can use
#
#  $ docker build -t aglio --build-arg VERSION=3.3.0 .
#
ARG VERSION
ENV VERSION ${VERSION:-$SOURCE_BRANCH}

# inspired by https://github.com/christian-blades-cb/aglio-docker
RUN apk -U add nodejs g++ make python; npm install -g aglio@$VERSION; apk del g++ make python

ENTRYPOINT ["aglio"]
