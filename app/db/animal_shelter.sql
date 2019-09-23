DROP TABLE IF EXISTS owners CASCADE;
DROP TABLE IF EXISTS animals;

CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  capacity INT2
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  image_url VARCHAR(255),
  type VARCHAR(255),
  admission_date DATE NOT NULL DEFAULT CURRENT_DATE,
  available_for_adoption BOOLEAN,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE
);
