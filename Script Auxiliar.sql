use master

use TPC_GONZALEZ_JESUS






/* ===============00 */


insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) VALUES ('INCIDENTE','Pantallazo azul','El cliente reporta que tiene repetidos pantallazos azul indicando memoria insuficiente','NUEVO',3,1,111111)
select SCOPE_IDENTITY() as newid 
go
insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor) 
VALUES ('SOLICITUD','Cambio de Fuente','El cliente reporta que que despues de un corte de luz la pc no enciende','NUEVO',3,1,222)

insert into TICKET (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor, propietario,grupopropietario) 
VALUES ('SOLICITUD','Cambio de Fuente','El cliente reporta que que despues de un corte de luz la pc no enciende','EN PROGRESO',3,1,222,111,1)

go
USE MASTER

go

exec sp_crearIncidenteNuevo 'nueva desc','larga desc',3,1,222

select * from ticket


