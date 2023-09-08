WITH RECURSIVE indice AS (
  SELECT osm_umbria_admin.osm_id id, osm_umbria_admin.way border
  FROM osm_umbria_admin
  WHERE osm_umbria_admin.index > 0
    AND osm_umbria_admin.index < 96)
  UPDATE osm_umbria_admin SET highway_lenght =
     (SELECT
        round(SUM(
        ST_Length(ST_Transform(ST_Intersection(planet_osm_line.way, border),4326)::geography)))
     FROM planet_osm_line, indice
     WHERE highway IS NOT NULL AND
     (osm_umbria_admin.osm_id = indice.id));
     
/* Calcolo highway lenght per ogni divisione amministrativa in Umbria, risultato in osm_umbria_admin. ∼ 5024s */     
