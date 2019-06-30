# teamcity-docker-compose
Compose to create working [TeamCity](https://www.jetbrains.com/teamcity/) server with PostgreSQL and Agents

![state](https://img.shields.io/badge/state-stable-brightgreen.svg)
![ssl](https://img.shields.io/badge/HTTPs-traefik-brightgreen.svg)

**This configuration use only official images:**

[teamcity server](https://hub.docker.com/r/jetbrains/teamcity-server/),
[teamcity agent](https://hub.docker.com/r/jetbrains/teamcity-minimal-agent/),
[postgres](https://hub.docker.com/_/postgres/),
[traefik](https://hub.docker.com/_/traefik)

# How to use

Clone this repository or download the zip.

```
git clone https://github.com/egregors/teamcity-docker-compose.git
```

## Configuration

All you need is to set a few ENV variables in the `example.env` file.

Set your Postgres username and password in `env.example` 

Set your `VIRTUAL_HOST` and ACME credential (`LETSENCRYPT_HOST`, `LETSENCRYPT_EMAIL`)

**After all rename `env.example` to `.env`**

Don't push `.env` file in public repositories!

It's all. PostgreSQL already configured according to the
JetBrains [recommendations](https://confluence.jetbrains.com/pages/viewpage.action?pageId=74847395#HowTo...-ConfigureNewlyInstalledPostgreSQLServer)

### HTTPs support

HTTPs entry point is enabled by default thanks to [traefik](https://traefik.io/)

If you don't need HTTPs support – use `docker-compose-nossl.yml`

## Build and setup

Next, build the images:
`make build`

or

```
docker-compose -f docker-compose.yml build
```

Now you may start up the service and continue configuring settings in Web Interface: `make up`

or

```
mkdir -p /opt/traefik && touch /opt/traefik/acme.json && chmod 600 /opt/traefik/acme.json
docker-compose -f docker-compose.yml up -d && docker-compose -f docker-compose.yml logs -f -t --tail=10
```

After initialisation Web Interface will be available on `https://yourdockerhost/`


### Setup DB

Open `https://yourdockerhost/`

Set PostgreSQL as database type, download `JDBC driver`

![Alt text](raw/img/1.png?raw=true)

Configure DB connection:

![Alt text](raw/img/2.png?raw=true)

Authorize your Agent:

![Alt text](raw/img/3.png?raw=true)

Done, TeamCity ready to work.

## Scaling

Scaling your workers (agents) supported as well. Just use `docker-compose scale` command:

```
docker-compose scale teamcity-agent=3
```
**Keep in mind: currently, agents are stateless**


## Backup / restore

You may use JetBrains way to [backup](https://confluence.jetbrains.com/display/TCD10/TeamCity+Data+Backup) 
or [restore](https://confluence.jetbrains.com/display/TCD10/Restoring+TeamCity+Data+from+Backup) your server


## Update

If you see a notice that a new version is available, you may update your TeamCity that way:

use `make` (set your compose file name in Makefile, by default it is `docker-compose.yml`)

```
make update
```

or

```
# stop and remove old containers
docker-compose stop
docker-compose down --rmi all

# build new version
docker-compose build --pull --no-cache

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

You can use my preconfigured custom agents with already installed necessary dependencies

### Python 3 | Node.js 11, yarn 1.15

Agent [info](agents/python-node-yarn/README.md)

### Ruby | Bundle

Agent [info](agents/bundler-ruby/README.md)

## Contributing

Bug reports, bug fixes and new features are always welcome.
Please open issues and submit pull requests for any new code.
