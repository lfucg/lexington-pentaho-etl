
Requirements

```
jq - json parser
pentaho data integration (aka kettle)
```

```
$ cp .env.pentaho.sample .env.pentaho
Update env vars
```

Cron to run job

```
#!/bin/sh

cd ~/pentaho-transformations && . ~/pentaho-transformations/.env.kitchen && ~/pdi/data-integration/kitchen.sh -level=Basic -file "post-file-to-ckan.ktr.kjb" >> /home/erik/logs/cron.log
```

Update pan to read OPTS!

vim ~/pdi/data-integration/pan.sh
update OPT to interpolate OPT from the environment

```
OPT="$OPT.. "
```

### Set up geocoding transformation


```
#!/bin/bash

cd ~/pentaho-transformations && source ~/pentaho-transformations/.env.pentaho && ~/pdi/data-integration/pan.sh -level=Rowlevel -file "geocode-code-enforcement.ktr" >> /home/erik/logs/cron.log
```