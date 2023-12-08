# syntax=docker/dockerfile:1

FROM dde AS builder

ARG PYTHON_VERSION=3

RUN <<EOT bash -xe
  apt update
  apt --yes upgrade
  apt --yes install build-essential
EOT

# Install python build dependencies
RUN <<EOT bash -xe
apt --yes install build-essential \
                  libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
                  libsqlite3-dev libncursesw5-dev libxml2-dev \
                  libxmlsec1-dev libffi-dev liblzma-dev
EOT

# Download and install pyenv
WORKDIR /tmp
RUN <<EOT bash -xe
  curl "https://pyenv.run" | bash
EOT

# file sourced by .bashrc for pyenv activiation
WORKDIR /root
COPY shell/003-pyenv-activation.sh .dde.rc/003-pyenv-activation.sh

# Install a Python and upgrade pip
RUN <<EOT bash -xe
  source .dde.rc/003-pyenv-activation.sh
  pyenv install ${PYTHON_VERSION}
  pyenv shell ${PYTHON_VERSION}
  pip install -U pip
  pyenv global "${PYTHON_VERSION}"
EOT
