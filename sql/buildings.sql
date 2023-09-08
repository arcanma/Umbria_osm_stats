WITH RECURSIVE indice AS (
  SELECT osm_umbria_admin.osm_id id, osm_umbria_admin.way border
  FROM osm_umbria_admin
  WHERE osm_umbria_admin.index > 0
    AND osm_umbria_admin.index < 96)
  UPDATE osm_umbria_admin SET buildings_count = 
  (SELECT COUNT (building)
    FROM planet_osm_polygon, indice
    WHERE 
    (osm_umbria_admin.osm_id = indice.id) AND
    planet_osm_polygon.building IS NOT NULL AND
    ST_Intersects(planet_osm_polygon.way, indice.border));

/* Conteggio poligoni con tag buildings=* per ogni divisione amministrativa in Umbria, risultato in osm_umbria_admin. */
