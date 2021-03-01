



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
if OBJECT_ID('GrupoPersonas') is not null
drop table GrupoPersonas
go

create table GrupoPersonas (
	grupopersonasid int IDENTITY(1,1) primary key ,
	idpersona int not null, --unique foreign key references persona(DNI),  /* evaluar si mantener DNI o usar una clumna ID */
	idarea tinyint not null --foreign key references AREAS(areasID)
)

insert into grupopersonas (idpersona,idarea) values (37189215,(select areasID from AREAS where nombre='ADMINISTRATIVO'))
	/* ============   ============   ============ */

if OBJECT_ID('ticket') is not null
drop table ticket
go

drop table ticket
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

	select ticketid,descripcion,estado,urgencia,,fecha_creacion,fecha_fin,historico from ticket where propietario=37189215

	/* ============   ============   ============ */
	-- Tabla de clasificaciones para asignar la naturaleza de un ticket o el tipo de un Activo
if OBJECT_ID('CLASIFICACION') is not null
drop table CLASIFICACION
go

create table CLASIFICACION(
	clasificacionid int identity(1,1) primary key,
	clase varchar(20) not null, /* Define para que tipo de ticket aplica, o en su defecto si es de activos */
	rubro varchar(20) not null,  /* Define el rubro interno, finanzas, administrativo, RRHH, etc */
	nombre varchar(120) not null,

	--constraint Chk_clase_clasif check (clase in ('INCIDENTE','SOLICITUD','PROBLEMA','OT','ACTIVO'))	
	)


	

	/* ============   ============   ============ */
	
--create table CLASETICKET(
--	claseticketid int identity(1,1) primary key,
--	nombre varchar(20) not null
--	)



	select * from ticket
	select * from CLASIFICACION
	/* ============   ============   ============ */

	-- Historial de estado de los tickets
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

create table ACTIVOS (  /* INVENTARIO */
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
	-- Informacion de contacto de X persona.	NO CREADA
create table INFOCONTACTO(
	infoconcactoid int identity(1,1) primary key,
	idpersona int not null unique foreign key references persona(DNI),  /* evaluar si mantener DNI o usar una clumna ID */
	telefono varchar(10),
	mail varchar(30),
	direccion varchar (50)
	)

	
/* ============   ============   ============  DOMINIOS   ============   ============  ============   ============   ============ */
	/* ============   ============   ============ */
	/* Define los distintos estados posibles tanto de tickets como de activos y personas */
	/*
create table ESTADOS(		
	estadoid int identity(1,1) primary key,
	estado varchar(20) not null, /* Define para que tipo de ticket aplica */
	dominio varchar(20) not null

	constraint Chk_estado_dominio check (dominio in ('TICKET','ACTIVO','PERSONA','INCIDENTE','PROBLEMA','OT','SOLICITUD'))	

	*/

/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
/* ============									DATOS DE PRUEBA														     ============ */
/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */

select * from ticket where propietario=37189215
--PERSONAS
--exec sp_crearUsuarioNuevo @DNI int,@nombre varchar(100),@apellido varchar(100),@fecha_nacimiento date	,@cliente bit,@password varchar(64)

exec sp_crearUsuarioNuevo 37189215,'Matias','Gonzalez','1993-05-16' ,0, 'prog2021'
exec sp_crearUsuarioNuevo 95346499,'Carlos','Jesus','1992-02-07' ,0, 'prog2021'
exec sp_crearUsuarioNuevo 11111111,'Angel','Simon','1990-01-01' ,0, 'profesor'

exec sp_crearUsuarioNuevo 18692421,'Juan','Perez','1993-05-16' ,1, 'generica'
exec sp_crearUsuarioNuevo 18692422,'Pedro','Calac','1993-05-16' ,1, 'generica'
exec sp_crearUsuarioNuevo 18692423,'Daniel','Ayala','1993-05-16' ,1, 'generica'
exec sp_crearUsuarioNuevo 18692424,'Paula','Campos','1993-05-16' ,1, 'generica'
exec sp_crearUsuarioNuevo 18692425,'Estaban','Molina','1993-05-16' ,1, 'generica'


	--DOMINIOS
insert into DOMINIO (tipo_dominio,valor_texto) values   ('AREA','TECNICO'),('AREA','ADMINISTRATIVO'),('AREA','CLIENTE'),
									     			   
											     		('TIPO TICKET','INCIDENTE'),('TIPO TICKET','SOLICITUD'),('TIPO TICKET','ORDEN DE TRABAJO'),
														('ESTADO ACTIVO','OPERATIVO'),('ESTADO ACTIVO','BAJA')

insert into DOMINIO (tipo_dominio,valor_texto,valor_entero) values  ('ESTADO','NUEVO',0),('ESTADO','EN COLA',1),('ESTADO','EN PROGRESO',2),('ESTADO','RESUELTO',3),('ESTADO','CANCELADO',3)

insert into DOMINIO (tipo_dominio,valor_entero) values ('URGENCIA',1),('URGENCIA',2),('URGENCIA',3),('URGENCIA',4),('URGENCIA',5)


	-- CLASIFICACION
insert into CLASIFICACION (clase,rubro,nombre) values ('INCIDENTE','Falla Hardware','RAM'),
														('INCIDENTE','Falla Hardware','MotherBoard'),
														('INCIDENTE','Falla Hardware','Fuente alimentacion'),
														('INCIDENTE','Falla Software','Virus/malware'),
														('INCIDENTE','Falla Software','Activacion de windows'),
														('INCIDENTE','Falla Software','Outlook no recibe mensajes'),


														('SOLICITUD','Nuevo componente','UPS'),
														('SOLICITUD','Nuevo componente','Nuevo equipo entero'),
														('SOLICITUD','Cambio de equipo','Monitor Nuevo'),
														('SOLICITUD','Software','Instalacion de cliente FTP'),
														('SOLICITUD','Software','Instalacion de Adobe Reader'),
														('SOLICITUD','Cambio de equipo','Cambio de de placa Mather'),

														--Los problemas se consideran incidentes ajenos a la empresa, pero que afectan a nuestros clientes o arreglos
														('PROBLEMA','Servidor','Proveedor caido'),
														('PROBLEMA','Apagado intermitente','Central electrica defectuosa'),
														('PROBLEMA','Red Inestable','Proveedor de internet con problemas'),
														('PROBLEMA','Impresoras','Impresoras sin cartuchos'),
														('PROBLEMA','Laptos','Proveedor con demora')
	
	



--INSERT into ESTADOS (estado,dominio) values ('NUEVO','INCIDENTE'),('EN COLA','INCIDENTE'),('EN PROGRESO','INCIDENTE'),('RESUELTO','INCIDENTE'),('CERRADO','INCIDENTE'),('CANCELADO','INCIDENTE')
--INSERT into ESTADOS (estado,dominio) values ('NUEVO','SOLICITUD'),('EN COLA','SOLICITUD'),('EN PROGRESO','SOLICITUD'),('RESUELTO','SOLICITUD'),('CERRADO','SOLICITUD'),('CANCELADO','SOLICITUD')

insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) 
VALUES ('INCIDENTE','Pantallazo azul','El cliente reporta que tiene repetidos pantallazos azul indicando memoria insuficiente','NUEVO',3,1,222)

