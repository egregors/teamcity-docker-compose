# teamcity-docker-compose
Compose to create working [TeamCity](https://www.jetbrains.com/teamcity/) server with PostgreSQL and Agents

![state](https://img.shields.io/badge/state-stable-brightgreen.svg)
![ssl](https://img.shields.io/badge/SSL-OK-brightgreen.svg)
![jdbc version](https://img.shields.io/badge/jdbc%20postgresql%20version-42.1.4-green.svg)

**This configuration use only official images:**

[teamcity server](https://hub.docker.com/r/jetbrains/teamcity-server/),
[teamcity agent](https://hub.docker.com/r/jetbrains/teamcity-minimal-agent/),
[postgres](https://hub.docker.com/_/postgres/)


# How to use

Clone this repository or download the zip.

```
git clone https://github.com/Egregors/teamcity-docker-compose.git
```


## Configuration

First of all, you should set your Postgres username and password variables in `env.example` and rename `env.example` to `.env`

Don't push `.env` file in public repositories!

It's all. PostgreSQL already configured according to the
JetBrains [recommendations](https://confluence.jetbrains.com/pages/viewpage.action?pageId=74847395#HowTo...-ConfigureNewlyInstalledPostgreSQLServer)

### HTTPs support

To add HTTPs nginx-proxy with Let's Encrypt certificates (see https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion) just set your domain name and email for `nginx` service in compose file:


```
  nginx:
    image: nginx
    links:
      - teamcity-server
    volumes:
      - "./server/etc/nginx/conf.d/:/etc/nginx/conf.d/"
    environment:
      # set your domain name and email!
      VIRTUAL_HOST: ci.example.com
      LETSENCRYPT_HOST: ci.example.com
      LETSENCRYPT_EMAIL: username@example.ru
```

If you don't need HTTPs support – remove `nginx`, `nginx-proxy` and `letsencrypt-nginx-proxy-companion` services from your docker-compose file

## Build and setup

Next, build the images:

```
cd teamcity-docker-compose
docker-compose build
```

Now you can start up the service and continue configuring settings in Web Interface:

```
docker-compose up
```

After initialisation Web Interface will be available on `https://yourdockerhost/` (with HTTPs support) or `http://yourdockerhost:8111/`


### Setup DB

Open `https://yourdockerhost/` or `http://yourdockerhost:8111/`

Set PostgreSQL as database type and click «Refresh JDBC drivers»

![Alt text](raw/img/1.png?raw=true)

Configure DB connection:

![Alt text](raw/img/2.png?raw=true)

Authorize your Agent:

![Alt text](raw/img/3.png?raw=true)

Done, TeamCity basically ready to work.

## Scaling

Scaling you workers (agents) supported as well. Just use `docker-compose scale` command:

```
docker-compose scale teamcity-agent=3
```
**Keep in mind: currently, agents are stateless**


## Backup / restore

You may use JetBrains way to [backup](https://confluence.jetbrains.com/display/TCD10/TeamCity+Data+Backup) 
or [restore](https://confluence.jetbrains.com/display/TCD10/Restoring+TeamCity+Data+from+Backup) your server


## Update

If you see a notice that a new version is available, you may update your TeamCity that way:

```
# build new version
docker-compose build --pull --no-cache

# stop and remove old containers
docker-compose stop
docker-compose rm

# create and up new containers
docker-compose up -d
```

After an update, you need to reauthorize your agents.

### Updating maintenance

Sometimes, during update you may get «maintenance is required» message instead of login page. 
It's ok! To login in a maintenance mode you need to enter an authentication token. You may find it in the logs:
`docker-compose logs -f`

Try to find something like this:

```
teamcity-server_1                    | [TeamCity] Administrator can login from web UI using authentication token: 8755994969038184734
```

## Platform-specific agents

You can use our preconfigured custom agents with already installed necessary dependencies

### Python3 / Django / Node.js

Agent [info](agents/django-nodejs/README.md)

Run server + agent:
```
docker-compose -f tc-django-nodejs-agent.yml build
docker-compose -f tc-django-nodejs-agent.yml up
# optional
docker-compose -f tc-django-nodejs-agent.yml scale teamcity-django-agent=3
```

### Ruby / Bundle

Agent [info](agents/bundler-ruby/README.md)

## Contributing

Bug reports, bug fixes and new features are always welcome.
Please open issues and submit pull requests for any new code.
