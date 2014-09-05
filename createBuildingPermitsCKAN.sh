#!/bin/bash

curl -v $CKAN_BASE_URL/api/3/action/resource_create \
  --form name="Permits" \
  --form id="$RESOURCE_ID" \
  --form package_id="$PACKAGE_ID" \
  --form format="csv" \
  --form url="http://$CKAN_BASE_URL/$PACKAGE_ID/resource/$RESOURCE_ID" \
  -H "Authorization: $CKAN_API_KEY"

sleep 5

fields='[{"id":"ID","type":"integer"},{"id":"Date","type":"date"},{"id":"Address","type":"text"},{"id":"Suite","type":"text"},{"id":"PermitType","type":"text"},{"id":"ConstructionCost","type":"integer"},{"id":"OwnerName","type":"text"},{"id":"Contractor","type":"text"},{"id":"parcelId","type":"text"},{"id":"lat","type":"float"},{"id":"lng","type":"float"}]'

# curl -v $CKAN_BASE_URL/api/3/action/datastore_delete \
#   -d '{"resource_id": "'$RESOURCE_ID'", "force":"true"}' \
#   -H "Authorization: $CKAN_API_KEY"

curl -v $CKAN_BASE_URL/api/3/action/datastore_create \
  -d '{"resource_id": "'$RESOURCE_ID'", "fields": '$fields', "primary_key":"ID", "force":"true"}' \
  -H "Authorization: $CKAN_API_KEY"
