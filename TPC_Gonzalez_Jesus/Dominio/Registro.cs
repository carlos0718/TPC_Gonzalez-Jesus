using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Registro
    {
		public uint  Registroid { get; set; }
		public string Descripcion { get; set; }
		public string Detalle { get; set; }
		public string Clase { get; set; }
		public uint Ticketid { get; set; }
		public DateTime Fecha_creacion { get; set; }
		public uint Creadopor { get; set; }
		public string Creadopor_str { get; set; }



	}
}
