



/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
/* ============									 LIMPIEZA															     ============ */
/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
use master 
go

if DB_ID('TPC_GONZALEZ_JESUS') is not null 
drop database TPC_GONZALEZ_JESUS
GO

create database TPC_GONZALEZ_JESUS
GO
USE TPC_GONZALEZ_JESUS
GO



/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
/* ============																											 ============ */
/* ============									 TABLAS																     ============ */
/* ============																											 ============ */
/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */

-- Tabla principal de personas identificadas por su DNI.
create table PERSONA (
	apellido varchar(100) not null,
	nombre varchar(100) not null,  
	fecha_nacimiento date not null, 
	fecha_alta date default CURRENT_TIMESTAMP,
	DNI int NOT NULL PRIMARY KEY,
	cliente bit default 0
	)
	
	/* ============   ============   ============ */
	-- Informacion de contacto de X persona.
create table INFOCONTACTO(
	infoconcactoid int identity(1,1) primary key,
	idpersona int not null unique foreign key references persona(DNI),  /* evaluar si mantener DNI o usar una clumna ID */
	telefono varchar(10),
	mail varchar(30),
	direccion varchar (50)
	)
	/* ============   ============   ============ */

-- Tabla de Areas, identifica las areas laborales de la empresa o clientes.
create table AREAS(
	areasID  TINYINT IDENTITY(1,1) not null PRIMARY KEY ,
	nombre varchar(50) UNIQUE
)
INSERT into AREAS (nombre) values ('TECNICO'),('ADMINISTRATIVO'),('RRHH'),('FINANZAS'),('GERENCIA'),('CLIENTE'),('MANTENIMIENTO'),('VARIOS')
SELECT * FROM AREAS ORDER by areasID ASC 

	/* ============   ============   ============ */
-- Grupo de personas para asignar trabajo en tratamiento de tickets
create table GrupoPersonas (
	grupopersonasid int IDENTITY(1,1) primary key ,
	idpersona int not null unique foreign key references persona(DNI),  /* evaluar si mantener DNI o usar una clumna ID */
	idarea tinyint not null foreign key references AREAS(areasID)
)


	/* ============   ============   ============ */
	-- Tabla de clasificaciones para asignar la naturaleza de un ticket o el tipo de un Activo
create table CLASIFICACION(
	clasificacionid int identity(1,1) primary key,
	clase varchar(20) not null, /* Define para que tipo de ticket aplica, o en su defecto si es de activos */
	rubro varchar(20) not null,  /* Define el rubro interno, finanzas, administrativo, RRHH, etc */
	nombre varchar(120) not null,

	constraint Chk_clase_clasif check (clase in ('INCIDENTE','SOLICITUD','PROBLEMA','OT','ACTIVO'))	
	)
	
	

	/* ============   ============   ============ */
	/* Define los distintos estados posibles tanto de tickets como de activos y personas */

create table ESTADOS(		
	estadoid int identity(1,1) primary key,
	estado varchar(20) not null, /* Define para que tipo de ticket aplica */
	dominio varchar(20) not null

	constraint Chk_estado_dominio check (dominio in ('TICKET','ACTIVO','PERSONA','INCIDENTE','PROBLEMA','OT','SOLICITUD'))	
	)

	

	/* ============   ============   ============ */
	
--create table CLASETICKET(
--	claseticketid int identity(1,1) primary key,
--	nombre varchar(20) not null
--	)

	/* ============   ============   ============ */

	--Tabla principal de Tickets
create table TICKET (
	--ticketuid int identity(1,1) primary key,	/* identificador unico para todos los tickets */
	ticketid int identity(1,1) primary key,		/* identificador para cada ticket de su propia clase */
	--clase varchar(20) not null foreign key REFERENCES CLASETICKET(claseticketid),
	clase varchar(20) not null ,
	fecha_creacion datetime default CURRENT_TIMESTAMP,
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

	
	/* ============   ============   ============ */

	-- Historial de estado de los tickets
create table tkstatushistory(
	tkstatushistory int identity(1,1) primary key,
	estado varchar(20) not null,
	fecha datetime not null default CURRENT_TIMESTAMP,
	propietario int not null foreign key REFERENCES PERSONA(DNI)
)

	/* ============   ============   ============ */
	/* INVENTARIO */
create table ACTIVOS (  
	activosid int identity(1,1) primary key,
	nombre varchar(50) not null,
	descripcion varchar(300),
	estado varchar(20) not null default 'INACTIVO',
	clasificacionid int not null foreign key REFERENCES CLASIFICACION(clasificacionid),
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
	
/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
/* ============									DATOS DE PRUEBA														     ============ */
/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */



insert into CLASIFICACION (clase,rubro,nombre) values ('INCIDENTE','INCIDENTE','Inconveniente con RAM')

insert into persona (apellido,nombre,fecha_nacimiento,DNI) values  
	('GONZALEZ','MATIAS','1993-05-16', 111),
	('JESUS','CARLOS','1994-10-07', 222)


INSERT into ESTADOS (estado,dominio) values ('NUEVO','INCIDENTE'),('EN COLA','INCIDENTE'),('EN PROGRESO','INCIDENTE'),('RESUELTO','INCIDENTE'),('CERRADO','INCIDENTE'),('CANCELADO','INCIDENTE')
INSERT into ESTADOS (estado,dominio) values ('NUEVO','SOLICITUD'),('EN COLA','SOLICITUD'),('EN PROGRESO','SOLICITUD'),('RESUELTO','SOLICITUD'),('CERRADO','SOLICITUD'),('CANCELADO','SOLICITUD')

insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) 
VALUES ('INCIDENTE','Pantallazo azul','El cliente reporta que tiene repetidos pantallazos azul indicando memoria insuficiente','NUEVO',3,1,222)



insert into GrupoPersonas (idpersona,idarea) values (111,1), (222,1)


go



	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
	/* ============																											 ============ */
	/* ============									 PROCEDIMIENTOS ALMACENADOS											     ============ */
	/* ============																											 ============ */
	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
begin if (OBJECT_ID(N'sp_crearIncidenteNuevo') is not null) 
drop procedure sp_crearIncidenteNuevo end

go


CREATE PROCEDURE sp_crearIncidenteNuevo(
	@descripcion varchar(300),	@detalle varchar ( 3000),	@urgencia int ,	@clasificacionid int,	@creadopor int	
)
AS
begin 
	declare @succes bit=0
	begin try
		insert into [TICKET] (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) 
		VALUES ('INCIDENTE', @descripcion,@detalle,'NUEVO',@urgencia,@clasificacionid,@creadopor)

		set @succes = case when @@rowcount =0 then 0 else 1 end 
		declare @ticketid int = SCOPE_IDENTITY() -- Asigna el valor a la ultima PK creada, en este caso el ticketID 

		insert into [tkstatushistory] (ticketid,estado,clase)
		values (@ticketid,'NUEVO','INCIDENTE')
	end try
	begin catch
		set @succes=0
	end catch
	if (@succes = 1)
	begin 
		select @ticketid as Ticketid
		--select * from ticket where ticketid = @ticketid
	end
	else
	begin
		select 'Error' as Mensaje -- Definir mensaje de error
	end

end
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



