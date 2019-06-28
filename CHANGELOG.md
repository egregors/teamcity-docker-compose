CHANGELOG
=========

#### ver.: 0.1.0 (24.06.2016)
* First release

#### ver.: 0.1.1 (25.06.2016)
* Add recommended PostgreSQL settings

#### ver.: 0.1.2 (26.06.2016)
* Add platform-specific agents (py3 / django)
* Agents are stateless now
* Add ability to scale agents

#### ver.: 0.1.3 (29.06.2016)
* Update py3 / django agent (add locale)

#### ver.: 0.2.0 (27.12.2016)
* Add restart policy
* Drop ansible support for django agents (django, django-nodejs)
* Add GIT to django agent
* Add Django + Node.js agent
* Readme updates

#### ver.: 0.2.1 (19.06.2017)
* Update Django + Node.js agent

#### ver.: 0.3 (18.08.2017)
* Custom TC server Dockerfile
* Auto download JDBC driver (issue #3)
* Remove Django agent
* Readme updates

#### ver.: 0.4 (13.09.2017)
* Add HTTPs support (Let's Encrypt)
* Add nginx conf for TC server
* Cleanup
* Readme updates

#### ver.: 0.4.3 (14.09.2017)
* Big uploads support (up to 500M)
* WebSocket support for nginx-proxy 
* Custom conf for proxy

#### ver.: 0.4.4 (14.09.2017)
* Compose fixes

#### ver.: 0.5.0 (06.12.2017)
* Add Ruby Bundle agent

#### ver.: 0.6.0 (26.07.2018)
* !!! (not compatible with 0.5.0 or TeamCity 2018.1) !!! Update compose conf according JetBrains recommendations (Issue #11)
* No more anon volumes (all dirs mount to host)
* Remove old JDBC driver
* Remove custom server Dockerfile, now server use directly original JetBrains image

#### ver.: 0.6.1 (07.10.2018)
* Django-nodejs Agent: downgrade python from 3.7 to 3.6.6
* Set `latest` docker tag as default for JetBrains images

#### ver.: 0.6.2 (19.12.2018)
* Share docker.sock Update DjangoNode agent (add docker client, gulp cli, aws cli) 
* Clean up services names

#### ver.: 0.6.3 (19.12.2018)
* Fix service links for nginx

#### ver.: 0.6.4 (19.12.2018)
* Fix nginx conf

#### ver.: 0.6.5 (19.12.2018)
* Move LE email, domain into .env. 
* Readme update
* add redis to DjangoNode compose

#### ver.: 0.6.6 (19.12.2018)
* Readme update
* .env example update

#### ver.: 0.6.7 (24.03.2019)
* Set virtual host as hostname of TC container (issue #17)
* Set* Readme update

#### ver.: 0.7 (07.05.2019)
* Removed old python agent
* Add python 3 | node 11 agent
* Python | node agent as agent in custom agent compose

#### ver.: 2019.1 (07.06.2019)
* Move from nginx to traefik
* SSL by almost zero config (you should only setup .env)
* Removed redundant composes
* README update