### Requirements

* Pentaho Data Integration [5.1.0 stable](http://sourceforge.net/projects/pentaho/files/Data%20Integration/5.1/pdi-ce-5.1.0.0-752.zip/download)
* Java 1.6+
* git ([Windows install instructions](http://www.google.com/url?q=http%3A%2F%2Fmsysgit.github.io%2F&sa=D&sntz=1&usg=AFQjCNH_WuJHsz90vgCYyjsBf4Jy_hYSfA))

### Installation and configuration

In the git terminal (todo, translate these instructions to Windows):

```
git clone https://github.com/eeeschwartz/pentaho-etl
cd pentaho-etl
cp ~/Downloads/pdi-ce-5.1.0.0-752.zip .
unzip pdi-ce-5.1.0.0-752.zip
mv data-integration data-integration-5.1.0
rm pdi-ce-5.1.0.0-752.zip
```

Create a symlink to the current version of data-integration. This allows you to test new versions of Pentaho Data Integration when the are released. Once the new version is proven, you can symlink to it in production.

```
ln -s data-integration-5.1.0 data-integration
```

Open the graphical editor for Pentaho Data Integration called spoon.

```
cd data-integration
./spoon.sh
```

### Set environment variables for Pentaho Data Integration

Once spoon launches, selected Edit > Edit the kettle.properties file:

Right-click to insert new lines for each:

```
CODE_ENFORCEMENT_DB <lfucg code enforcement db name>
BUILDING_PERMITS_DB <lfucg code enforcement db name>
DB_USER <lfucg db user>
DB_PASSWORD <lfucg db pass>
DB_HOST <lfucg db host>
DB_PORT <lfucg db port>
DB_DOMAIN <lfucg domain>
PROXY_HOST <my.proxy>
PROXY_PORT <8080>
GEOCODER_HOST <streetscope.net>
GEOCODER_PORT <80>
CKAN_BASE_URL <http://my-open-data-portal.com	>
CKAN_API_KEY <something like: 120398jl-sdlf-2123-23sf-kfj9ujfd8>
```

### Test the install

* In spoon, File > Open: "pull-last-day-of-code-enforcement.ktr"
* Click the play button in the transformation. If the configuration works then each step in the transformation shows a green checkmark to indicate success.

### Debugging

* To start it's good to idea to try the DB connection.
	* Double click on `Last Days Code Enforcement`
	* Connection > Edit > `Test` will give you feedback
* In the transformation launch dialogue set the Log level to 'Rowlevel (very detailed)'

### Credits

Big hat tip to Tom Schenk, Jr and the City of Chicago Data folks whose [work](https://github.com/Chicago/open-data-etl-utility-kit) this borrows from liberally.
