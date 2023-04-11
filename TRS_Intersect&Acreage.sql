DROP TABLE qlayer; 

SELECT 
	trlabel AS Township_Range,
	sectn AS Section,
	blm_sections.geom,
	ST_Area(kerley_st.geom) / 4047 AS acreage
INTO qlayer
FROM blm_sections
JOIN kerley_st
ON ST_intersects(kerley_st.geom, blm_sections.geom); 

/* Run this with the TRS database to get a table with the TRS for arizona projects 
   Also will compute the acreage of the area */

SELECT * FROM qlayer; 