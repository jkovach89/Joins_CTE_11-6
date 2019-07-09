SELECT
	t.start_date,
	t.duration,
	t.zip_code,
	w.date,
	w.events,
	w.ZIP
FROM
	trips t
JOIN
	weather w
ON
	(substring(t.start_date from 1 for 10) = w.date and t.zip_code = w.ZIP)
WHERE
	w.events LIKE 'Rain'
ORDER BY t.duration DESC

	