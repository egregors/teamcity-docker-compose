FROM jetbrains/teamcity-minimal-agent:latest

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install Python stuff
RUN apt-get update && apt-get install -y \
    git \
    # python stuff
    python3.4-venv \
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
