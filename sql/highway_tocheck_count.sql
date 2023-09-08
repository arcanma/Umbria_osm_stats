WITH RECURSIVE indice AS (
  SELECT osm_umbria_admin.osm_id id, osm_umbria_admin.way border
  FROM osm_umbria_admin
  WHERE osm_umbria_admin.index > 0
    AND osm_umbria_admin.index < 96)
  UPDATE osm_umbria_admin SET highway_tocheck_count =
    (SELECT COUNT(highway)
      FROM planet_osm_line, indice
      WHERE 
	highway IN ('roundabout','motorway','trunk','primary','secondary','tertiary','residential','pedestrian') AND
        ST_Intersects(way, indice.border) AND
	osm_umbria_admin.osm_id = indice.id);

/* Numero highway che dovrebbero avere il nome assegnato per ogni divisione amministrativa in Umbria, risultato in osm_umbria_admin. ∼ 334s */

