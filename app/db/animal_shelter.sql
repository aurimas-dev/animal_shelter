DROP TABLE IF EXISTS owners CASCADE;
DROP TABLE IF EXISTS animals;

CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  breed VARCHAR(255),
  admission_date VARCHAR(255),
  available_for_adoption BOOLEAN,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE
);
