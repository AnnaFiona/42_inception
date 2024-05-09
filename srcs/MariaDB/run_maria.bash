#!/bin/bash
#stops script when any command fails
set -e

/etc/init.d/mariadb start
#mariadb

# Keep the container running
#exec "$@"

sleep infinity