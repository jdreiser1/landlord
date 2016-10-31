DROP TABLE IF EXISTS apartments;
DROP TABLE IF EXISTS tenants;

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address VARCHAR NOT NULL,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT,
  gender VARCHAR,
  apartment_id INT NOT NULL
);
