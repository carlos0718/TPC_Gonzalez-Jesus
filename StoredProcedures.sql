

	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
	/* ============																											 ============ */
	/* ============									 PROCEDIMIENTOS ALMACENADOS											     ============ */
	/* ============																											 ============ */
	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
use master
go

use TPC_GONZALEZ_JESUS
go


	/* ============									 CREAR NUEVO USUARIO										     ============ */

begin if (OBJECT_ID(N'sp_crearUsuarioNuevo') is not null) 
drop procedure sp_crearUsuarioNuevo end

go

create procedure sp_crearUsuarioNuevo (
		@DNI int,
		@nombre varchar(100),
		@apellido varchar(100),
		@fecha_nacimiento date	,
		@cliente bit,
		@password varchar(64)
)
as

begin
	begin try
		 if  exists (select 1 from PERSONA where DNI=@DNI) begin
			select 0 as code,'Error el DNI ya se encuentra cargado' as [message]
			return
		end 
		
		insert into persona (DNI,nombre,apellido,fecha_nacimiento,cliente) values (@DNI,@nombre,@apellido,@fecha_nacimiento,@cliente) 
		IF not (@password IS NULL OR @password = '')
			insert into [password] (DNI,password_login) values (@DNI,HASHBYTES('SHA2_512', @password) )
		select  @dni as code,'Se cargo ok el DNI: '+cast(@DNI as varchar(10) ) as  [message]
	end try
	begin catch
		select ERROR_MESSAGE() as Error
	end catch
end

go


	/* ============									 Loguear usuario										     ============ */

begin if (OBJECT_ID(N'sd_loguearUsuario') is not null) 
drop procedure sd_loguearUsuario end

go

create procedure sd_loguearUsuario (
		@dni int,
		@password varchar(64)
)
as
begin
	begin try
		if exists (select 1 from persona per inner join password pass on per.dni=pass.dni
					where per.DNI=@dni and pass.password_login=(HASHBYTES('SHA2_512', @password)))
			select @DNI as [return]
		else 
			select 0 as [return]
	end try
	begin catch
		select ERROR_MESSAGE() as Error
	end catch
end
go


	/* ============									 CREAR INCIDENTE										     ============ */
begin if (OBJECT_ID(N'sp_crearTicketNuevo') is not null) 
drop procedure sp_crearTicketNuevo end

go

/* Procedimiento de Almacenado para crear incidentes */ 
CREATE PROCEDURE sp_crearTicketNuevo(
	@clase varchar(20),@descripcion varchar(300),	@detalle varchar ( 3000),	@urgencia tinyint ,	@clasificacionid tinyint,	
	@creadopor int,	 @reportadopor int
)

AS
begin 
	declare @succes bit=0
	begin try
		insert into [TICKET] (clase,descripcion,detalle,estado,urgencia,clasificacionid,creadopor,reportadopor) 
		VALUES	( @clase, @descripcion,@detalle,'NUEVO',@urgencia,@clasificacionid,@creadopor,@reportadopor)

		set @succes = case when @@rowcount =0 then 0 else 1 end 

		declare @ticketid int = SCOPE_IDENTITY() -- Asigna el valor a la ultima PK creada, en este caso el ticketID 

		insert into [tkhistory] (ticketid,estado)
		values (@ticketid,'NUEVO')


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
		-- select 'Error' as Mensaje -- Definir mensaje de error
		RAISERROR('Error grave al generar nuevo ticket',16,1)
		select 0 as ticketid
	end

end
go

	/* ============									 AVANZAR ESTADO TICKET				 ============ */
--begin if (OBJECT_ID(N'sp_avanzarEstadoTicket') is not null) 
--drop procedure sp_avanzarEstadoTicket end

--go

CREATE PROCEDURE sp_avanzarEstadoTicket(
	@ticketid int, @usuario int , @nuevoestado varchar(20)
)
AS
begin
	begin try
		if (@nuevoestado='RESUELTO' or @nuevoestado='CANCELADO')
			update ticket set estado = @nuevoestado,historico = 1,fecha_fin=current_timestamp where ticketid = @ticketid
		else
			update ticket set estado = @nuevoestado where ticketid = @ticketid
		insert into tkhistory (ticketid,estado) values (@ticketid,@nuevoestado)
	end try
	begin catch
		
		select ERROR_MESSAGE() as Error
	end catch
end
go
 
	/* ============									 ASIGNAR PROPIETARIO A TICKET				 ============ */
begin if (OBJECT_ID(N'sp_asignarPropietarioTicket') is not null) 
drop procedure sp_asignarPropietarioTicket end

go

CREATE PROCEDURE sp_asignarPropietarioTicket(
	@ticketid int, @nuevopropietario int , @nuevogrupopropietario tinyint
)

AS
begin
	begin try
		if @nuevopropietario=null 
			update ticket set grupo_propietario = @nuevogrupopropietario where ticketid = @ticketid
		else begin
			update ticket set propietario = @nuevopropietario,grupo_propietario=@nuevogrupopropietario where ticketid = @ticketid
			insert into tkhistory (ticketid,estado,propietario) values (@ticketid, (select estado from ticket where ticketid=@ticketid) ,@nuevopropietario)
		end
	end try
	begin catch
		
		select ERROR_MESSAGE() as Error
	end catch
end



	/* ============									 ASIGNAR PERSONA A GRUPO				 ============ */
begin if (OBJECT_ID(N'sp_asignarPersonaAGrupo') is not null) 
drop procedure sp_asignarPersonaAGrupo end

go

CREATE PROCEDURE sp_asignarPersonaAGrupo(
	@dni int, @AREA varchar (20)
)
AS
begin
	begin try
		if (exists (select 1 from GRUPOTRABAJO where dni=@dni and Area=@area ) ) 
			select -1 as return_code , 'El usuario ya se encuentra cargado en esa area' as mensaje
		else
			insert into GRUPOTRABAJO (dni,area) values (@dni,@area)
		
	end try
	begin catch
		
		select ERROR_MESSAGE() as Error
	end catch
end

go

-- ===================================================================	

	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
	/* ============																											 ============ */
	/* ============									 		 TRIGGERS	             										 ============ */
	/* ============																											 ============ */
	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */

CREATE TRIGGER trg_CheckHistorico   
ON ticket FOR UPDATE
AS 
begin
	if ( (select historico from deleted) = 1 ) begin
	
		select 'Error, el ticket ya se encuentra cerrado!' as code
		ROLLBACK TRANSACTION
		return
	end
end
 go 

enable trigger trg_CheckHistorico on ticket
go