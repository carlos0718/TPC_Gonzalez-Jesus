﻿using System;
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
		public uint ticketid { get; set; }
		public string clase { get; set; }
		
		public DateTime fecha_creacion { get; set; }
		public DateTime fecha_fin { get; set; }
		public string descripcion { get; set; }
		public string Estado { get; set; }
		public string detalle { get; set; }
		public byte Urgencia { get; set; }
		public byte clasificacionid { get; set; }
		public string Clasificacion_str { get; set; }
		public bool Historico { get; set; }
		public uint Creadopor { get; set; }
		public string Creadopor_str { get; set; }
		public uint Reportadopor { get; set; }
		public string Reportadopor_str{ get; set; }
		public uint Propietario { get; set; }
		public string Propietario_str { get; set; }
		public uint Grupo_propietario { get; set; }
		public string Grupo_Propietario_str { get; set; }

		public List<byte> Urgencias { get; }

		public List<string> EstadosIncidente { get; }

		public List<string> ClasesTicket { get; }

		public Ticket()
        {
			ClasesTicket=new List<string>(new string[] { "INCIDENTE", "SOLICITUD", "PROBLEMA","OT" } );
            Urgencias = new List<byte>(new byte[] { 1, 2, 3, 4, 5 });
			EstadosIncidente = new List<string>(new string[] { "NUEVO", "EN COLA", "EN PROGRESO", "RESUELTO", "CANCELADO", "CERRADO" });
		}
    }
}
