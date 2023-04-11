ALTER TABLE kerley_st
	ALTER COLUMN geom TYPE geometry(MULTIPOLYGON, 26912) 
		USING ST_Transform(ST_SetSRID(geom, 2868), 26912); 

SELECT ST_SRID(geom)
FROM kerley_st; 