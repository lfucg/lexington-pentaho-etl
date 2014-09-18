#!/bin/bash

# meant to be run from a cronjob on server
cd ~/pentaho-transformations && source ~/pentaho-transformations/.env.pentaho && ~/data-integration/pan.sh -level=Basic -file "pull-last-day-of-code-enforcement.ktr" >> logs/cron.log
cd ~/pentaho-transformations && source ~/pentaho-transformations/.env.pentaho && ~/data-integration/pan.sh -level=Basic -file "pull-last-day-of-building-permits.ktr" >> logs/cron.log