exec sp_crearIncidenteNuevo	'Pantallazo Verde',	'El cliente reporta que tiene una pc muy mala',	3 ,	1,37189215,	37189215

exec sp_avanzarEstadoTicket	1, 37189215 , 'EN COLA'

exec sp_asignarPropietarioTicket 1, 37189215 , 1

select * from ticket
select * from tkhistory
	
	select * from persona



insert into GrupoPersonas (idpersona,idarea) values (111,1), (222,1)


go




/*================================================*/
select * from ticket
	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
	/* ============																											 ============ */
	/* ============									 		 VISTAS	             										     ============ */
	/* ============																											 ============ */
	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */

-- 1.- TRAE LA VISTA DE CANTIDAD DE CLASE=INCIDENTES GENERADOS
ALTER VIEW CantidadTks AS
SELECT COUNT(*)[Cantidad de Inc.] FROM TICKET T  WHERE T.clase = 'INCIDENTE'

SELECT * FROM CantidadTks
--2.- TRAE LA VISTA DE TODOS LOS TKT CON ESTADO = NUEVO
CREATE VIEW VIEW_ESTADO AS
SELECT T.ticketid ,T.clase,T.descripcion,T.detalle,T.estado,T.urgencia,T.clasificacionid,T.creadopor, T.propietario,T.grupopropietario FROM TICKET T
WHERE T.estado = 'NUEVO'

SELECT * FROM VIEW_ESTADO
--3.- TRAE LA VISTA DE LA CANTIDAD DE CLASE=SOLICITUDES GENERADOS
CREATE VIEW CantidadSoli AS
SELECT COUNT(*) [Cantidad de Solicitudes] FROM TICKET T WHERE T.clase = 'SOLICITUD'

SELECT * FROM CantidadSoli


-- ===================================================================	

	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
	/* ============																											 ============ */
	/* ============									 		 TRIGGERS	             										 ============ */
	/* ============																											 ============ */
	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */

