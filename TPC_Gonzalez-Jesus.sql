/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
/* ============									 LIMPIEZA															     ============ */
/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
use master 
go

drop database TPC_GONZALEZ_JESUS
--drop database ticket_it
GO

use master
GO
--create database TICKET_IT
create database TPC_GONZALEZ_JESUS
GO
--use TICKET_IT
USE TPC_GONZALEZ_JESUS
go

/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
/* ============																											 ============ */
/* ============									 TABLAS																     ============ */
/* ============																											 ============ */
/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */

-- Tabla principal de personas identificadas por su DNI.

if OBJECT_ID('PERSONA') is not null
drop table persona
go

create table PERSONA (
	apellido varchar(100) not null,
	nombre varchar(100) not null,  
	fecha_nacimiento date not null, 
	fecha_alta date default CURRENT_TIMESTAMP,
	DNI int NOT NULL PRIMARY KEY,
	alta bit default 1,
	activo bit default 1,
	cliente bit default 0
	)


	
		/* ============   ============   ============ */
if OBJECT_ID('[Password]') is not null
drop table [Password]
go

create table [Password] (
	DNI int primary key foreign key references PERSONA(DNI),
	password_login binary (64) not null

)
		
		/* ============   ============   ============ */

	-- La tabla se usara como referencias para dominios (no se aplicar�n constraints para evitar errores durante las pruebas)
	-- La misma permitira acceder a la informaci�n requerida para los desplegables dentro de la app seg�n el tipo_dominio
if OBJECT_ID('DOMINIOS') is not null
drop table DOMINIOS
go

create table DOMINIOS (
	dominioid smallint identity(1,1) primary key,
	tipo_dominio varchar(100) not null, -- AREA /  GRUPO PERSONAS / TIPO TICKET  /  ESTADO
	valor_texto varchar(300),
	valor_entero int 
)




--INSERT into AREAS (nombre) values ('TECNICO'),('ADMINISTRATIVO'),('RRHH'),('FINANZAS'),('GERENCIA'),('CLIENTE'),('MANTENIMIENTO'),('VARIOS')

	--INSERT into ESTADOS (estado) values ('NUEVO'),('EN COLA'),('EN PROGRESO'),('RESUELTO'),('CERRADO'),('CANCELADO')



	/* ============   ============   ============ */


-- Grupo de personas para asignar trabajo en tratamiento de tickets
if OBJECT_ID('GRUPOTRABAJO') is not null
drop table GRUPOTRABAJO
go

create table GRUPOTRABAJO (
	grupopersonasid int IDENTITY(1,1) primary key ,
	dni int not null foreign key references persona(DNI), 
	area varchar(300) not null --foreign key references AREAS(areasID)    TECNICO','ADMINISTRATIVO','CLIENTE','SUPERVISOR'
)


	/* ============   ============   ============ */

if OBJECT_ID('ticket') is not null
drop table ticket
go


	--Tabla principal de Tickets
create table TICKET (
	--ticketuid int identity(1,1) primary key,	/* identificador unico para todos los tickets */
	ticketid int identity(1,1) primary key,		/* identificador para cada ticket de su propia clase */

	ticket_padre int ,
	--clase varchar(20) not null foreign key REFERENCES CLASETICKET(claseticketid),
	clase varchar(20) not null ,
	fecha_creacion date default CURRENT_TIMESTAMP,
	fecha_fin date,
	descripcion varchar(300) not null,
	estado varchar(20) not null default 'NUEVO',
	detalle varchar ( 3000),
	urgencia tinyint not null default 5,
	clasificacionid tinyint not null, --foreign key REFERENCES CLASIFICACION(clasificacionid),
	historico bit not null default 0,    /* Define si el ticket esta en el historial, es decir cerrado */
	creadopor int not null, --foreign key references PERSONA(DNI),
	reportadopor int not null,
	propietario int ,--foreign key references PERSONA(DNI),
	grupo_propietario tinyint --foreign key references AREAS(areasid),

	--constraint Chk_estado check (estado in (select distinct(clase) from ESTADOS)),
	--constraint Chk_clase check (clase in ('INCIDENTE','SOLICITUD','PROBLEMA','OT'))	,
	--constraint Chk_urgencia check (urgencia in (1,2,3,4,5))
	)

	/* ============   ============   ============ */
	-- Tabla de clasificaciones para asignar la naturaleza de un ticket o el tipo de un Activo
