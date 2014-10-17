#!/bin/bash

# meant to be run from a cronjob on server
cd ~/pentaho-transformations && ~/data-integration/pan.sh -level=Basic -file "geocode-code-enforcement.ktr" >> logs/cron.log 2>&1
cd ~/pentaho-transformations && ~/data-integration/pan.sh -level=Basic -file "geocode-building-permits.ktr" >> logs/cron.log 2>&1
cd ~/pentaho-transformations && ~/data-integration/pan.sh -level=Basic -file "parcel-lookup-foreclosure-sales.ktr" >> logs/cron.log 2>&1
