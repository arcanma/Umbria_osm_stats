WITH RECURSIVE indice AS (
  SELECT osm_umbria_admin.osm_id id, osm_umbria_admin.way border
  FROM osm_umbria_admin
  WHERE osm_umbria_admin.index > 0
    AND osm_umbria_admin.index < 96)
  UPDATE osm_umbria_admin SET civici_count = 
    (SELECT COUNT (*)
    FROM
      (SELECT ("addr:housenumber")
      FROM planet_osm_point node, indice
      WHERE "addr:housenumber" IS NOT NULL AND
      (osm_umbria_admin.osm_id = indice.id) AND
      ST_Intersects(node.way, indice.border)
    UNION ALL
      SELECT ("addr:housenumber")
      FROM planet_osm_polygon poly, indice
      WHERE "addr:housenumber" IS NOT NULL AND
      (osm_umbria_admin.osm_id = indice.id) AND
      ST_Intersects(poly.way, indice.border)) AS civici);

/* Conteggio elementi con tag addr:housenumber=* in Umbria, suddivisi per comune, risultato in osm_umbria_admin. ∼ 20s */

