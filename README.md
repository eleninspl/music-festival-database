# Music Festival Database

A relational database in SQL for an international music festival that runs every year in a different city. It stores locations, festivals, stages, events, performers (solo artists and bands), music genres, staff, visitors, tickets and visitor ratings. The project includes the schema, 24 triggers that enforce the festival's business rules, a sample dataset, 15 analytical queries, a comparison of join strategies for two of them, and a stored procedure that matches buyers and sellers in a ticket resale queue. Everything targets MariaDB.

This was a team project for **Databases** (Βάσεις Δεδομένων), a 6th-semester course at the School of Electrical and Computer Engineering, National Technical University of Athens (ECE NTUA), academic year 2024–25. The team (team 21) was Eleni Nasopoulou, Xenofon Papougiannakis and Pantelis Petrakis.

| Part | Files | What it covers |
|------|-------|----------------|
| [Schema and triggers](#schema-and-triggers) | `sql/install.sql` | 22 tables, indexes, 26 triggers, 1 stored procedure |
| [Sample data](#sample-data) | `sql/load.sql` | Synthetic data for 10 festivals, 2020–2025 |
| [Queries](#queries) | `sql/Q01.sql` … `sql/Q15.sql` | 15 analytical queries, each with its saved output |
| [Join strategy analysis](#join-strategy-analysis-queries-4-and-6) | `sql/Q04_alternative.sql`, `sql/Q06_alternative.sql` | `EXPLAIN` and profiling of different join strategies |
| [Ticket resale](#ticket-resale) | `process_resale_matches()` in `sql/install.sql` | FIFO matching of resale buyers and sellers |

## Getting started

### Prerequisites

- MariaDB server and client. The team developed the project on MariaDB 11.7. I re-ran the full pipeline on MariaDB 11.8 while writing this README. The scripts were not tested on MySQL.

```bash
git clone https://github.com/eleninspl/music-festival-database.git
cd music-festival-database
```

### Create a user

`install.sql` drops and recreates a database named `festival`, so don't run it on a server where you already have a database with that name. Connect as an administrator (`sudo mariadb` on Linux, or `mariadb -u root -p`) and create a user for the project:

```sql
CREATE USER 'festival_user'@'localhost' IDENTIFIED BY 'choose-a-password';
GRANT ALL PRIVILEGES ON festival.* TO 'festival_user'@'localhost';
```

### Build and load the database

```bash
mariadb -u festival_user -p < sql/install.sql
mariadb -u festival_user -p festival < sql/load.sql
```

On older installations, the client is called `mysql` instead of `mariadb`. The commands are the same.

### Run a query

Queries without parameters:

```bash
mariadb -u festival_user -p -t festival < sql/Q01.sql
```

Four queries read a session variable. Set it in the same command:

```bash
mariadb -u festival_user -p -t festival -e "SET @artist_name = 'The Weeknd'; SOURCE sql/Q04.sql;"
```

| Query | Variables | Values used for the saved output |
|-------|-----------|----------------------------------|
| Q02 | `@genre_name`, `@festival_year` | `'Rock'`, `2023` |
| Q04, Q04_alternative | `@artist_name` | `'The Weeknd'` |
| Q06, Q06_alternative | `@visitor_email` | `'james.wilson@example.com'` |
| Q08 | `@target_date` | `'2022-06-03'` |

`sql/terminal.txt` lists the exact command for every query. The output of each query is saved next to it as `sql/QNN_out.txt`.

## Schema and triggers

The schema was designed in MySQL Workbench. The ER diagram and the relational diagram are in [`diagrams/er.pdf`](diagrams/er.pdf) and [`diagrams/relational.pdf`](diagrams/relational.pdf).

| Area | Tables |
|------|--------|
| Festivals and places | `LOCATION`, `FESTIVAL`, `VENUE` (stage), `EVENT`, `EQUIPMENT`, `VENUE_EQUIPMENT` |
| Performers | `PERFORMER`, then either `ARTIST` (solo) or `BAND`, linked by `ARTIST_BAND` with join and leave dates; `GENRE` (with sub-genres through `parent_genre_id`), `PERFORMER_GENRE`; `PERFORMANCE` (a performer's slot in an event: warm up, headline or special guest) |
| Staff | `STAFF` (technical, security or auxiliary, with an experience level), `EVENT_STAFF` |
| Visitors | `VISITOR`, `TICKET` (with a unique EAN code), `RATING` (five scores from 1 to 5 per performance) |
| Resale | `RESALE_SELLER_QUEUE`, `RESALE_BUYER_QUEUE`, `RESALE_MATCHES`, `COMPLETED_RESALE_TRANSACTIONS` |

`PERFORMER` holds what solo artists and bands have in common (stage name, website, Instagram, genres), so performances, ratings and genre queries treat both the same way.

The business rules are enforced with `BEFORE` triggers that raise `SIGNAL SQLSTATE '45000'`. The main ones:

| Table | Rule |
|-------|------|
| `FESTIVAL`, `EVENT` | Festivals and events cannot be deleted. Festival dates must fall in the festival's year, and events within the festival's dates. A stage hosts at most one event per day. |
| `PERFORMANCE` | Up to 3 hours long, on the same day as its event, with no overlap for the same performer. Breaks between consecutive performances in an event are 5–30 minutes. A performer cannot appear more than 3 years in a row. |
| `TICKET` | Bought before the event, at a positive price. Sales stop at the stage's capacity. VIP tickets are capped at 10% of capacity. One ticket per visitor per event. An activated ticket cannot be deactivated. |
| `RATING` | Only a visitor with a ticket for the event can rate a performance, only after it ends, once per performance, with every score between 1 and 5. |
| `EVENT_STAFF` | Removing staff from an event is blocked if security staff would drop below 5% of the stage's capacity, or auxiliary staff below 2%. |
| `RESALE_*` | Only the owner can list a ticket, and only once. A buyer asks either for a specific listed ticket or for an event and ticket category, not both. |

## Sample data

`load.sql` fills the database with synthetic data. Visitor emails use `example.com` and phone numbers use the fictional 555 range. Performer names are real artists, used as sample data.

| Entity | Rows |
|--------|------|
| Festivals | 10 (2020–2025), at 15 locations on 6 continents |
| Stages / events / performances | 30 / 70 / 175 |
| Performers | 70 (45 solo artists, 25 bands) |
| Genres | 43 (10 main genres and their sub-genres) |
| Visitors / tickets / ratings | 151 / 200 / 80 |
| Staff / staff assignments | 140 / 2,429 |
| Resale listings / resale requests | 20 / 30 |

The data is inserted after the triggers are created, so every row has passed them.

## Queries

| # | Question |
|---|----------|
| 1 | Ticket revenue per year, split by payment method, with each method's share of the year's total |
| 2 | Performers of a given genre, and whether each one performed in a given year |
| 3 | Performers who appeared as warm-up acts more than twice at the same festival |
| 4 | A performer's average "artist interpretation" and "overall impression" scores |
| 5 | Artists under 30, ordered by the number of festivals they appeared in |
| 6 | The performances a visitor rated, with their average overall impression for each |
| 7 | The festival with the lowest average experience level of technical staff |
| 8 | Auxiliary staff with no assignment on a given date |
| 9 | Visitors who attended the same number of events (more than 3) within a 365-day window |
| 10 | The top 3 genre pairs, by the number of festivals where a performer with both genres appeared |
| 11 | Performers with at least 5 fewer festival appearances than the most frequent performer |
| 12 | Staff working each festival day, by staff type, with each type's share |
| 13 | Performers who appeared at festivals on at least 3 continents |
| 14 | Genres with the same number of appearances in two consecutive years |
| 15 | The top 5 visitor–artist pairs by total "artist interpretation" score. A band's scores count towards each of its members. |

The queries use common table expressions, aggregate functions, correlated subqueries and self-joins. Example output of query 1:

```
+------+----------------+-------------------+---------------------------+---------------------------+---------------------------------+
| Year | Payment Method | Number of Tickets | Revenue by Payment Method | Total Revenue of the Year | Percentage of Total Revenue (%) |
+------+----------------+-------------------+---------------------------+---------------------------+---------------------------------+
| 2020 | Credit Card    |                10 |                   3799.96 |                   7499.92 |                           50.67 |
| 2020 | Debit Card     |                 5 |                   1999.99 |                   7499.92 |                           26.67 |
| 2020 | Bank Transfer  |                 5 |                   1699.97 |                   7499.92 |                           22.67 |
```

## Join strategy analysis (queries 4 and 6)

`Q04_alternative.sql` and `Q06_alternative.sql` run each query four ways and record `EXPLAIN` and `SHOW PROFILE` output for each:

| Variant | How it is forced |
|---------|------------------|
| Default | The optimizer's own plan |
| "Nested loop" | `STRAIGHT_JOIN` with `USE INDEX (PRIMARY)` |
| "Hash join (BNL)" | `IGNORE INDEX` on the join columns, aiming for a block nested-loop join |
| "Merge join" | `FORCE INDEX` on the join columns |

Timings measured by the team and recorded in the project report:

| Variant | Query 4 | Query 6 |
|---------|---------|---------|
| Default | 0.414 ms | 0.325 ms |
| Nested loop | 0.377 ms | 0.484 ms |
| Hash join (BNL) | **0.257 ms** | 1.229 ms |
| Merge join | 0.277 ms | **0.281 ms** |

For query 6, forcing the indexes on the visitor's email and the rating's visitor was the fastest variant. Ignoring the indexes made the optimizer fall back to join buffers and a temporary table, and the query became almost four times slower. The dataset is small, so every variant finishes in well under a millisecond. Treat these numbers as a demonstration of how to read and steer query plans, not as a benchmark.

## Ticket resale

A visitor who can't attend can list an unused ticket in `RESALE_SELLER_QUEUE`. A buyer joins `RESALE_BUYER_QUEUE` and asks either for a specific listed ticket or for any ticket of a given category for a given event. The stored procedure `process_resale_matches()` then matches them:

1. Buyers who asked for a specific ticket are served first, in order of request.
2. Buyers who asked for a category are matched to the earliest listing for that event and category (FIFO). If that listing is not available, the procedure tries the next one.
3. A buyer is never matched to an event they already have a ticket for.
4. Each match is recorded in `COMPLETED_RESALE_TRANSACTIONS`. The ticket's owner changes to the buyer, and both queue entries are marked as processed.

```bash
mariadb -u festival_user -p -t festival -e "CALL process_resale_matches();"
```

With the sample data, the first call completes 15 resales: 10 for specific tickets and 5 by category. A later call finds no new matches until new entries are added to the queues.

## Documentation

- [`diagrams/er.pdf`](diagrams/er.pdf): ER diagram
- [`diagrams/relational.pdf`](diagrams/relational.pdf): Relational diagram

## Known limitations

The SQL is kept as it was submitted, apart from two small trigger fixes. In the resale seller trigger, a local variable had the same name as the `is_activated` column, so activated tickets could be listed for resale. In the rating update trigger, the duplicate check counted the row being updated, so every rating update was rejected. While writing this README, I rebuilt the database from scratch, re-ran every script and found the issues below:

- **Minimum staffing is only checked on removal.** `trg_event_staff_requirements_before_insert` calculates the required security and auxiliary staff but never compares it with the actual count. In the sample data, events 14 and 16 have fewer auxiliary staff than the 2% rule requires.
- **Ticket insert validation.** The insert trigger on `TICKET` does not check the category or the payment method. Only the update trigger does.
- **Resale procedure.** It decides which matches are "new" by comparing timestamps with the last second, so two calls less than a second apart report the same matches twice (without creating duplicates). Each call matches only the earliest category buyer for each event and category; the others wait for the next call. `RESALE_MATCHES` is filled by triggers, but nothing reads it.
- **Join strategies.** MariaDB has no sort-merge join, so the "merge join" variant is an index nested-loop join on the forced indexes. The alternative scripts also create indexes that duplicate existing ones (for example `idx_performance_performer_id` and `performer_id_idx`). This explains why the report found the optimizer still using an index despite `IGNORE INDEX`: it used the duplicate.
- **Saved outputs.** Query 5 calculates ages from the current date, so its output changes over time. `Q10_out.txt` was saved before the last change to the sample data. A fresh run gives 9 festivals, not 8, for the Alternative Rock–Electronic pair, which moves it to second place.

## For students taking the course

This repository is here to help you see how a complete database project fits together: an ER model turned into tables, business rules turned into triggers, and analytical questions turned into SQL. The assignment changes from year to year, so design your own schema and write your own queries.

The MariaDB documentation on triggers, `EXPLAIN` and index hints covers most of what you need for this kind of project.
