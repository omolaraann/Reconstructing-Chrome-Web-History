-- SBT-DF204 Case Study 2
-- Chronological Chrome visit timeline
-- Chrome timestamps are converted from WebKit microseconds to UTC.

.headers on
.mode csv

SELECT
    v.id AS visit_id,
    datetime(v.visit_time/1000000 - 11644473600, 'unixepoch') AS visit_time_utc,
    u.id AS url_id,
    u.title AS page_title,
    u.visit_count,
    v.from_visit,
    v.transition,
    v.visit_duration
FROM visits AS v
JOIN urls AS u ON u.id = v.url
ORDER BY v.visit_time, v.id;
