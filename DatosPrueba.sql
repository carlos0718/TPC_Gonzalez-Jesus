use master
go

use TPC_GONZALEZ_JESUS
go

/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */
/* ============									DATOS DE PRUEBA														     ============ */
/* ============   ============   ============  ============   ============   ============  ============   ============   ============ */


--PERSONAS
--exec sp_crearUsuarioNuevo @DNI int,@nombre varchar(100),@apellido varchar(100),@fecha_nacimiento date	,@cliente bit,@password varchar(64)

exec sp_crearUsuarioNuevo 37189215,'Matias','Gonzalez','1993-05-16' ,0, 'prog2021'
exec sp_crearUsuarioNuevo 95346499,'Carlos','Jesus','1992-02-07' ,0, 'prog2021'
exec sp_crearUsuarioNuevo 11111111,'Angel','Simon','1990-01-01' ,0, 'profesor'
exec sp_crearUsuarioNuevo 22458962,'Marcelo','Goiti','1985-11-24' ,0, 'generica'
exec sp_crearUsuarioNuevo 22458963,'Jimena','Carni','1995-08-21' ,0, 'generica'


exec sp_crearUsuarioNuevo 18692421,'Juan','Perez','1993-05-16' ,1, 'generica'
exec sp_crearUsuarioNuevo 18692422,'Pedro','Calac','1993-05-16' ,1, 'generica'
exec sp_crearUsuarioNuevo 18692423,'Daniel','Ayala','1993-05-16' ,1, 'generica'
exec sp_crearUsuarioNuevo 18692424,'Paula','Campos','1993-05-16' ,1, 'generica'
exec sp_crearUsuarioNuevo 18692425,'Estaban','Molina','1993-05-16' ,1, 'generica'

	--GRUPOS DE TRABAJO
exec sp_asignarPersonaAGrupo 95346499,'ADMINISTRATIVO'
exec sp_asignarPersonaAGrupo 37189215,'ADMINISTRATIVO'
exec sp_asignarPersonaAGrupo 37189215,'SUPERVISOR'
exec sp_asignarPersonaAGrupo 22458962,'TECNICO'
exec sp_asignarPersonaAGrupo 22458963,'TECNICO'

	--DOMINIOS
insert into DOMINIOS (tipo_dominio,valor_texto) values   ('TIPO TICKET','INCIDENTE'),('TIPO TICKET','SOLICITUD'),('TIPO TICKET','ORDEN DE TRABAJO'),
														('ESTADO ACTIVO','OPERATIVO'),('ESTADO ACTIVO','BAJA')

insert into DOMINIOS (tipo_dominio,valor_texto,	valor_entero) values  
													('AREA','TECNICO',3),('AREA','ADMINISTRATIVO',2),('AREA','CLIENTE',1),('AREA','SUPERVISOR',4),
													('ESTADO','NUEVO',0),('ESTADO','EN COLA',1),('ESTADO','EN PROGRESO',2),('ESTADO','RESUELTO',3),('ESTADO','CANCELADO',3)

insert into DOMINIOS (tipo_dominio,valor_entero) values ('URGENCIA',1),('URGENCIA',2),('URGENCIA',3),('URGENCIA',4),('URGENCIA',5)

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

	
	--	INFO CONTACTO

INSERT INTO infocontacto (dni,telefono,mail,direccion) VALUES (37189215,'1141999872','matias.egs@gmail.com','Calle Quintana 351, Tigre'),
															 (95346499,'1162677682','cajs0718@gmail.com','Calle Pellegrini 2030, San Fernando'),
															 (11111111,'1141229231','angel.simon@hotmail.com','Calle Las Tunas 155, Pacheco'),
															 (18692421,'1167999960','juan.perez@hotmail.com','Calle Perez 666, Moreno'),
															 (18692422,'1195024209','pedro.calac@gmail.com','Calle Perón 1111, San Fernando'),
															 (18692423,'1175124022','daniel.ayala@gmail.com','Calle Ayala 777, Lanús'),
															 (18692424,'1135254533','paula.campos@outlook.com','Calle Sobremonte 2177, Virreyes'),
															 (18692425,'1150252509','esteban.molina@outlook.com','Calle Suipacha 2017, Victoria')



 -- TICKETS
 

