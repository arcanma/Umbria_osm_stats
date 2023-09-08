SELECT
    round(SUM(
      ST_Length(ST_Transform(
        ST_Intersection(way, (SELECT way FROM osm_umbria_admin WHERE osm_id=-42106)),4326)::geography)))
        AS "distance (meters)", highway AS "highway type"
  FROM planet_osm_line
  WHERE highway IS NOT NULL
  GROUP BY highway
  ORDER BY "highway type" DESC
  LIMIT 35;

/* Strade x Tipo provincia Perugia */
