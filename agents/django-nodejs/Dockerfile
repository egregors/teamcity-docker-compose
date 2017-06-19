FROM jetbrains/teamcity-minimal-agent:latest

# Install Python stuff
RUN apt-get update && apt-get install -y \
    build-essential \
    checkinstall \
    libreadline-gplv2-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    wget \
    locales

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN cd /usr/src && wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz && tar xzf Python-3.6.1.tgz

RUN cd /usr/src/Python-3.6.1 && ./configure && make altinstall

RUN apt-get update && apt-get install -y \
    git \
    # python stuff
    python3-pip \
    software-properties-common \
    # pg
    libpq-dev \
    # images
    libjpeg-dev \
    zlib1g-dev \
    libpng12-dev

# nodejs 
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get -y install nodejs
