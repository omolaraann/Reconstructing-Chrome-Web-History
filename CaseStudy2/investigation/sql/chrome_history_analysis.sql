-- SBT-DF204 Case Study 2
-- Chrome History database examination
-- Run against a verified working copy in read-only mode.

SELECT 'DATABASE TABLES' AS section;
SELECT name AS table_name
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;

SELECT 'DATABASE RECORD COUNTS' AS section;
SELECT 'urls' AS table_name, COUNT(*) AS records FROM urls
UNION ALL
SELECT 'visits', COUNT(*) FROM visits
UNION ALL
SELECT 'keyword_search_terms', COUNT(*) FROM keyword_search_terms
UNION ALL
SELECT 'downloads', COUNT(*) FROM downloads
UNION ALL
SELECT 'downloads_url_chains', COUNT(*) FROM downloads_url_chains;

SELECT 'VISIT TIME RANGE UTC' AS section;
SELECT
  datetime(MIN(visit_time)/1000000 - 11644473600, 'unixepoch') AS earliest_visit_utc,
  datetime(MAX(visit_time)/1000000 - 11644473600, 'unixepoch') AS latest_visit_utc
FROM visits;

SELECT 'RECORDED SEARCH TERMS' AS section;
SELECT keyword_id, url_id, term, normalized_term
FROM keyword_search_terms
ORDER BY keyword_id, url_id;

SELECT 'RECORDED DOWNLOAD DETAILS' AS section;
SELECT
  id AS download_id,
  datetime(start_time/1000000 - 11644473600, 'unixepoch') AS start_time_utc,
  datetime(end_time/1000000 - 11644473600, 'unixepoch') AS end_time_utc,
  received_bytes,
  total_bytes,
  state,
  danger_type,
  interrupt_reason,
  mime_type,
  original_mime_type,
  opened,
  referrer,
  site_url,
  tab_url,
  http_method
FROM downloads
ORDER BY start_time;

SELECT 'DOWNLOAD URL CHAIN' AS section;
SELECT id, chain_index, url
FROM downloads_url_chains
ORDER BY id, chain_index;

SELECT 'CRYPTOCURRENCY-RELATED URL RECORDS' AS section;
SELECT id, title, visit_count,
       datetime(last_visit_time/1000000 - 11644473600, 'unixepoch') AS last_visit_utc,
       CASE
         WHEN url LIKE '%517b2156914944339a96137ad8978408ea52b2fc144c98d3b0b16b21888afdc5%'
           THEN '[URL CONTAINS RECORDED TRANSACTION IDENTIFIER]'
         WHEN url LIKE '%38RcsURWCDmCbYocmsZCnGz1FtD7x477mt%'
           THEN '[URL CONTAINS RECORDED ADDRESS]'
         ELSE url
       END AS url_or_indicator
FROM urls
WHERE lower(url) LIKE '%blockchain.com%'
   OR lower(url) LIKE '%kraken%'
   OR lower(url) LIKE '%mempool.space%'
   OR url LIKE '%517b2156914944339a96137ad8978408ea52b2fc144c98d3b0b16b21888afdc5%'
   OR url LIKE '%38RcsURWCDmCbYocmsZCnGz1FtD7x477mt%'
ORDER BY last_visit_time, id;

SELECT 'CRYPTOCURRENCY-RELATED VISIT SEQUENCE UTC' AS section;
SELECT
  v.id AS visit_id,
  datetime(v.visit_time/1000000 - 11644473600, 'unixepoch') AS visit_time_utc,
  v.url AS url_id,
  u.title
FROM visits v
JOIN urls u ON u.id = v.url
WHERE lower(u.url) LIKE '%blockchain.com%'
   OR lower(u.url) LIKE '%kraken%'
   OR lower(u.url) LIKE '%mempool.space%'
   OR u.url LIKE '%517b2156914944339a96137ad8978408ea52b2fc144c98d3b0b16b21888afdc5%'
   OR u.url LIKE '%38RcsURWCDmCbYocmsZCnGz1FtD7x477mt%'
ORDER BY v.visit_time, v.id;

SELECT 'DATABASE METADATA' AS section;
SELECT key, value
FROM meta
ORDER BY key;

SELECT 'VISIT SOURCE RECORD COUNT' AS section;
SELECT COUNT(*) AS visit_source_records FROM visit_source;

SELECT 'DATABASE INTEGRITY CHECK' AS section;
PRAGMA integrity_check;
