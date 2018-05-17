#!/bin/sh
set -e

if [ "${1#-}" != "$1" ]; then
	set -- vc.sh "$@"
fi

exec "$@"
