CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort text,
-- The foreign key name is always cohort_id
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
    on delete cascade
);