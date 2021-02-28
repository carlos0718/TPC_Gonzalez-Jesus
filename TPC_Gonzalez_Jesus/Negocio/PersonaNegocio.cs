using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class PersonaNegocio
    {

        Persona persona = new Persona();
        public Persona Persona { get { return persona; } }
        ConexionBase conn = new ConexionBase();


        public void ObtenerPersona(int DNI)
        {
            conn.Lector=conn.Select("select apellido,nombre,fecha_nacimiento,fecha_alta,cliente from persona where DNI=" + DNI.ToString());
            while (conn.Lector.Read())
            {

                persona.Apellido = conn.Lector.GetString(0);
                persona.Nombre= conn.Lector.GetString(1);
                persona.Fecha_nacimiento = conn.Lector.GetDateTime(2);
                persona.Fecha_alta = conn.Lector.GetDateTime(3);
                persona.Cliente= conn.Lector.GetBoolean(4);
                
            }
            conn.Cerrar();
        }


        public int RegistrarPersona(int DNI  ,string  _nombre,string _apellido,string _nacimiento, bool _esCliente, string _password)
        {
            string sentencia = String.Format("{0} , '{1}' , '{2}' , '{3}' , {4} , '{5}' ", DNI, _nombre, _apellido, _nacimiento, _esCliente ? 1 : 0 ,_password);
            conn.Lector = conn.ExecuteSP("sp_crearUsuarioNuevo", sentencia);

            int return_code = 0;
            while (conn.Lector.Read())
            {
                return_code = conn.Lector.GetInt32(0);
            }

            conn.Cerrar();
            return return_code;
        }


        public int LogInPersona ( int DNI, string _password)
        {
            int return_code = 0;
            string sentencia = String.Format("{0} , '{1}'", DNI, _password);

            conn.Lector = conn.ExecuteSP("sd_loguearUsuario", sentencia);

            while (conn.Lector.Read())
            {
                return_code = conn.Lector.GetInt32(0);
            }

            conn.Cerrar();
            return return_code; // Si regresa 0, referencia logueo incorrecto, si regresa un DNI, indicara el usuario logueado.
        }

    }
}
