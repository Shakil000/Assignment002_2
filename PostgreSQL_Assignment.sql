-- Active: 1747551989052@@127.0.0.1@5432@conservation_db
--? Creating Table for Rangers----------------

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

--? Creating Table for Species-----------------

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_data DATE,
    conservation_status VARCHAR(100)
);

--? Creating Table for Sightings-----------------


CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
    note TEXT
);


