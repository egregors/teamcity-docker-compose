FROM jetbrains/teamcity-minimal-agent:latest

USER root

LABEL maintainer=yaronidan@gmail.com

RUN apt-get update && apt-get -y install \
    curl

RUN curl -sSL https://get.rvm.io -o rvm.sh && curl -sSL https://rvm.io/mpapis.asc | gpg --import -

RUN cat rvm.sh | bash -s stable

RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm install ruby --default && gem install bundle"

CMD /bin/bash -c "source /etc/profile.d/rvm.sh && source run-services.sh"
