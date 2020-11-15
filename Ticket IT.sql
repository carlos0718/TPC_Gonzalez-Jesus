use master 
go

drop database ticket_it
GO

use master
GO
create database TICKET_IT
--create database TPC_GONZALEZ_JESUS
GO
use TICKET_IT
--USE TPC_GONZALEZ_JESUS
GO

create table PERSONA (
	apellido varchar(100) not null,
	nombre varchar(100) not null,  
	fecha_nacimiento date not null, 
	fecha_alta date default CURRENT_TIMESTAMP,
	DNI int NOT NULL PRIMARY KEY,
	cliente bit default 0
	)

	/* ============   ============   ============ */

create table AREAS(
	areasID  TINYINT IDENTITY(1,1) not null PRIMARY KEY ,
	nombre varchar(50)
)

INSERT into AREAS (nombre) values ('TECNICO'),('ADMINISTRATIVO'),('RRHH'),('FINANZAS'),('GERENCIA'),('CLIENTE'),('MANTENIMIENTO'),('VARIOS')

	/* ============   ============   ============ */

create table GrupoPersonas (
	grupopersonasid int IDENTITY(1,1) primary key ,
	idpersona int not null unique foreign key references persona(DNI),  /* evaluar si mantener DNI o usar una clumna ID */
	idarea tinyint not null foreign key references AREAS(areasID)
)

	/* ============   ============   ============ */

create table INFOCONTACTO(
	infoconcactoid int identity(1,1) primary key,
	idpersona int not null unique foreign key references persona(DNI),  /* evaluar si mantener DNI o usar una clumna ID */
	telefono varchar(10),
	mail varchar(30),
	direccion varchar (50)
	)

	/* ============   ============   ============ */

create table CLASIFICACION(
	clasificacionid int identity(1,1) primary key,
	clase varchar(20) not null, /* Define para que tipo de ticket aplica, o en su defecto si es de activos */
	rubro varchar(20) not null,  /* Define el rubro interno, finanzas, administrativo, RRHH, etc */
	nombre varchar(120) not null,

	constraint Chk_clase_clasif check (clase in ('INCIDENTE','SOLICITUD','PROBLEMA','OT','ACTIVO'))	
	)

	insert into CLASIFICACION (clase,rubro,nombre) values ('INCIDENTE','INCIDENTE','Inconveniente con RAM')

	/* ============   ============   ============ */

create table ESTADOS(
	estadoid int identity(1,1) primary key,
	estado varchar(20) not null, /* Define para que tipo de ticket aplica */
	)

	INSERT into ESTADOS (estado) values ('NUEVO'),('EN COLA'),('EN PROGRESO'),('RESUELTO'),('CERRADO'),('CANCELADO')

	/* ============   ============   ============ */
	
--create table CLASETICKET(
--	claseticketid int identity(1,1) primary key,
--	nombre varchar(20) not null
--	)

	/* ============   ============   ============ */
create table TICKET (
	--ticketuid int identity(1,1) primary key,	/* identificador unico para todos los tickets */
	ticketid int identity(1,1) primary key,		/* identificador para cada ticket de su propia clase */
	--clase varchar(20) not null foreign key REFERENCES CLASETICKET(claseticketid),
	clase varchar(20) not null ,
	fecha_creacion date default CURRENT_TIMESTAMP,
	fecha_fin date,
	descripcion varchar(300) not null,
	estado varchar(20) not null default 'NUEVO',
	detalle varchar ( 3000),
	urgencia int not null default 5,
	clasificacionid int not null foreign key REFERENCES CLASIFICACION(clasificacionid),
	historial bit not null default 0,    /* Define si el ticket esta en el historial, es decir cerrado */
	creadopor int not null foreign key references PERSONA(DNI),
	propietario int foreign key references PERSONA(DNI),
	grupopropietario tinyint foreign key references AREAS(areasid),

	--constraint Chk_estado check (estado in (select distinct(clase) from ESTADOS)),
	constraint Chk_clase check (clase in ('INCIDENTE','SOLICITUD','PROBLEMA','OT'))	,
	constraint Chk_urgencia check (urgencia in (1,2,3,4,5))
	)

	
insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid) VALUES ('INCIDENTE','Pantallazo azul','El cliente reporta que tiene repetidos pantallazos azul indicando memoria insuficiente','NUEVO',3,1)
	/* ============   ============   ============ */

create table ACTIVOS (  /* INVENTARIO */
	activosid int identity(1,1) primary key,
	nombre varchar(50) not null,
	descripcion varchar(300),
	estado varchar(20) not null default 'INACTIVO',
	clasificacionid int not null foreign key REFERENCES CLASIFICACION(clasificacionid),
	/*valor money not null default 0,    TENTATIVA: valor en inventario */ 
	costo money not null default 0	/* Costo de cara a la venta del cliente */

	)


	/* ============   ============   ============ */
--select * from persona

--select * from grupopersonas

insert into persona (apellido,nombre,fecha_nacimiento,DNI) values  
	('GONZALEZ','MATIAS','1993-05-16', 111),
	('JESUS','CARLOS','1994-10-07', 222)

insert into GrupoPersonas (idpersona,idarea) values (111,1), (222,1)
insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) VALUES ('INCIDENTE','Pantallazo azul','El cliente reporta que tiene repetidos pantallazos azul indicando memoria insuficiente','NUEVO',3,1,111111)

--select * from ESTADOS