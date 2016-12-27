# Python3 / Django + NodeJS TC Agent

## Installed software

### Python
* python3.4
* venv

### NodeJS
* nodejs 6.3.1
* npm 3.10.3

### DB
* PostgreSQL dev lib

### Libs for work with images
* jpeg
* png

## Command Line Build Steps example

```
#!/bin/bash
python3 -m venv env
source env/bin/activate
pip install -r requirements/test.txt
python3 manage.py test
```

Example for nodejs
```
#!/bin/bash

npm install
npm run test
npm run build
```
