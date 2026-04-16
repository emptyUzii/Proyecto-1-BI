-- 1. Creación de Tablas
CREATE TABLE Sede (
    id_sede INT PRIMARY KEY,
    nombre_sede VARCHAR(100),
    ubicacion VARCHAR(100)
);

CREATE TABLE Carrera (
    id_carrera INT PRIMARY KEY,
    nombre_carrera VARCHAR(100),
    facultad VARCHAR(100)
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nombre_curso VARCHAR(100),
    creditos INT,
    id_carrera INT,
    FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera)
);

CREATE TABLE Docente (
    id_docente INT PRIMARY KEY,
    nombre_completo VARCHAR(100),
    tipo_contrato VARCHAR(50)
);

CREATE TABLE Estudiante (
    id_estudiante INT PRIMARY KEY,
    nombre_completo VARCHAR(100),
    fecha_nacimiento DATE,
    genero VARCHAR(20),
    anio_ingreso INT, -- Esto define la "Cohorte" para el análisis de permanencia 
    colegio_procedencia VARCHAR(100)
);

CREATE TABLE Grupo_Oferta (
    id_grupo INT PRIMARY KEY,
    id_curso INT,
    id_docente INT,
    id_sede INT,
    periodo_academico VARCHAR(20), -- Ejemplo: 'I Ciclo', 'II Ciclo'
    anio INT,
    modalidad VARCHAR(50), -- Presencial, Virtual, Híbrido 
    franja_horaria VARCHAR(50), -- Mañana, Tarde, Noche 
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede)
);

CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY,
    id_grupo INT,
    id_estudiante INT,
    fecha_matricula DATE,
    nota_final DECIMAL(5,2),
    estado_curso VARCHAR(20), -- 'Aprobado', 'Reprobado', 'Deserción' 
    FOREIGN KEY (id_grupo) REFERENCES Grupo_Oferta(id_grupo),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante)
);