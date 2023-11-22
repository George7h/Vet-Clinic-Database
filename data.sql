/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES 
  ('Agumon', '2020-02-03', 10.23, true, 0),
  ('Gabumon', '2018-11-15', 8, true, 2),
  ('Pikachu', '2021-01-07', 15.04, false, 1),
  ('Devimon', '2017-05-12', 11, true, 5);


INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES 
  ('Charmander', '2020-02-08', -11, false, 0),
  ('Plantmon', '2021-11-15', -5.7, true, 2),
  ('Squirtle', '1993-04-02', -12.13, false, 3),
  ('Angemon', '2005-06-12', -45, true, 1),
  ('Boarmon', '2005-06-07', 20.4, true, 7),
  ('Blossom', '1998-10-13', 17, true, 3),
  ('Ditto', '2022-05-14', 22, true, 4);


INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);


INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');


UPDATE animals
SET species_id = CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
END;


# Sam Smith owns Agumon
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

# Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

# Bob owns Devimon and Plantmon
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');

# Melody Pond owns Charmander, Squirtle, and Blossom
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

# Dean Winchester owns Angemon and Boarmon
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');
