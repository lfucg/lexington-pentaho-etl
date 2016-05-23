/*Building Inspection Complaints*/

SELECT
ID,
ParcelID as ParID,
Date,
Addr as 'Address', 
CASE
WHEN ProbSmry LIKE '%busi%' THEN 'ILLEGAL BUSINESS'
WHEN ProbSmry LIKE '%permit%' OR ProbSmry LIKE '%working%' OR ProbSmry LIKE '%remodel%' THEN 'NO PERMIT'
WHEN ProbSmry LIKE '%occupancy%' THEN 'OCCUPANCY ISSUE'
WHEN ProbSmry LIKE '%sign%' THEN 'SIGNAGE'
WHEN ProbSmry LIKE '%paving%' OR ProbSmry LIKE '%asphalt%' THEN 'PAVING'
WHEN ProbSmry LIKE '%gravel%' THEN 'GRAVEL'
WHEN ProbSmry LIKE '%zoning%' THEN 'ZONING'
WHEN ProbSmry LIKE '%park%' THEN 'PARKING'
WHEN ProbSmry LIKE '%vehicle Repair%' THEN 'VEHICLE REPAIR'
WHEN ProbSmry LIKE '%sight%' OR ProbSmry LIKE '%site%' THEN 'SIGHT DISTANCE ISSUE'
ELSE 'OTHER'
END AS 'ComplaintType',
Status,
DateModified
FROM 
Complaints
WHERE Date >= '2011-1-1' and Date <= GetDate()
