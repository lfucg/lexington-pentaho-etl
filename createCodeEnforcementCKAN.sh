#!/bin/bash

source .env.ckan

curl -v $CKAN_INSTANCE/resource_create \
  --form name="Complaints" \
  --form id="complaints" \
  --form package_id="code-enforcement" \
  --form format="csv" \
  --form url="code-enforcement-complaints.csv" \
  -H "Authorization: $CKAN_APIKEY"

sleep 5

fields='[{"id":"CaseNo","type":"text"},{"id":"CaseYr","type":"text"},{"id":"Address","type":"text"},{"id":"DateOpened","type":"date"},{"id":"CaseType","type":"text"},{"id":"Status","type":"text"},{"id":"StatusDate","type":"date"},{"id":"Closed","type":"bool"},{"id":"parcelId","type":"text"},{"id":"lat","type":"float"},{"id":"lng","type":"float"}]'

curl -v $CKAN_INSTANCE/datastore_create \
  -d '{"resource_id": "'$RESOURCE_ID'", "fields": '$fields', "primary_key":"CaseNo", "force":"true"}' \
  -H "Authorization: $CKAN_APIKEY"
