
CREATE DATABASE mi_base_de_datos;

\c mi_base_de_datos
-- Crear la tabla de países
  
CREATE TABLE pais (
    id_pais SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla de departamentos
CREATE TABLE departamento (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_pais INT REFERENCES pais(id_pais) ON DELETE CASCADE
);

-- Crear la tabla de municipios
CREATE TABLE municipio (
    id_municipio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_departamento INT REFERENCES departamento(id_departamento) ON DELETE CASCADE
);

CREATE TABLE localidad (
    id_localidad SERIAL PRIMARY KEY,
    id_departamento INT REFERENCES departamento(id_departamento) ON DELETE CASCADE,
    id_municipio INT REFERENCES municipio(id_municipio) ON DELETE CASCADE
);

\copy localidad (id_departamento, id_municipio) FROM '/home/root/Descargas/localidades.csv' DELIMITER ',' CSV HEADER;

