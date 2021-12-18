using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Persona
    {
        public int DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime Fecha_nacimiento { get; set; }
        public DateTime Fecha_alta { get; set; }
        public bool Cliente { get; set; }
        public bool Alta { get; set; }
        public bool Activo { get; set; }
        public string Password { set { Password = value; } }
    }
}
