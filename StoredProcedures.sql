

	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
	/* ============																											 ============ */
	/* ============									 PROCEDIMIENTOS ALMACENADOS											     ============ */
	/* ============																											 ============ */
	/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */

use TPC_GONZALEZ_JESUS
go


	/* ============									 CREAR NUEVO USUARIO										     ============ */
alter procedure sp_crearUsuarioNuevo (
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
		select ERROR_MESSAGE()
	end catch
end


exec sp_crearUsuarioNuevo 37189215,'Matias','Gonzalez','1993-05-16',0, 'prog2021'
select * from persona


	/* ============									 Loguear usuario										     ============ */
alter procedure sd_loguearUsuario (
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
		select ERROR_MESSAGE()
	end catch
end


exec sd_loguearUsuario 37189215,'prog2021'


	/* ============									 CREAR INCIDENTE										     ============ */
begin if (OBJECT_ID(N'sp_crearIncidenteNuevo') is not null) 
drop procedure sp_crearIncidenteNuevo end

go

/* Procedimiento de Almacenado para crear incidentes */ 
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
		-- select 'Error' as Mensaje -- Definir mensaje de error
		RAISERROR('Error grave al generar nuevo ticket',16,1)
	end

end

	/* Procedimiento Almacenado para crear usuarios*/
CREATE PROCEDURE altaUsuario( @apellido VARCHAR(100),@nombre VARCHAR(100),@fechaNac DATE, @dni int,@cliente bit)
AS
BEGIN
	BEGIN TRY

		INSERT into PERSONA (apellido, nombre, fecha_nacimiento,fecha_alta,DNI,cliente) 
		VALUES ( @apellido,@nombre,@fechaNac,GETDATE(),@dni,@cliente)

	END TRY
	BEGIN CATCH
		RAISERROR('Error al crear usurio nuevo',16,1)
	END CATCH
END



