select * from ticket

drop table ticket



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
	VALUES ('INCIDENTE', 'Apagado automatico',' UN cliente reporta que su pc se apaga sola'

