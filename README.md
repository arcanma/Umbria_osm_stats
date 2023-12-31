## Statistics on OpenStreetMap data for Umbria region
All files needed to produce the stats present on site https://wiki.openstreetmap.org/wiki/Umbria_Stato and related subpages, results are managed by LibreOffice Calc to add some statistical elaboration and produce output that can be easily incorporated into wiki pages.

## Author
Marcello Arcangeli (arcanma@gmail.com)

## License
All files are released into the Creative Commons CC0 1.0 Universal. <br>
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Prerequisites
<a href="https://www.postgresql.org/">PostgreSQL </a> with <a href="https://postgis.net/"> PostGIS extension </a>, added user "marcello" and created database named "gis" <br>
<a href="https://osm2pgsql.org/">Osm2pgsql</a> conversion software installed <br>
If you changed the user name or db name in PostgreSQL you have to replace it in auto_umbria_osm.sh script

## Files list and explanation

<strong>-README.md</strong> <br>
 This file

<strong>-auto_umbria_osm.sh</strong>	 <br>
﻿Main shell script, this script launch all operations, from data download to statistics export on .csv files, all log messages are saved in auto_umbria.log file for troubleshooting if needed

<strong>-query_list</strong>  <br>
 List of queries passed to psql for execution

<b>/sql</b>

    -OSM_Umbria_admin_update.sql
     Query for table statistics initialization
  
    -highway_type_umbria.sql
     Query to compute the highway lenght in Umbria divided by highway type, result in highway_type_Umbria.csv file
  
    -highway_type_pg.sql
     Query to compute the highway lenght in Perugia province divided by highway type, result in highway_type_PG.csv file
  
    -highway_type_tr.sql
     Query to compute the highway lenght in Terni province divided by highway type, result in highway_type_TR.csv file
  
    -highway_lenght_by_amm.sql
     Query to compute the highway lenght for each municipality in Umbria
  
    -highway_tocheck_count.sql
     Query to compute number of highways where the name should be set, based on highway classification, for each municipality in Umbria
  
    -highway_name_percent.sql
     Query to compute the percentage of highways where the name should be set but is not set for each municipality in Umbria
  
    -buildings.sql
     Query to compute number of buildings for each municipality in Umbria
  
    -civici.sql
     Query to compute number of addr:housenumber for each municipality in Umbria
  
    -amenity.sql
     Query to compute number of amenities for each municipality in Umbria
  
    -shop.sql
     Query to compute number of shops for each municipality in Umbria
  
    -leisure.sql
     Query to compute number of leisures for each municipality in Umbria
  
    -landuse.sql
     Query to compute number of landuses for each municipality in Umbria
 
    -Umbria_export_dati.sql
     Query to export data computed on Umbria_export.csv file
