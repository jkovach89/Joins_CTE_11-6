WITH
	dockcount
AS(
	SELECT
		s.station_id,
		MAX(s.bikes_available + s.docks_available) as dock_count
	FROM
		status s
	GROUP BY 1
)

SELECT
	d.dock_count,
	n.name,
	t.start_station,
	COUNT(*) as trips_starting
FROM
	dockcount d
JOIN
	stations n
ON
	d.station_id = n.station_id
JOIN
	trips t
ON
	n.name = t.start_station
GROUP BY 1,2,3
ORDER BY dock_count DESC;