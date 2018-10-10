SELECT 
  patron_view.record_num AS "Patron Record", 
  CONCAT (patron_record_fullname.first_name, ' ', patron_record_fullname.middle_name, ' ', patron_record_fullname.last_name) AS "Patron Name",
  TO_CHAR(fine.assessed_gmt, 'MM/DD/YYYY') AS "Fine Assessed",
  fine.charge_location_code AS "Location Code", 
  fine.title AS "Title"
  
FROM 
  sierra_view.fine
INNER JOIN sierra_view.patron_view
ON  patron_view.id = fine.patron_record_id
INNER JOIN sierra_view.patron_record_fullname
ON patron_record_fullname.patron_record_id = patron_view.id

WHERE 
--Replace "abc" below with three-letter code of owning library
  fine.charge_location_code LIKE 'abc%' AND
--Replace "title words" below with portion of title you want to match on
  LOWER (fine.title) LIKE '%title words%'; --normalizes field, treats everything as lowercase


  