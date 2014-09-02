
Requirements
```
jq - json parser
pentaho data integration (aka kettle)
```

```
$ cp .env.kitchen.sample .env.kitchen
$ cp .env.ckan.sample .env.ckan
Update env vars
```

Cron to run job

```
#!/bin/sh

cd ~/pentaho-transformations && . ~/pentaho-transformations/.env.kitchen && ~/pdi/data-integration/kitchen.sh -level=Basic -file "post-file-to-ckan.ktr.kjb" >> /home/erik/logs/cron.log
```
