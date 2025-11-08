use turnos_medicos;

-- tabla de usuarios--
create table usuario (
id INT auto_increment primary key,
nombre VARCHAR(200) NOT NULL,
email VARCHAR(200) NOT NULL UNIQUE,
contraseña VARCHAR(100) NOT NULL
);

create table paciente (
id INT auto_increment primary key,
nombre VARCHAR(200) NOT NULL,
apellido VARCHAR(200) NOT NULL,
dni VARCHAR(30) NOT NULL UNIQUE,
fecha_nacimiento date NOT NULL,
obra_social VARCHAR(100)
);

create table medicos (
id INT auto_increment primary key,
nombre VARCHAR(200) NOT NULL,
apellido VARCHAR(200) NOT NULL,
matricula_profesional VARCHAR(30) NOT NULL UNIQUE,
especialidad VARCHAR(100) NOT NULL
);

create table turnos(
id INT auto_increment primary key,
paciente_id int  NOT NULL,
medicos_id INT NOT NULL,
fechas date NOT NULL,
hora time not null,
estado enum('pendiente','atendido','cancelado') default 'pendiente',
observacion VARCHAR(200),

foreign key (paciente_id) references paciente(id)
on update cascade 
on delete cascade,

foreign key (medicos_id) references medicos(id)
on update cascade 
on delete cascade
);

