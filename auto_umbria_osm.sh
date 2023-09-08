#!/bin/bash

# Script per l'esecuzione automatica del download file Umbria, conversione con osm2pgsql, delle query su dbase postgreSQL gis e output su file csv
date +"%m/%d/%Y %H:%M:%S" >> auto_umbria.log
echo "*** Starting download file Umbria.pbf......" >> auto_umbria.log

wget -q http://download.openstreetmap.fr/extracts/europe/italy/umbria-latest.osm.pbf
echo "*** file Umbria.pbf downloaded" >> auto_umbria.log
date +"%m/%d/%Y %H:%M:%S" >> auto_umbria.log
echo "*** Importing data into postgreSQL dbase gis" >> auto_umbria.log

osm2pgsql -d gis -S /usr/share/osm2pgsql/default.style -G -U marcello -l --number-processes 4 umbria-latest.osm.pbf
echo "*** Data imported" >> auto_umbria.log

date +"%m/%d/%Y %H:%M:%S" >> auto_umbria.log
echo "*** Starting the elaborations for statistics" >> auto_umbria.log

psql -d gis -U marcello -f query_list >> auto_umbria.log
echo "*** ALL DONE!!! ***" >> auto_umbria.log
echo "*******************" >> auto_umbria.log

