### Preqrequisites

* Account on [civicdata.com](http://www.civicdata.com) that is a member of the [Lexington group](http://www.civicdata.com/en/organization/members/lexington-ky).

### Add dataset

* [Step 1](http://www.civicdata.com/en/dataset/new?group=cfa5553f-c91e-49bc-b10e-34288f23a60b): Create dataset
	* Title: Lexington <dataset>. An example would be 'Lexington Code Enforcement Complaints'
	* Add a description
	* Add license: 'Open Data Commons Public Domain Dedication and Licence (PDDL)'
	* Visibility: public
* Step 2: Add specific data resource to the dataset
	* Link to file: http://www.civicdata.com/datastore/dump/fix-this-momentarily.
	* Add title, description
	* Format: will be `csv` for tabular data
* Step 3
	* Add dataset metadata

* Custom Step 4
	* At this point we've created a CKAN resource. Visit that resource and find the resource id. It's in the url like so: `http://www.civicdata.com/en/dataset/lexington-code-enforcement-complaints/resource/<resource-id>`
	* For the example code enforcement dataset it ends up being `ad346da7-ce88-4c77-a0e1-10ff09bb0622`
	* Edit the resource and in the `link to file` input, change the value to `http://www.civicdata.com/datastore/dump/<resource-id>`
	* This is the url that will appear on the resource page that links to the full csv dump of the dataset.


### Configure datastore for newly created resource

* https://github.com/lfucg/ckan-datapackages

### Now the resource is ready to be automatically upserted to the transformation!

### Debugging tips

* It can be difficult to understand why/how/when requests to civicdata are failing. 
* An API Traffic Inspector called [runscope](https://www.runscope.com/) records HTTP requests and responses so that you can view, compare, and replay them. 
* An HTTP request goes through runscope like so: Pentaho -> Runscope -> civicdata -> Runscope -> Pentaho
* It's highly recommended!
