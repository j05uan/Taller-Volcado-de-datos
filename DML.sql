\c mi_base_de_datos
-- Insertar departamentos únicos desde `localidad`
INSERT INTO departamento (nombre, id_pais)
SELECT DISTINCT l.departamento, p.id_pais
FROM localidad l
JOIN pais p ON l.pais = p.nombre
ON CONFLICT (nombre, id_pais) DO NOTHING;

-- Insertar municipios únicos desde `localidad`
INSERT INTO municipio (nombre, id_departamento)
SELECT DISTINCT l.municipio, d.id_departamento
FROM localidad l
JOIN departamento d ON l.departamento = d.nombre
AND d.id_pais = (SELECT id_pais FROM pais WHERE nombre = l.pais)
ON CONFLICT (nombre, id_departamento) DO NOTHING;
