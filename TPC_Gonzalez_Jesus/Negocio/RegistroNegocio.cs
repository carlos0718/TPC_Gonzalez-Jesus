using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class RegistroNegocio
    {
        public Registro registro{ get; set; }

        ConexionBase conn;
        public RegistroNegocio()
        {
            registro = new Registro();
            conn = new ConexionBase();
        }


        public BindingList<Registro> ObtenerRegistrosTicket ( int ticketid)
        {

            string sentencia = "select descripcion,detalle,fecha_creacion,creadopor " +
                               "from registro "+
                                "where ticketid=" + ticketid.ToString();

            conn.Lector = conn.Select(sentencia);
            BindingList<Registro> lista = new BindingList<Registro>();
            Registro aux;

            while (conn.Lector.Read())
            {
                aux = new Registro();

                aux.Descripcion = conn.Lector.GetString(0);
                aux.Detalle = conn.Lector.GetString(1);
                aux.Fecha_creacion = conn.Lector.GetDateTime(2);
                aux.Creadopor = (uint)conn.Lector.GetInt32(3);

                lista.Add(aux);
            }

            return lista;



        }
        public void InsertarRegistro(Ticket tk,string descripcion,string detalle)
        {
            //string sentencia = String.Format("insert into registro '")
            //    ('INCIDENTE', 37189215, 'Contacto telefonico', 'Se contacta al cliente para corroborar el prolema', 7)
        }
    }
}
