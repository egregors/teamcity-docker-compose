# teamcity-docker-compose
Compose to create working [TeamCity](https://www.jetbrains.com/teamcity/) server with PostgreSQL and Agents

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


## Building and setup

Next, build the images:

```
cd teamcity-docker-compose
docker-compose build
```

Now you can Up the service and continue settings in Web Interface:

```
docker-compose up
```

After initialisation Web Interface will be available on `http://yourdockerhost:8111/`


### Setup DB

Open `http://yourdockerhost:8111/`

Set PostgreSQL as database type

![Alt text](raw/img/1.png?raw=true)

Download and copy [JDBC41 driver](https://jdbc.postgresql.org/download.html#current) into your teamcity container:


![Alt text](raw/img/0.png?raw=true)

```
cd Downloads
docker cp postgresql-9.4.1208.jre7.jar teamcitydockercompose_teamcity-server_1:/data/teamcity_server/datadir/lib/jdbc/
```
and click «Refresh JDBC drivers»

Configurate DB connector:

![Alt text](raw/img/2.png?raw=true)

Authorize your Agent:

![Alt text](raw/img/3.png?raw=true)

Done, TeamCity basically ready to work.

## Scaling

Scaling you workers (agents) supported as well. Just use `docker-compose scale` command:

```
docker-compose scale teamcity-agent=5
```
**Keep in mind, currently, agents are stateless**


## Backups / restore

You may use JetBrains way to [backup](https://confluence.jetbrains.com/display/TCD10/TeamCity+Data+Backup) 
or [restore](https://confluence.jetbrains.com/display/TCD10/Restoring+TeamCity+Data+from+Backup) your server

## Platform-specific agents

You can use our preconfigured custom agents with already installed necessary dependencies

### Python3 / Django

Agent [info](agents/django/README.md)

Run server + agent:
```
docker-compose -f tc-django-agent.yml build
docker-compose -f tc-django-agent.yml up
# optional
docker-compose -f tc-django-agent.yml scale teamcity-django-agent=5
```


## Contributing

Bug reports, bug fixes, and new features are always welcome.
Please open issues, and submit pull requests for any new code.