CKAN_BASE_URL=http://www.civicdata.com
CKAN_API_KEY=from-ckan-users-profile-page
PROXY='--proxy http://localhost:8080'

# http://www.civicdata.com/en/dataset/lexington-code-enforcement-complaints/resource/ad346da7-ce88-4c77-a0e1-10ff09bb0622
config_code_enforcement() {
  resource_id='ad346da7-ce88-4c77-a0e1-10ff09bb0622'
  fields='[{"id":"CaseNo","type":"text"},{"id":"CaseYr","type":"text"},{"id":"Address","type":"text"},{"id":"DateOpened","type":"date"},{"id":"CaseType","type":"text"},{"id":"Status","type":"text"},{"id":"StatusDate","type":"date"},{"id":"Closed","type":"bool"},{"id":"parcelId","type":"text"},{"id":"lat","type":"float"},{"id":"lng","type":"float"}]'

  curl -v $CKAN_BASE_URL/api/action/datastore_create \
  -d '{"resource_id": "'$resource_id'","fields": '$fields', "primary_key":"CaseNo", "force":"true"}' \
  -H "Authorization: $CKAN_API_KEY"
}

# http://www.civicdata.com/en/dataset/lexington-building-permits/resource/2691aff1-e555-48d3-9188-aebf1fa8323e
config_building_permits() {
  resource_id='2691aff1-e555-48d3-9188-aebf1fa8323e'
  fields='[{"id":"ID","type":"integer"},{"id":"Date","type":"date"},{"id":"Address","type":"text"},{"id":"Suite","type":"text"},{"id":"PermitType","type":"text"},{"id":"ConstructionCost","type":"integer"},{"id":"OwnerName","type":"text"},{"id":"Contractor","type":"text"},{"id":"parcelId","type":"text"},{"id":"lat","type":"float"},{"id":"lng","type":"float"}]'

  curl -v $CKAN_BASE_URL/api/3/action/datastore_create \
    -d '{"resource_id": "'$resource_id'", "fields": '$fields', "primary_key":"ID", "force":"true"}' \
    -H "Authorization: $CKAN_API_KEY"
}

# http://www.civicdata.com/dataset/lexington-foreclosure-sales/resource/0e2f75bd-7cfd-4e3b-8770-cb7119c623ed
config_foreclosure_sales() {
  resource_id='0e2f75bd-7cfd-4e3b-8770-cb7119c623ed'
  fields='[{"id":"SALEKEY","type":"integer"},{"id":"SALEDT","type":"date"},{"id":"ADDRESS","type":"text"},{"id":"PRICE","type":"float"},{"id":"SALEVAL","type":"integer"},{"id":"parcelId","type":"text"},{"id":"lat","type":"float"},{"id":"lng","type":"float"}]'

  curl -v $PROXY $CKAN_BASE_URL/api/3/action/datastore_create \
    -d '{"resource_id": "'$resource_id'", "fields": '$fields', "primary_key":"SALEKEY", "force":"true"}' \
    -H "Authorization: $CKAN_API_KEY"
}

upsert_example() {
  curl -v $PROXY $CKAN_BASE_URL/api/3/action/datastore_upsert \
    -d '{"resource_id": "'$resource_id'", "records": [{"ID":"186844", "parcelId":"123"}], "force":"true"}' \
    -H "Authorization: $CKAN_API_KEY"
}
