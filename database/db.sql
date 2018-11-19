CREATE TABLE colegio(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255),
	direccion VARCHAR(255)
);

CREATE TABLE nota(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nota INT
);

CREATE TABLE profesor(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255),
	fechaNacimiento DATE,
	asignatura INT,
	activo BIT(1),
	colegio INT,
	CONSTRAINT fk_colegio_profesor FOREIGN KEY (colegio) REFERENCES colegio(id),
	CONSTRAINT fk_asignatura_profesor FOREIGN KEY (asignatura) REFERENCES asignatura(id)
);

CREATE TABLE alumno(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255),
	fechaNacimiento DATE,
	colegio INT,
	CONSTRAINT fk_colegio_alumno FOREIGN KEY (colegio) REFERENCES colegio(id)
);

CREATE TABLE asignatura(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE colegio_asignatura(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	colegio INT,
	asignatura INT,
	CONSTRAINT fk_colegio_colegio_asignatura FOREIGN KEY (colegio) REFERENCES colegio(id),
	CONSTRAINT fk_asignatura_colegio_asignatura FOREIGN KEY (asignatura) REFERENCES asignatura(id)
);

CREATE TABLE asignatura_alumno(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	alumno INT,
	asignatura INT,
	CONSTRAINT fk_alumno_asignatura_alumno FOREIGN KEY (alumno) REFERENCES alumno(id),
	CONSTRAINT fk_asignatura_asignatura_alumno FOREIGN KEY (asignatura) REFERENCES asignatura(id)
);

CREATE TABLE nota_alumno_asignatura(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	alumno INT,
	asignatura INT,
	nota INT,
	CONSTRAINT fk_alumno_nota_alumno_asignatura FOREIGN KEY (alumno) REFERENCES alumno(id),
	CONSTRAINT fk_asignatura_nota_alumno_asignatura FOREIGN KEY (asignatura) REFERENCES asignatura(id),
	CONSTRAINT fk_nota_nota_alumno_asignatura FOREIGN KEY (nota) REFERENCES nota(id)
);