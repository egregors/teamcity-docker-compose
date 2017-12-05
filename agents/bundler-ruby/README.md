# Python3 / Django + NodeJS TC Agent

## Installed software

### Python
* python3.6.1

### NodeJS
* nodejs 8.1.2
* npm 5.0.3

### DB
* PostgreSQL dev lib

### Libs for work with images
* jpeg
* png

## Command Line Build Steps example

```
#!/bin/bash
python3.6 -m venv env
source env/bin/activate
pip install -r requirements/test.txt
python3.6 manage.py test
```

Example for nodejs
```
#!/bin/bash

npm install
npm run test
npm run build
```
