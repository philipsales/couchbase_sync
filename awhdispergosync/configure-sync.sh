#!/bin/bash

set -m

check_db() {
  curl --silent http://awhdispergodb:8091/pools > /dev/null
  echo $?
}

until [[ $(check_db) = 0 ]]; do
  echo "Waiting for Couchbase Server to be available"
  sleep 1
done

echo "Starting the Sync Gateway Service"
sync_gateway /etc/sync-gateway-config.json
echo "Started Sync Gateway Service"
