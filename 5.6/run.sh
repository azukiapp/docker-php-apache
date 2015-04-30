#!/bin/bash
source /etc/apache2/envvars

DOCUMENT_ROOT="/app"

if [ ! -z "$APP_DIR" ]; then
	rm -rf ${DOCUMENT_ROOT}/*

	if [ -d "${APP_DIR}/public" ]; then
		dir="${DOCUMENT_ROOT}"
	else
		dir="${DOCUMENT_ROOT}/public"
	fi

	mkdir -p $dir

	bindfs -u www-data -g www-data $APP_DIR $dir
fi

exec apache2 -D FOREGROUND
