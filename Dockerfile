FROM selenium/standalone-chrome:latest

# Variables
ENV MAVEN_VERSION=3.6.0 \
    MAVEN_HOME=/usr/lib/mvn \
    NODE_VERSION=10.14.2 \
    SHELL=/bin/bash \
    LANG=en_US.UTF-8 \
    CSVER=3.0.0 \
    GAUGE_VER=1.0.8

ENV PATH $MAVEN_HOME/bin:/usr/local/bin:$PATH

# Packages
USER root
RUN apt-get update \
    && apt-get install -y openjdk-11-jdk \
      curl \
      dumb-init \
      && curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
      && apt-get install -y \
      nodejs \
      maven \
      net-tools \
      git \
	  && apt-get clean \
	  && rm -rf /var/lib/apt/lists/* \
	  && rm -rf /var/cache/oracle-jdk11-installer \
    && npm install -g npmlog

# https://wiki.debian.org/Locale#Manually
RUN sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen \
  && locale-gen \
  && chsh -s /bin/bash \ 
  && echo "seluser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

# Install Gauge
RUN curl -SsL -o gauge.zip https://github.com/getgauge/gauge/releases/download/v${GAUGE_VER}/gauge-${GAUGE_VER}-linux.x86_64.zip \
    && unzip -q gauge.zip \
    && cp ./gauge /usr/local/bin/ \
    && cd ../tmp \
    && rm -rf tmp \
    && gauge install java \
    && gauge install js \
    && gauge install screenshot \
    && gauge install html-report \
    && gauge install xml-report

# Install fixuid
RUN curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.4/fixuid-0.4-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: seluser\ngroup: seluser\n" > /etc/fixuid/config.yml

# Install Code-Server
RUN cd /tmp && \
  curl -SsL https://github.com/cdr/code-server/releases/download/${CSVER}/code-server-${CSVER}-linux-x86_64.tar.gz | tar -xzf - && \
  mv code-server* /usr/local/lib/code-server && \
  ln -s /usr/local/lib/code-server/code-server /usr/local/bin/code-server

USER seluser

EXPOSE 8080
WORKDIR /home/seluser

RUN /usr/local/bin/code-server --install-extension getgauge.gauge

ENTRYPOINT ["dumb-init", "fixuid", "-q", "/usr/local/bin/code-server", "--host", "0.0.0.0", "."]
