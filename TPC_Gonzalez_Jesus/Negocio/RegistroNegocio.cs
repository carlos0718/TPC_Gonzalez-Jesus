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
        public int InsertarRegistro(string _descripcion,string _detalle, string _clase,uint _ticketid , int _creadopor_dni)
        {
            string sentencia = String.Format("insert into registro(descripcion, detalle, clase, ticketid, creadopor) values ('{0}' , '{1}' , '{2}' , {3}, {4} )",  _descripcion, _detalle, _clase, _ticketid, _creadopor_dni);
            
            //System.Diagnostics.Debug.WriteLine("RegistroNegocio|Insertarregistro: " + sentencia);
            
            int filas_afectadas = conn.InsertUpdateDel(sentencia);
            
            return filas_afectadas; //Si devuelve 0, indica error. Caso contrario devolverá el numero de ticket creado
            
        }
    }
}
