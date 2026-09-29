FROM mcr.microsoft.com/devcontainers/base:ubuntu

ARG DEBIAN_FRONTEND=noninteractive
ARG OTP_VERSION=27.1
ARG ELIXIR_VERSION=1.17.3

RUN apt-get update && apt-get install -y \
  curl git build-essential inotify-tools libssl-dev libncurses5-dev \
  autoconf m4 unzip wx-common libwxgtk3.2-dev libgl1-mesa-dev libglu1-mesa-dev \
  libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils \
  postgresql-client nodejs npm \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/asdf-vm/asdf.git /opt/asdf --branch v0.14.1
ENV ASDF_DIR=/opt/asdf
ENV PATH="/opt/asdf/bin:/opt/asdf/shims:$PATH"

RUN bash -lc "asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git || true && \
  asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git || true && \
  asdf install erlang ${OTP_VERSION} && \
  asdf install elixir ${ELIXIR_VERSION}-otp-${OTP_VERSION} && \
  asdf global erlang ${OTP_VERSION} && \
  asdf global elixir ${ELIXIR_VERSION}-otp-${OTP_VERSION}"