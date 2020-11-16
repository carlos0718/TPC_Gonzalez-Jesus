use master

use TPC_GONZALEZ_JESUS





insert into CLASIFICACION (clase,rubro,nombre) values ('INCIDENTE','INCIDENTE','Inconveniente con RAM')

insert into persona (apellido,nombre,fecha_nacimiento,DNI) values  
	('GONZALEZ','MATIAS','1993-05-16', 111),
	('JESUS','CARLOS','1994-10-07', 222)


INSERT into ESTADOS (estado) values ('NUEVO'),('EN COLA'),('EN PROGRESO'),('RESUELTO'),('CERRADO'),('CANCELADO')

insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid) VALUES ('INCIDENTE','Pantallazo azul','El cliente reporta que tiene repetidos pantallazos azul indicando memoria insuficiente','NUEVO',3,1)



insert into GrupoPersonas (idpersona,idarea) values (111,1), (222,1)
insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) VALUES ('INCIDENTE','Pantallazo azul','El cliente reporta que tiene repetidos pantallazos azul indicando memoria insuficiente','NUEVO',3,1,111111)



/* ===============00 */


insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) VALUES ('INCIDENTE','Pantallazo azul','El cliente reporta que tiene repetidos pantallazos azul indicando memoria insuficiente','NUEVO',3,1,111111)
select SCOPE_IDENTITY() as newid 




CREATE PROCEDURE sp_crearIncidenteNuevo(
	@descripcion varchar(300),
	@detalle varchar ( 3000),
	@urgencia int ,
	@clasificacionid int,
	@creadopor int
	
)
AS
begin 
	insert into ticket (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) 
	VALUES ('INCIDENTE', 'Apagado automatico',' UN cliente reporta que su pc se apaga sola','NUEVO',2,1,222)

