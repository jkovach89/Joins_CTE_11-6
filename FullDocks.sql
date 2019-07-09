SELECT
	s.name,
	n.docks_available,
	COUNT(*) as times_full
FROM
	stations s
JOIN
	status n
ON
	n.station_id = s.station_id
WHERE
	n.docks_available=0
GROUP BY 1,2;