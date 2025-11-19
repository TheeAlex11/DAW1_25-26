CREATE TABLE Estudio (
    id_estudio INT AUTO_INCREMENT NOT NULL,
    estudio VARCHAR(100) NOT NULL,
    direccion_estudio VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_estudio)
);

CREATE TABLE Pelicula (
    id_pelicula INT AUTO_INCREMENT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    año INT NOT NULL,
    duración INT NOT NULL,
    género VARCHAR(50) NOT NULL,
    id_estudio INT NOT NULL,
    PRIMARY KEY (id_pelicula),
    FOREIGN KEY (id_estudio) REFERENCES Estudio(id_estudio)
);

CREATE TABLE Actuacion (
    id_actuacion INT AUTO_INCREMENT NOT NULL,
    id_pelicula INT NOT NULL,
    actor VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_actuacion),
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula)
);
