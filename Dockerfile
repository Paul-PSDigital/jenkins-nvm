FROM thepauleh/jenkins-slave

USER jenkins

ENV NVM_DIR /home/jenkins/.nvm
ENV NODE_VERSION 4.2

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

RUN echo 'nvm install 4.2'

USER root

RUN pip install awscli

RUN gem install --no-user-install scss-lint
