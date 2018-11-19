-- Primera Query
-- Objetivo: Consulta que obtenga todos los profesores de un colegio ordenados por nombre.
SELECT * 
FROM PROFESOR 
WHERE colegio = 1 
ORDER BY nombre ASC;

-- Segunda Query
-- Objetivo: Consulta que obtenga todos los alumnos con promedio rojo por asignatura.
SELECT al.nombre AS "ALUMNO", asig.nombre AS "ASIGNATURA", ROUND(AVG(n.nota),1) AS "NOTA" 
FROM nota AS n 
INNER JOIN alumno AS al
INNER JOIN asignatura AS asig
INNER JOIN nota_alumno_asignatura ON
n.id = nota_alumno_asignatura.nota AND
al.id = nota_alumno_asignatura.alumno AND
asig.id = nota_alumno_asignatura.asignatura
GROUP BY al.nombre,asig.nombre 
HAVING NOTA < 4.0;
 
-- Tercera Query
-- Objetivo: Consulta que contenga el alumno con mejor nota por asignatura.
SELECT asig.nombre AS "asignatura", al.nombre AS "alumno", n.nota AS "nota" 
FROM (
	SELECT naa.id AS "id", T.asignatura AS "asignatura", naa.alumno AS "alumno", T.nota AS "nota"
	FROM (
	SELECT asignatura, MAX(nota) AS 'nota'
	FROM nota_alumno_asignatura 
	GROUP BY asignatura
	)AS T INNER JOIN nota_alumno_asignatura AS naa ON 
		naa.asignatura = T.asignatura AND 
		naa.nota = T.nota
) AS M 
INNER JOIN alumno AS al
INNER JOIN asignatura AS asig
INNER JOIN nota as n ON
al.id = M.alumno AND
asig.id = M.asignatura AND
n.id = M.nota
ORDER BY M.asignatura ASC, M.alumno, M.nota DESC;