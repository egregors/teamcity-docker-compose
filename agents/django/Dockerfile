FROM jetbrains/teamcity-minimal-agent:latest

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