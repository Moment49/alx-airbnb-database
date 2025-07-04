## Index Performance Exercise

### Objective
Identify and create indexes to improve query performance in your database.

### Instructions

1. **Identify High-Usage Columns**
   - Review the `User`, `Booking`, and `Property` tables.
   - Focus on columns frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses.

2. **Create Indexes**
   - Write SQL `CREATE INDEX` statements for the identified columns.
   - Save your index creation statements in a file named `database_index.sql`.

3. **Measure Performance**
   - Use `EXPLAIN` or `ANALYZE` to measure query performance before and after adding indexes.
   - Compare the results to observe the impact of indexing.

---
Document your findings and include any observations about how indexes affected query speed and efficiency.
