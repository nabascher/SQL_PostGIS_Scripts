DROP TABLE IF EXISTS qlayer; 

SELECT 
	trlabel AS Township_Range,
	sectn AS Section,
	blm_sections.geom,
	ST_Area(us_191.geom) / 4047 AS Acreage,
	firm_pan AS FIRM_Map_Number
INTO qlayer
FROM blm_sections
JOIN us_191
	ON ST_intersects(us_191.geom, blm_sections.geom)
JOIN firm_map_num
	ON ST_intersects(us_191.geom, firm_map_num.geom);

/* Run this with the TRS database to get a table with the TRS for arizona projects 
   Also will compute the acreage of the area and the FEMA firm map numbers */

SELECT * FROM qlayer; 