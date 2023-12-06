-- id, name, orbital per in years, star id--
CREATE TABLE planets(
    code TEXT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    orbital_pd_yrs NUMERIC NOT NULL,
    star_id NOT NULL REFERENCES stars,
);

--id, name, temp--
CREATE TABLE stars(
    code TEXT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    temp_in_kelvin VARCHAR(10) NOT NULL
);

--id, name, planet id
CREATE TABLE moons(
    code TEXT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    planet_id NOT NULL REFERENCES planets,
);

INSERT INTO planets
    (code, name, orbital_pd_yrs, star_id)
    VALUES
        ('earth', 'Earth', 1.00, 'sun'),
        ('mars', 'Mars', 1.882, 'sun'),
        ('venus', 'Venus', 0.62, 'sun'),
        ('proxima centauri', 'Proxima Centauri b', 0.03, 'proxima'),
        ('gliese 876', 'Gliese 876 b', 0.236, 'gliese');