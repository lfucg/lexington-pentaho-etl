#!/bin/bash

CURR_PATH="`dirname \"$0\"`"
source $CURR_PATH/.env.ckan

CKAN_INSTANCE=$CKAN_BASE_URL/api/3/action

curl -v $CKAN_INSTANCE/datastore_upsert \
   -d '{"resource_id": "'$RESOURCE_ID'",
    "force":"true",
    "records":'"`jq .records code-enforcement-geocoded-2014.json`"'
  }' \
  -H "Authorization: $CKAN_APIKEY"