/*CREATE PROCEDURE sp_crearTicketNuevo(
	@clase varchar(20),@descripcion varchar(300),	@detalle varchar ( 3000),	@urgencia tinyint ,	@clasificacionid tinyint,	
	@creadopor int,	 @reportadopor int  Si creador = cliente por autoservicio => reportadopor=creadorpor */

exec sp_crearTicketNuevo 'SOLICITUD' , 'Cambio de equipo' , ' El cliente quiere un equipo nuevo completo' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'SOLICITUD' , 'Cambio de equipo' , ' El cliente quiere un equipo nuevo completo' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'SOLICITUD' , 'Instalción de S.O' , ' Se necesita  instalar S.O en los equipos nuevos ' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'SOLICITUD' , 'Alta de usuario' , ' Se necesita crear usuario de cleinte nuevo' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'INCIDENTE' , 'Pc con lentitud' , ' Se necesita verificar el porque de la lentiud' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'INCIDENTE' , 'Agregar memoria ram' , ' Agregar menoria de 8gb a equipo de cliente ' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'INCIDENTE' , 'Cambio de disco' , ' Cambiar disco hdd a ssd en equipo de cliente' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'INCIDENTE' , 'Cambio de toner ' , ' Poner toner nuevo en impresora de cliente' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'INCIDENTE' , 'Outlook no recibe mails' , ' Verficar el error de Outlook' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'INCIDENTE' , 'Papel atascado en impresora' , ' Se necesita sacar papel atascado del rodete' , 5 ,  10, 18692425,18692425
exec sp_crearTicketNuevo 'INCIDENTE' , 'Agregar impresora a pc' , ' Se necesita agregar impresora que está en red a la pc del cliente' , 5 ,  10, 18692425,18692425


 -- REGISTROS

insert into REGISTRO (clase,creadopor,descripcion,detalle,ticketid) values

				('INCIDENTE',37189215,'Contacto telefonico', 'Se contacta al cliente para corroborar el prolema',7),
				('INCIDENTE',37189215,'Contacto telefonico', 'Se contacta al cliente para corroborar el prolema',2),
				('INCIDENTE',37189215,'Visita', 'Acercamiento al equipo. Se verifica el problema. Queda pendiente pedido de repuesto',2),
				('INCIDENTE',37189215,'Contacto telefonico', 'Se contacta al cliente para corroborar el prolema',5),
				('INCIDENTE',37189215,'Visita', 'Acercamiento al equipo. Se verifica el problema. Queda pendiente pedido de repuesto',8),
				('SOLICITUD',95346499,'Contacto por mail','Se indica a usuario que la solicitud está a espera de aprobación de su jefe',1),
				('SOLICITUD',11111111,'Contacto telefónico', 'Se llama a usuario que pactar hora y fecha para la visita del técnico',1)


	-- AVANCE DE TICKET
	--CREATE PROCEDURE sp_asignarPropietarioTicket(
	--@ticketid int, @nuevopropietario int , @nuevogrupopropietario tinyint

	
--CREATE PROCEDURE sp_avanzarEstadoTicket(
--	@ticketid int, @usuario int , @nuevoestado varchar(20)

exec sp_asignarPropietarioTicket 6,37189215,2
exec sp_avanzarEstadoTicket 3,372189215,'EN COLA'

exec sp_asignarPropietarioTicket 10,22458963,3
exec sp_avanzarEstadoTicket 10,22458963,'EN PROGRESO'
exec sp_avanzarEstadoTicket 10,22458963,'RESUELTO'


exec sp_asignarPropietarioTicket 1,11111111,4
exec sp_avanzarEstadoTicket 1,11111111,'EN PROGRESO'

exec sp_asignarPropietarioTicket 4,95346499,2
exec sp_avanzarEstadoTicket 4,95346499,'EN PROGRESO'
exec sp_avanzarEstadoTicket 4,95346499,'RESUELTO'


/* ================================= */

select * from persona

select * from ticket tk inner join clasificacion cls on tk.clasificacionid=cls.clasificacionid 

select * from grupos

select * from ticket_detalle

select * from infocontacto

select * from dominios

select * from CLASIFICACION

select * from registro 

select * from tkhistory

select * from GRUPOTRABAJO




