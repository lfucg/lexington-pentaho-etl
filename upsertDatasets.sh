#!/bin/bash

# meant to be run from a cronjob on server
cd ~/pentaho-transformations && ~/data-integration/pan.sh -level=Basic -file "pull-last-day-of-code-enforcement.ktr" >> logs/cron.log 2>&1
cd ~/pentaho-transformations && ~/data-integration/pan.sh -level=Basic -file "pull-last-day-of-building-permits.ktr" >> logs/cron.log 2>&1
cd ~/pentaho-transformations && ~/data-integration/pan.sh -level=Basic -file "pull-last-day-of-foreclosure-sales" >> logs/cron.log 2>&1
