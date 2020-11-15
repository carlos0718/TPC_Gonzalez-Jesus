using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Ticket
    {
		/*
		ticketuid int identity(1,1) primary key,    /* identificador unico para todos los tickets 
		ticketid int not null,      /* identificador para cada ticket de su propia clase 
		clase varchar(20) not null,
		fecha_creacion date default CURRENT_TIMESTAMP,
		fecha_fin date,
		descripcion varchar(300) not null,
		estado varchar(20) not null default 'NUEVO',
		detalle varchar( 3000),
		urgencia int not null default 5,
		clasificacionid int not null foreign key REFERENCES CLASIFICACION(clasificacionid),
			*/
		//uint ticketuid;
		uint ticketid;
		string clase;
		DateTime fecha_creacion;
		DateTime fecha_fin;
		string descripcion;
		string estado;
		string detalle;
		byte urgencia;
		byte clasificacionid;

    }
}
