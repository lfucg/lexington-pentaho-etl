cd C:\projects\lexington-pentaho-etl\
call git pull origin master
:: set KETTLE_HOME="C:\projects\lexington-pentaho-etl\.kettle\"
call data-integration\Pan.bat -level=Basic -file "pull-last-day-of-foreclosure-sales.ktr" 
