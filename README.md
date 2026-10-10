# 🔍 Reconstructing Chrome Web History

**Investigation Type:** Browser Forensics and Web Activity Reconstruction  
**Primary Evidence:** Google Chrome History Database  
**Database Format:** SQLite  
**Analysis Environment:** Kali Linux  
**Repository:** [Reconstructing-Chrome-Web-History](https://github.com/omolaraann/Reconstructing-Chrome-Web-History)

---

## 📑 Table of Contents

📌 [Project Overview](#1-project-overview)
🎯 [Purpose of the Assignment](#2-purpose-of-the-assignment)
🧭 [Objectives of the Investigation](#3-objectives-of-the-investigation)
🧰 [Tools and Resources Used](#4-tools-and-resources-used)
📂 [Repository Structure](#5-repository-structure)
🔬 [Investigation Methodology](#6-investigation-methodology)
🔐 [Evidence Acquisition and Integrity Verification](#7-evidence-acquisition-and-integrity-verification)
🗃️ [Database Schema Examination](#8-database-schema-examination)
💻 [SQL Analysis and Artefact Extraction](#9-sql-analysis-and-artefact-extraction)
🔎 [Key Findings](#10-key-findings)
🕒 [Timeline Reconstruction](#11-timeline-reconstruction)
⚖️ [Evidence Interpretation and Limitations](#12-evidence-interpretation-and-limitations)
🔄 [Reproducibility](#13-reproducibility)
📸 [Screenshots and Visual Documentation](#14-screenshots-and-visual-documentation)
✅ [Conclusion](#15-conclusion)
👤 [Author and Repository](#16-author-and-repository)

---

## 1. Project Overview

This project documents a digital forensic investigation involving the examination and reconstruction of web browsing activity from a Google Chrome History database.

The investigation was conducted as part of SBT-DF204 Case Study 2, with a focus on identifying browser artefacts, examining recorded website visits, extracting search terms and download information, and reconstructing a chronological sequence of recorded browsing activity.

The Chrome History database is a SQLite database that maintains records associated with browser activity. Depending on the available records, it can contain information about visited URLs, page titles, visit timestamps, search terms, downloads, and relationships between browsing events.

Using Kali Linux, SQLite3, SQL queries, and Linux command-line utilities, the investigation examined the available database records and generated structured outputs for further analysis.

The project also applied evidence integrity verification techniques to confirm that the original database and the working copy were identical before analysis.

The resulting artefacts, SQL scripts, query outputs, and investigative notes are organised in this repository to support transparency, reproducibility, and technical review.

## 2. Purpose of the Assignment

The purpose of this assignment was to demonstrate the application of digital forensic techniques to browser history evidence and establish how recorded browser artefacts can support the reconstruction of web activity.

The exercise provided practical experience in evidence preservation, database examination, SQL-based artefact extraction, timestamp analysis, timeline reconstruction, and forensic documentation.

It also emphasised the importance of maintaining evidence integrity and interpreting digital artefacts objectively. Browser history can provide useful investigative leads, but conclusions must remain within the limits of what the available evidence establishes.

## 3. Objectives of the Investigation

The investigation was guided by the following objectives:

1. Preserve the supplied Chrome History database and maintain a separate working copy.
2. Verify evidence integrity using SHA-256 hashing and byte-for-byte comparison.
3. Examine the SQLite database schema and identify tables relevant to browser activity.
4. Extract URL records, visit events, search terms, download records, and relevant metadata.
5. Reconstruct a chronological timeline of recorded browsing activity.
6. Identify potentially relevant relationships among visited websites, page titles, search terms, and download records.
7. Export query results into structured text and CSV formats.
8. Document the investigation process, evidence integrity checks, database structure, and key findings.
9. Maintain sufficient investigative detail to enable another examiner to reproduce the analysis.
10. Distinguish observed browser artefacts from conclusions requiring additional corroborating evidence.

## 4. Tools and Resources Used

| S/N | Tool or Resource | Purpose |
|---:|---|---|
| 1 | Kali Linux | Provided the forensic working environment for evidence management, database examination, and analysis. |
| 2 | SQLite3 | Used to inspect the Chrome History database, execute queries, and perform a database integrity check. |
| 3 | SQL | Used to extract browsing records, search terms, download information, metadata, and visit timelines. |
| 4 | SHA-256 | Used to calculate cryptographic hashes for evidence integrity verification. |
| 5 | `sha256sum` | Generated SHA-256 hashes of the original and working database files. |
| 6 | `cmp` | Performed a byte-for-byte comparison of the two database copies. |
| 7 | `stat` and `file` | Collected file metadata and identified the evidence file format. |
| 8 | `find` and `tee` | Supported file inventory, directory inspection, and evidence logging. |
| 9 | CSV and text files | Preserved extracted query results, the visit timeline, schema information, and investigative findings. |
| 10 | Git | Tracked changes to the project and maintained version history. |
| 11 | GitHub | Hosted the investigation artefacts, SQL scripts, query outputs, and documentation. |
| 12 | Chrome History database | Served as the primary evidence source for reconstructing recorded browser activity. |

## 5. Repository Structure

The repository is organised to separate the evidence database from the analytical scripts, extracted results, and investigative notes.

```text
Reconstructing-Chrome-Web-History/
│
├── README.md
│
├── evidence/
│   ├── original/
│   │   └── History
│   │
│   └── working/
│       └── History
│
└── investigation/
    ├── notes/
    │   ├── database-schema.txt
    │   ├── evidence-integrity-log.txt
    │   └── key-findings.txt
    │
    ├── query-results/
    │   ├── chrome_history_analysis.txt
    │   └── full_visit_timeline.csv
    │
    └── sql/
        ├── chrome_history_analysis.sql
        └── full_visit_timeline.sql
```

### Directory descriptions

| Directory | Description |
|---|---|
| `evidence/original/` | Contains the preserved original Chrome History database. |
| `evidence/working/` | Contains the working copy used for database analysis. |
| `investigation/notes/` | Contains the database schema notes, evidence integrity log, and summary of key findings. |
| `investigation/query-results/` | Contains the saved output of the SQL analysis and the full visit timeline in CSV format. |
| `investigation/sql/` | Contains the SQL scripts used to extract and analyse browser artefacts. |

The original evidence is kept separate from the working copy to support evidence preservation and repeatable analysis.

## 6. Investigation Methodology

The investigation followed a structured workflow designed to maintain evidence integrity and support reproducible analysis.

### 6.1 Evidence preparation

The Chrome History database was organised into separate original and working evidence directories. This arrangement supported controlled analysis while preserving an unchanged reference copy.

### 6.2 Integrity verification

SHA-256 hashes were generated for both database files. A byte-for-byte comparison was then performed to confirm that the copies were identical. SQLite's integrity-check command was also executed against the working database.

### 6.3 Database schema examination

The database structure was examined to identify the tables, fields, and relationships relevant to browser history reconstruction. Particular attention was given to URL records, visit events, search terms, downloads, and metadata.

### 6.4 SQL-based artefact extraction

SQL queries were used to retrieve relevant records, count database entries, examine timestamps, identify download activity, and extract potentially relevant browsing events.

### 6.5 Timeline reconstruction

Visit records were arranged chronologically using the available timestamps. This produced a structured timeline of recorded browsing activity during the period represented in the database.

### 6.6 Correlation and interpretation

Related website records, page titles, search terms, and download metadata were examined for potentially meaningful associations. Interpretations were restricted to what the database records could support.

### 6.7 Documentation and preservation

SQL scripts, query outputs, schema notes, findings, and integrity verification results were saved in the investigation directory. Git and GitHub were used to maintain and publish the project artefacts.

## 7. Evidence Acquisition and Integrity Verification

Evidence integrity is a fundamental requirement in digital forensics. An examiner must be able to demonstrate that the evidence analysed is consistent with the evidence acquired.

For this investigation, the original Chrome History database was preserved in `evidence/original/History`, while a separate copy was maintained in `evidence/working/History`.

### 7.1 Evidence details

| Property | Recorded result |
|---|---|
| Evidence filename | `History` |
| File format | SQLite 3 database |
| Original file size | 196,608 bytes |
| Working file size | 196,608 bytes |
| SHA-256 | `b991b0fa69662c44caf599e468c8088576ebd9cebbf46d02c89cf51bcde3fd19` |
| Original versus working copy | Byte-identical |
| SQLite integrity check | `ok` |

### 7.2 Hash verification

The following command was used to calculate the SHA-256 hashes:

```bash
sha256sum evidence/original/History \
          evidence/working/History
```

Both files produced the same SHA-256 hash:

```text
b991b0fa69662c44caf599e468c8088576ebd9cebbf46d02c89cf51bcde3fd19
```

### 7.3 Byte-for-byte comparison

The following command was used to compare the files:

```bash
cmp evidence/original/History \
    evidence/working/History
```

The comparison completed without reporting any differences. The investigation log recorded the result as a successful byte-for-byte comparison.

### 7.4 SQLite integrity check

The following command was used to check the working database:

```bash
sqlite3 -readonly evidence/working/History \
  'PRAGMA integrity_check;'
```

The database returned:

```text
ok
```

### 7.5 Integrity assessment

The matching SHA-256 hashes, successful byte-for-byte comparison, and SQLite integrity-check result indicate that the original and working copies were identical at the time of verification and that the database passed SQLite's integrity check.

These checks support the integrity of the evidence copies used in the investigation. They do not, by themselves, establish the provenance of the original database or prove that its contents are complete.

The detailed verification record is available in [`investigation/notes/evidence-integrity-log.txt`](investigation/notes/evidence-integrity-log.txt).

## 8. Database Schema Examination

The Chrome History database was examined to identify tables relevant to the reconstruction of browsing activity.

The schema examination identified tables and structures including the following:

| Table | Investigative relevance |
|---|---|
| `urls` | Stores URL-related records and associated metadata, such as page titles and visit counts. |
| `visits` | Contains individual visit records and information used to reconstruct browsing sequences. |
| `keyword_search_terms` | Contains recorded search terms associated with browser search activity. |
| `downloads` | Stores metadata associated with recorded download activity. |
| `downloads_url_chains` | Provides URL-chain information associated with download records. |
| `meta` | Contains database metadata and version-related information. |
| `visit_source` | Can contain source information associated with visit records, depending on the available data. |

The presence of a table does not necessarily mean it contains records. The analysis found zero rows in `visit_source` for this database.

The schema findings are documented in [`investigation/notes/database-schema.txt`](investigation/notes/database-schema.txt).

## 9. SQL Analysis and Artefact Extraction

SQL was used to query the database in a structured and repeatable manner.

### 9.1 Primary analysis script

The primary script is:

[`investigation/sql/chrome_history_analysis.sql`](investigation/sql/chrome_history_analysis.sql)

The script contains queries covering:

- Database table identification.
- Record counts for relevant tables.
- Recorded browsing time range.
- Search-term extraction.
- Download metadata.
- Download URL-chain information.
- Cryptocurrency-related URL records.
- Related visit sequences.
- Database metadata.
- Visit-source record counts.
- SQLite database integrity verification.

The corresponding output is available in [`investigation/query-results/chrome_history_analysis.txt`](investigation/query-results/chrome_history_analysis.txt).

### 9.2 Full visit timeline

The second script is:

[`investigation/sql/full_visit_timeline.sql`](investigation/sql/full_visit_timeline.sql)

It extracts visit records into a chronological, CSV-formatted timeline, using available fields such as:

- Visit timestamp.
- URL record identifier.
- Page title.
- Recorded visit count.
- Referring visit identifier.
- Transition information.
- Visit duration.

The resulting timeline is saved in [`investigation/query-results/full_visit_timeline.csv`](investigation/query-results/full_visit_timeline.csv).

The CSV contains 75 lines, comprising one header row and 74 visit records.

## 10. Key Findings

The database analysis produced several findings relevant to the reconstruction of browser activity.

### 10.1 Browser activity records

The database contained 57 URL records and 74 visit records.

The recorded browsing activity covered the following period:

| Property | Result |
|---|---|
| Earliest recorded visit | 19 April 2022, 13:54:18 UTC |
| Latest recorded visit | 19 April 2022, 15:02:56 UTC |
| URL records | 57 |
| Visit records | 74 |

These counts describe the records extracted from the examined database. They should not be interpreted as a complete account of every browsing action performed by a user.

### 10.2 Search-term records

Four search terms were identified:

1. `craigslist`
2. `gmail`
3. `blockchain explorer`
4. `kraken`

These records provide evidence of search terms stored in the browser database. Their presence does not independently establish the intent behind a search or identify the person who entered it.

### 10.3 Download record

One download record and one associated download URL-chain record were identified.

| Property | Recorded value |
|---|---|
| Filename | `proof_of_payment.png` |
| Recorded path | `C:\Users\FSCS_User\Desktop\proof_of_payment.png` |
| Download URL | `https://i.imgur.com/dTgrkP7.png` |
| Referrer | `https://imgur.com/` |
| Recorded tab URL | `https://imgur.com/dTgrkP7` |
| Recorded start time | 19 April 2022, 14:56:58 UTC |
| Recorded end time | 19 April 2022, 14:57:10 UTC |
| Received bytes | 33,844 |
| Total bytes | 33,844 |
| Recorded MIME type | `image/png` |

The record indicates that the browser database stored download metadata for a file named `proof_of_payment.png`.

The actual downloaded image was not found in the evidence directories examined during this investigation. The database record therefore supports the existence of the recorded download activity, but does not establish the image's contents or authenticity.

### 10.4 Cryptocurrency-related browsing activity

The investigation identified browser records associated with cryptocurrency-related services and information, including:

- Blockchain.com pages.
- A cryptocurrency address page.
- Kraken sign-in, device approval, funding, and ledger pages.
- Mempool.space.

The extracted URL records also contained a transaction identifier that appeared across related cryptocurrency browsing records.

These associations may be useful for further investigation and correlation. However, website visits do not independently prove that a cryptocurrency transaction was completed, that funds were transferred, or that a particular person controlled the associated account or address.

### 10.5 Database metadata

The analysis recorded the following metadata values:

| Metadata field | Value |
|---|---:|
| Database version | 53 |
| Last compatible version | 16 |
| `visit_source` record count | 0 |

These values describe the metadata and records observed in the examined database.

A fuller account of the extracted findings is available in [`investigation/notes/key-findings.txt`](investigation/notes/key-findings.txt).

## 11. Timeline Reconstruction

Timeline reconstruction was used to arrange recorded visit events chronologically and examine their relationships.

The visit timeline was generated from the `visits` and `urls` tables, using available timestamps and associated fields. This enabled the examiner to review recorded browsing activity in sequence and correlate relevant website visits with the wider investigation.

The resulting CSV file contains 74 visit records and can be opened with a spreadsheet application or processed using other analytical tools.

**Timeline artefact:** [`investigation/query-results/full_visit_timeline.csv`](investigation/query-results/full_visit_timeline.csv)

The timeline represents events recorded in the browser database. It should not be treated as a complete reconstruction of all system activity, nor should the recorded sequence alone be used to establish user identity or intent.

## 12. Evidence Interpretation and Limitations

Digital forensic findings must be interpreted carefully and within the limitations of the available evidence.

### 12.1 Browser history and attribution

Browser history can indicate that a browser database contains records associated with particular websites, searches, and downloads. It does not independently establish which person performed the activity.

Attribution may require additional evidence, such as operating-system artefacts, account logs, network records, device ownership information, or other corroborating material.

### 12.2 Download artefacts

The download record contains metadata associated with `proof_of_payment.png`. However, the actual image was not available in the evidence directories examined during this investigation.

Consequently, the image's contents, authenticity, and relationship to any alleged payment cannot be established from the download record alone.

### 12.3 Cryptocurrency activity

Cryptocurrency-related URLs and transaction identifiers can provide investigative leads. Nevertheless, browser records alone cannot confirm transaction completion, account ownership, control of a wallet, or the identity of a person who initiated an action.

Further corroboration would be required before reaching conclusions about financial activity or attribution.

### 12.4 Database integrity

The database passed the SQLite integrity check, and the original and working copies were byte-identical. These results support the integrity of the examined copies but do not establish that the source database was complete, unaltered before acquisition, or representative of every activity performed on the device.

### 12.5 Timestamp interpretation

The reported investigation timeline uses UTC timestamps. When correlating these records with evidence from other systems, the examiner should account for the time zones, clock settings, and timestamp formats used by each source.

These limitations were considered when documenting the findings to ensure that observations were not overstated.

## 13. Reproducibility

The repository contains the evidence database, SQL scripts, saved query outputs, and investigative notes needed to review the analysis.

### 13.1 Environment

The investigation was conducted in Kali Linux using SQLite3 and standard Linux command-line utilities.

### 13.2 Re-run the primary SQL analysis

From the repository root, execute:

```bash
sqlite3 -readonly evidence/working/History \
  < investigation/sql/chrome_history_analysis.sql
```

This executes the primary analysis script against the working copy in read-only mode.

### 13.3 Re-run the visit timeline query

To generate a separate copy of the CSV timeline without overwriting the committed result:

```bash
sqlite3 -readonly evidence/working/History \
  < investigation/sql/full_visit_timeline.sql \
  > /tmp/full_visit_timeline_reproduced.csv
```

Inspect the generated output:

```bash
head -n 10 /tmp/full_visit_timeline_reproduced.csv
```

### 13.4 Re-verify the evidence hashes

Run:

```bash
sha256sum evidence/original/History \
          evidence/working/History
```

The two files should produce the recorded SHA-256 hash if they remain unchanged.

### 13.5 Re-run the database integrity check

Run:

```bash
sqlite3 -readonly evidence/working/History \
  'PRAGMA integrity_check;'
```

The expected result for the examined database is:

```text
ok
```

The scripts and outputs are retained separately so that the examiner can compare newly generated results with the analysis artefacts committed to the repository.

## 14. Screenshots and Visual Documentation

Screenshots will be added to the repository as supplementary documentation of the investigation process.

Recommended screenshots include:

1. Evidence directory structure showing the original and working database files.
2. SHA-256 hash verification for both database copies.
3. Successful byte-for-byte comparison.
4. SQLite integrity-check result.
5. Database table and schema examination.
6. SQL query execution and record counts.
7. Extracted search terms.
8. Download metadata.
9. Cryptocurrency-related URL analysis.
10. Chronological visit timeline and CSV output.
11. Final GitHub repository structure.

Each screenshot should be accompanied by a concise caption explaining the command, artefact, or result being demonstrated.

Screenshots should accurately represent the commands executed and the outputs observed during the investigation. Sensitive information that is not necessary for the assignment should be redacted before publication.

## 15. Conclusion

This assignment demonstrated the use of browser forensics techniques to examine a Google Chrome History database and reconstruct recorded web browsing activity.

The investigation verified the consistency of the original and working database copies, examined the database schema, extracted URL and visit records, identified search terms and download metadata, and generated a chronological visit timeline.

The findings included 57 URL records, 74 visit records, four search terms, and one download record. Cryptocurrency-related browsing activity was also identified and documented as a potential area for further examination.

The project emphasised evidence integrity, repeatable analysis, structured documentation, and cautious interpretation of digital artefacts. It also demonstrated how SQL and database analysis can help investigators organise browser evidence and develop leads without overstating what the available records prove.

The completed repository preserves the principal investigation artefacts and provides a structured basis for review, reproducibility, and further analysis.

## 16. Author and Repository

**Author:** Kafayat Omolara Animashawun  
**Course:** SBT-DF204  
**Project:** Reconstructing Chrome Web History

**GitHub Repository:** [https://github.com/omolaraann/Reconstructing-Chrome-Web-History](https://github.com/omolaraann/Reconstructing-Chrome-Web-History)

---

*This repository documents an academic digital forensics investigation. The findings are based on the available Chrome History database and should be interpreted within the limitations of the evidence examined.*
