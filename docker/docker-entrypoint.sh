#!/bin/bash

syslog-ng
tail -f /var/log/messages &

if ! [ 'run' = "$1" ]; then
	exec "$@"
fi

if [ -n "${AWS_ACCESS_KEY_ID}" ] && ! [ -f ./.aws/credentials ]; then
	mkdir -p ~/.aws/
	echo '[default]' >> ~/.aws/credentials
    echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >>  ~/.aws/credentials
    echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >> ~/.aws/credentials

fi

GOOFYS_OPTS="-f --uid ${GOOFYS_UID} --gid ${GOOFYS_GID} --stat-cache-ttl $STAT_CACHE_TTL --type-cache-ttl $TYPE_CACHE_TTL --dir-mode $DIR_MODE --file-mode $FILE_MODE"

mkdir -p ${MOUNT_DIR}
/usr/bin/goofys ${GOOFYS_OPTS} ${S3_BUCKET}:${S3_PATH} ${MOUNT_DIR}

echo "Exiting ..."