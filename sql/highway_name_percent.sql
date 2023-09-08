WITH RECURSIVE indice AS (
  SELECT osm_umbria_admin.osm_id id, osm_umbria_admin.highway_tocheck_count hwck, osm_umbria_admin.way border
  FROM osm_umbria_admin
  WHERE osm_umbria_admin.index > 0
    AND osm_umbria_admin.index < 96)
  UPDATE osm_umbria_admin SET highway_name_percent = (100 -
    (SELECT COUNT(highway)
     FROM planet_osm_line, indice
     WHERE
       highway IN ('motorway','trunk','primary','secondary','tertiary','residential','pedestrian') AND
       name IS NULL AND
       ST_Intersects(way, indice.border) AND
       (osm_umbria_admin.osm_id = indice.id))::REAL  / 
       (SELECT hwck FROM indice
        WHERE (osm_umbria_admin.osm_id = indice.id))::REAL * (100::REAL));
        
/* Calcolo percentuale strade senza nome per ogni divisione amministrativa in Umbria, risultato in osm_umbria_admin. ∼ 13s */

