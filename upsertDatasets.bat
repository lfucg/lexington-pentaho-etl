cd C:\projects\lexington-pentaho-etl\
call git pull origin master

cd data-integration
call Pan.bat -level=Basic -file "../pull-last-day-of-foreclosure-sales.ktr" 
call Pan.bat -level=Basic -file "../parcel-lookup-foreclosure-sales.ktr" 
