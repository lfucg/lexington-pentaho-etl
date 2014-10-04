### Requirements

* Pentaho Data Integration [5.1.0 stable](http://sourceforge.net/projects/pentaho/files/Data%20Integration/5.1/pdi-ce-5.1.0.0-752.zip/download)
* Java 1.6+
* git ([Windows install instructions](http://www.google.com/url?q=http%3A%2F%2Fmsysgit.github.io%2F&sa=D&sntz=1&usg=AFQjCNH_WuJHsz90vgCYyjsBf4Jy_hYSfA))

### Installation and configuration

In the git terminal (todo, translate these instructions to Windows):

```
git clone https://github.com/codeforamerica/lexington-pentaho-etl
cd lexington-pentaho-etl
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
CODE_ENFORCEMENT_DB=
BUILDING_PERMITS_DB=
DB_USER=
DB_PASSWORD=
DB_HOST=foo.bar.com
DB_PORT=
DB_DOMAIN=
GEOCODER_HOST=localhost
GEOCODER_PORT=
CKAN_BASE_URL=http://data.foo.com
CKAN_API_KEY=
```

### Test the install

In spoon, open a transformation: "pull-last-day-of-code-enforcement.ktr". Click the play button in the transformation. If the configuration works then each step in the transformation shows a green checkmark to indicate success.

### Credits

Big hat tip to Tom Schenk, Jr and the City of Chicago Data folks whose [work](https://github.com/Chicago/open-data-etl-utility-kit) this borrows from liberally.
