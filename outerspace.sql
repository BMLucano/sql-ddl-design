--code, name, temp--
CREATE TABLE stars(
    code TEXT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    temp_in_kelvin INT NOT NULL
);

-- code, name, orbital per in years, star id--
CREATE TABLE planets(
    code TEXT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    orbital_pd_yrs FLOAT NOT NULL,
    star_id VARCHAR(20) NOT NULL REFERENCES stars
);

--code, name, planet id
CREATE TABLE moons(
    code TEXT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    planet_id VARCHAR(20) NOT NULL REFERENCES planets
);


INSERT INTO stars
    (code, name, temp_in_kelvin)
    VALUES
    ('sun', 'The Sun', 5800),
    ('proxima', 'Proxima Centauri', 3042),
    ('gliese', 'Gliese 876', 3192);


INSERT INTO planets
    (code, name, orbital_pd_yrs, star_id)
    VALUES
        ('earth', 'Earth', 1.00, 'sun'),
        ('mars', 'Mars', 1.882, 'sun'),
        ('venus', 'Venus', 0.62, 'sun'),
        ('proxima centauri', 'Proxima Centauri b', 0.03, 'proxima'),
        ('gliese 876', 'Gliese 876 b', 0.236, 'gliese');


INSERT INTO moons
    (code, name, planet_id)
    VALUES
    ('moon', 'The Moon', 'earth'),
    ('phobos', 'Phobos', 'mars'),
    ('deimos', 'Deimos', 'mars');


-- QUERY

SELECT planets.name, stars.name, COUNT(moons.name)
    FROM planets
        JOIN stars
          ON planets.star_id = stars.code
        LEFT JOIN moons
            ON moons.planet_id = planets.code
    GROUP BY planets.name, stars.name
    ORDER BY planets.name;
