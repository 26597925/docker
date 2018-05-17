#!/bin/sh
set -e

if [ "${1#-}" != "$1" ]; then
	set -- vl.sh "$@"
fi

exec "$@"
