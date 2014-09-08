#!/bin/bash

source .env.ckan

resource_id=building-permits
package_id=building-permits

curl -v $CKAN_INSTANCE/resource_create \
  --form name="Permits" \
  --form id="$resource_id" \
  --form package_id="$package_id" \
  --form format="csv" \
  --form url="http://$CKAN_BASE_URL/$package_id/resource/$resource_id" \
  -H "Authorization: $CKAN_APIKEY"

sleep 5

fields='[{"id":"ID","type":"text"},{"id":"Date","type":"date"},{"id":"Address","type":"text"},{"id":"Suite","type":"text"},{"id":"PermitType","type":"text"},{"id":"ConstructionCost","type":"integer"},{"id":"OwnerName","type":"string"},{"id":"Contractor","type":"string"},{"id":"parcelId","type":"text"},{"id":"lat","type":"float"},{"id":"lng","type":"float"}]'

curl -v $CKAN_INSTANCE/datastore_create \
  -d '{"resource_id": "'$RESOURCE_ID'", "fields": '$fields', "primary_key":"ID", "force":"true"}' \
  -H "Authorization: $CKAN_APIKEY"
