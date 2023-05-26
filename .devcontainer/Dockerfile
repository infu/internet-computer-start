# If you want to use this Dockerfile instead of the image - remove the image from devcontainer.json and rename __build to build
FROM ubuntu:22.04 as builder

ENV NVM_DIR=/home/ib/.nvm
ENV NVM_VERSION=v0.39.1
ENV NODE_VERSION=18.1.0

ENV RUSTUP_HOME=/opt/rustup
ENV CARGO_HOME=/opt/cargo
ENV RUST_VERSION=1.62.0
ENV IC_CDK_OPTIMIZER_VERSION=0.3.4

ENV DFX_VERSION=0.14.0

# Install a basic environment needed for our build tools
RUN apt -yq update && \
    apt -yqq install --no-install-recommends curl ca-certificates \
    build-essential pkg-config libssl-dev llvm-dev liblmdb-dev clang cmake rsync libunwind-dev sudo

# Ubuntu 23.04 comes with libssl3 while dfx uses libssl1.1
RUN curl http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb --output libssl1.deb && dpkg -i libssl1.deb


# Install Rust and Cargo
ENV PATH=/opt/cargo/bin:${PATH}
RUN curl --fail https://sh.rustup.rs -sSf \
    | sh -s -- -y --default-toolchain ${RUST_VERSION}-x86_64-unknown-linux-gnu --no-modify-path && \
    rustup default ${RUST_VERSION}-x86_64-unknown-linux-gnu && \
    rustup target add wasm32-unknown-unknown
RUN cargo install --version ${IC_CDK_OPTIMIZER_VERSION} ic-cdk-optimizer

# Create new user `ib` and disable 
# password and gecos for later
# --gecos explained well here:
# https://askubuntu.com/a/1195288/635348
RUN useradd -rm -d /home/ib -s /bin/bash -g root -G sudo -u 1001 ib

# Ensure sudo group users are not 
# asked for a password when using 
# sudo command by ammending sudoers file
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

FROM builder AS build-user

USER ib
WORKDIR /home/ib

# Install Node.js using nvm
ENV PATH="/home/ib/.nvm/versions/node/v${NODE_VERSION}/bin:${PATH}"
RUN curl --fail -sSf https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash
RUN . "${NVM_DIR}/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "${NVM_DIR}/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "${NVM_DIR}/nvm.sh" && nvm alias default v${NODE_VERSION}


# Remove hostname from prompt
RUN sed -i "s|@\\\h||g" ~/.bashrc

# Install dfx
RUN sh -ci "$(curl -fsSL https://smartcontracts.org/install.sh)"

RUN mkdir -p ~/.config/dfx

# Configure dfx to be able to run NNS
RUN echo '{"local": {"bind": "127.0.0.1:8080","type": "ephemeral","replica": {"subnet_type": "system" } }}' >> ~/.config/dfx/networks.json

# This will wait for the previous commands to finish

# Install the NNS canisters  (NOT WORKING)
# RUN /home/ib/bin/dfx start --clean --artificial-delay 0 --background && sleep 3 && /home/ib/bin/dfx nns install && sleep 3 && /home/ib/bin/dfx stop



