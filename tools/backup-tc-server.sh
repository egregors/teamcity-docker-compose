#!/bin/bash
# stop on errors
set -e

# we need to backup tc data from the volumes, according Docker Documentation:
# https://docs.docker.com/engine/tutorials/dockervolumes/#/backup-restore-or-migrate-data-volumes

# create backups folders
mkdir -p backups/tc-srv
mkdir -p backups/tc-db

