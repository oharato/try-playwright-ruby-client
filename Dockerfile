FROM ruby:3.3.5

RUN apt-get update && apt-get install -y curl && mkdir -p /usr/local/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
ENV NVM_DIR /usr/local/.nvm
ENV NODE_VERSION 22.11.0
RUN . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN npx playwright install-deps  

ARG GROUP_ID
ARG USER_ID
RUN groupadd -g $GROUP_ID app && \
    useradd -m -u $USER_ID -g app app
USER app
WORKDIR /work
