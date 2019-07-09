WITH
	longesttrip
AS (
	SELECT
		substring(start_date FROM 1 FOR 10) as date,
		MAX(duration) as max_length_trip
	FROM
		trips
	GROUP BY 1
)

SELECT
	lt.max_length_trip,
	lt.date,
	w.events
FROM
	longesttrip lt
JOIN
	weather w
ON
	lt.date = w.date
WHERE
	w.events LIKE 'Rain'