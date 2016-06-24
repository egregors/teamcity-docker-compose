# teamcity-docker-compose
Compose to create working [TeamCity](https://www.jetbrains.com/teamcity/) server with PostgreSQL and Agents

**This configuration use only official images:**

[teamcity server](https://hub.docker.com/r/jetbrains/teamcity-server/),
[teamcity agent](https://hub.docker.com/r/jetbrains/teamcity-minimal-agent/),
[postgres](https://hub.docker.com/_/postgres/)

# How to use

Clone this repository or download the zip.

```
https://github.com/Egregors/teamcity-docker-compose.git`
```


## Configuration

First of all, you should set your Postgres username and password variables in `env.example` and rename `env.example` to `.env`

Don't push `.env` file in public repositories!


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

1. Open `http://yourdockerhost:8111/`

Set PostgreSQL as database type

![Alt text](raw/img/1.png?raw=true)

2. Download and copy [JDBC41 driver](https://jdbc.postgresql.org/download.html#current) into your teamcity container:


![Alt text](raw/img/0.png?raw=true)

```
cd Downloads
docker cp postgresql-9.4.1208.jre7.jar teamcitydockercompose_teamcity-server_1:/data/teamcity_server/datadir/lib/jdbc/
```
and click «Refresh JDBC drivers»

3. Configurate DB connector:

![Alt text](raw/img/2.png?raw=true)

4. Authorize your Agent:

![Alt text](raw/img/3.png?raw=true)

Done, TeamCity basically ready to work.