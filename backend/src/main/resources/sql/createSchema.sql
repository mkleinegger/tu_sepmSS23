CREATE TABLE IF NOT EXISTS owner
(
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS horse
(
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(4095),
  date_of_birth DATE NOT NULL,
  sex ENUM('MALE', 'FEMALE') NOT NULL,
  owner_id BIGINT REFERENCES owner(id),
  mother_id BIGINT REFERENCES horse(id) ON DELETE SET NULL,
  father_id BIGINT REFERENCES horse(id) ON DELETE SET NULL,
  CHECK (mother_id <> father_id),
  CHECK (id <> mother_id),
  CHECK (id <> father_id),
  CHECK (date_of_birth <= NOW())
);
