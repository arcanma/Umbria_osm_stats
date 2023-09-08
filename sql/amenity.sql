WITH RECURSIVE indice AS (
  SELECT osm_umbria_admin.osm_id id, osm_umbria_admin.way border
  FROM osm_umbria_admin
  WHERE osm_umbria_admin.index > 0
    AND osm_umbria_admin.index < 96)
  UPDATE osm_umbria_admin SET amenity_count = 
    (SELECT COUNT (*)
    FROM
      (SELECT (amenity)
      FROM planet_osm_point node, indice
      WHERE amenity IS NOT NULL AND
      (osm_umbria_admin.osm_id = indice.id) AND
      ST_Intersects(node.way, indice.border)
    UNION ALL
      SELECT (amenity)
      FROM planet_osm_polygon poly, indice
      WHERE amenity IS NOT NULL AND
      (osm_umbria_admin.osm_id = indice.id) AND
      ST_Intersects(poly.way, indice.border)) AS amenity);

/* Conteggio elementi con tag amenity=* in Umbria, suddivisi per comune, risultato in osm_umbria_admin. ∼ 11s */

