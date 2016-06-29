FROM jetbrains/teamcity-minimal-agent:latest

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install Python staff
RUN apt-get update && apt-get install -y \
    python3.4-venv \
	python3-pip \
	# pg
	libpq-dev \
	# images
	libjpeg-dev \
	zlib1g-dev \
	libpng12-dev