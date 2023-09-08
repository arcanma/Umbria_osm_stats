WITH umbria_osm_geom_union AS (
  SELECT osm_id,admin_level, name, st_multi(st_union(way)) as singlegeom
   FROM planet_osm_polygon
   GROUP BY osm_id, admin_level,name)
  UPDATE osm_umbria_admin SET 
    osm_id = umbria_osm_geom_union.osm_id,
    way = umbria_osm_geom_union.singlegeom,
    highway_tocheck_count = DEFAULT,
    highway_name_percent = DEFAULT,
    highway_lenght = DEFAULT,
    buildings_count = DEFAULT,
    amenity_count = DEFAULT,
    shop_count = DEFAULT,
    leisure_count = DEFAULT,
    landuse_count = DEFAULT,
    civici_count = DEFAULT
  FROM umbria_osm_geom_union
    WHERE (osm_umbria_admin.admin_level = umbria_osm_geom_union.admin_level)
    AND (osm_umbria_admin.name = umbria_osm_geom_union.name);

/* Reset della table osm_umbria_admin ai valori di default (vuoto) per le colonne con dati oggetto di statistica periodica
   e refresh osm_id e way */