if OBJECT_ID('CLASIFICACION') is not null
drop table CLASIFICACION
go

create table CLASIFICACION(
	clasificacionid int identity(1,1) primary key,
	clase varchar(20) not null, /* Define para que tipo de ticket aplica, o en su defecto si es de activos */
	rubro varchar(20) not null,  /* Define el rubro interno, finanzas, administrativo, RRHH, etc */
	nombre varchar(120) not null

	--constraint Chk_clase_clasif check (clase in ('INCIDENTE','SOLICITUD','PROBLEMA','OT','ACTIVO'))	
	)


	

	/* ============   ============   ============ */

	-- Historial de estado de los tickets
if OBJECT_ID('tkhistory') is not null
drop table tkhistory
go
create table tkhistory( 
	tkhistory int identity(1,1) primary key,
	ticketid int not null,
	estado varchar(20) not null,
	fecha datetime not null default CURRENT_TIMESTAMP,
	propietario int --not null foreign key REFERENCES PERSONA(DNI)
)

	/* ============   ============   ============ */
	/* INVENTARIO */

create table ACTIVOS (  /* INVENTARIO:  */
	activosid int identity(1,1) primary key,
	nombre varchar(50) not null,
	descripcion varchar(300),
	estado varchar(20) not null default 'INACTIVO',
	clasificacionid int not null, --foreign key REFERENCES CLASIFICACION(clasificacionid),
	/*valor money not null default 0,    TENTATIVA: valor en inventario */ 
	costo money not null default 0	/* Costo de cara a la venta del cliente */
)
	/* ============   ============   ============ */
	-- Tabla de registros de trabajo sobre un ticket para dejar notas

create table REGISTRO(
	registroid int identity(1,1) primary key,
	descripcion varchar (300) not null,
	detalle varchar (3000),
	clase varchar (20), -- identificador del tipo de objeto padre
	ticketid int foreign key REFERENCES ticket(ticketid),
	fecha_creacion datetime not null default CURRENT_TIMESTAMP,
	creadopor int not null foreign key REFERENCES PERSONA(DNI)
	)

go


	/* ============   ============   ============ */
	-- Informacion de contacto de X persona.
create table INFOCONTACTO(
	dni int primary key foreign key references persona(DNI),  /* evaluar si mantener DNI o usar una clumna ID */
	telefono varchar(10),
	mail varchar(30),
	direccion varchar (50)
	)
	
go	



	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
	/* ============																											 ============ */
	/* ============									 		 VISTAS	             										     ============ */
	/* ============																											 ============ */
	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */

create view INCIDENTE as 
SELECT * FROM TICKET where clase='INCIDENTE'
go

create view SOLICITUD as 
SELECT * FROM TICKET where clase='SOLICITUD'
go

create view PROBLEMA as 
SELECT * FROM TICKET where clase='PROBLEMA'
go

create view clasificacion_incidente as
select clasificacionid,rubro,nombre from CLASIFICACION where clase='INCIDENTE'
go

create view clasificacion_solicitud as
select clasificacionid,rubro,nombre from CLASIFICACION where clase='SOLICITUD'
go


create view ticket_detalle as
select tk.ticketid,tk.clase,tk.ticket_padre,tk.fecha_creacion,tk.fecha_fin,tk.estado,tk.descripcion,tk.urgencia,cl.nombre,pe.apellido as Propietario,dom.valor_texto as Grupo, pe2.apellido as Reportado
											from ticket tk 
											inner join clasificacion cl on tk.clasificacionid=cl.clasificacionid
											inner join PERSONA pe on tk.propietario=pe.DNI
											inner join persona pe2 on tk.reportadopor=pe2.DNI
											inner join dominios dom on dom.tipo_dominio='AREA' and tk.grupo_propietario=dom.valor_entero
go
								
create view grupos as
select dominioid,valor_texto,valor_entero from dominios where tipo_dominio='AREA'
go


