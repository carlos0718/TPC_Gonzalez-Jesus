using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data;
using System.ComponentModel;

namespace Negocio

{
    public class TicketNegocio
    {
        public Ticket ticket { get; set; }

        ConexionBase conn;
        public TicketNegocio()
        {
            ticket = new Ticket();
            conn = new ConexionBase();
        }

        public Ticket ObtenerTicket(int id)
        {

            string sentencia = String.Format("select ticketid,clase,descripcion,detalle,reportadopor,creadopor,propietario,grupo_propietario," +
                                               "fecha_creacion,fecha_fin,urgencia,historico,estado" +
                                                   " from ticket where ticketid={0}", id);
            conn.Lector = conn.Select(sentencia);

            Ticket aux = new Ticket();
            aux.ticketid = 0;

            while (conn.Lector.Read())
            {
                aux.ticketid = (uint)conn.Lector.GetInt32(0);
                aux.clase = conn.Lector.GetString(1);
                aux.descripcion = conn.Lector.GetString(2);
                aux.detalle = conn.Lector.GetString(3);
                aux.Reportadopor = (uint)conn.Lector.GetInt32(4);
                aux.Creadopor = (uint)conn.Lector.GetInt32(5);
                if (!conn.Lector.IsDBNull(6))
                    aux.Propietario = (uint)conn.Lector.GetInt32(6);
                else
                    aux.Propietario = 0;
                if (!conn.Lector.IsDBNull(7))
                    aux.Grupo_propietario = (uint)conn.Lector.GetByte(7);
                else
                    aux.Grupo_propietario = 0;
                aux.fecha_creacion = conn.Lector.GetDateTime(8);
                if (!conn.Lector.IsDBNull(9))
                    aux.fecha_fin = conn.Lector.GetDateTime(9);
                else
                    aux.fecha_fin = DateTime.MinValue;
                aux.Urgencia = conn.Lector.GetByte(10);
                aux.Historico = conn.Lector.GetBoolean(11);
                aux.Estado= conn.Lector.GetString(12);
            }
   
            conn.Cerrar();
            return aux;

        }
        int CrearIncidente()
        {
            //ConexionBase conexionBase = new ConexionBase();
            //sentenciaSql = "select * from ticket";
            //conexionBase.Select(sentenciaSql);

            return -1;
        }

        public BindingList<Ticket> ObtenerTablaPorReportado(int reportadopor) // 0 reportadopor - 1 propietario 
        {

            string sentencia = "select ticketid,descripcion,estado,urgencia,fecha_creacion,fecha_fin,historico from ticket where reportadopor=" + reportadopor.ToString();

            conn.Lector = conn.Select(sentencia);
            BindingList<Ticket> lista = new BindingList<Ticket>();
            Ticket aux;

            while (conn.Lector.Read())
            {
                aux = new Ticket();

                aux.ticketid = (uint)conn.Lector.GetInt32(0);
                aux.descripcion = conn.Lector.GetString(1);
                aux.Estado = conn.Lector.GetString(2);
                aux.Urgencia = conn.Lector.GetByte(3);
                aux.fecha_creacion = conn.Lector.GetDateTime(4);
                try
                {
                    aux.fecha_fin = conn.Lector.GetDateTime(5);
                } catch
                { }

                aux.Historico = conn.Lector.GetBoolean(6);

                lista.Add(aux);
            }

            return lista;

        } 

        public int CrearTicket(string _clase,string _descripcion,string _detalle , int _urgencia , int _clasificacionid, uint _creadopor, uint _reportadorpor)
        {
            string sentencia = String.Format("'{0}' , '{1}' , '{2}' , {3}, {4} ,{5} ,{6}",_clase,_descripcion,_detalle,_urgencia,_clasificacionid,_creadopor,_reportadorpor);
            conn.Lector=conn.ExecuteSP("sp_crearTicketNuevo", sentencia);

            int return_code = 0;
            while (conn.Lector.Read())
            {
                return_code = conn.Lector.GetInt32(0);
            }


            return return_code; //Si devuelve 0, indica error. Caso contrario devolverá el numero de ticket creado
        }


        public BindingList<Ticket> ObtenerTablaPorPropietario(int _propietario,byte _incluye_historico) // 0 reportadopor - 1 propietario 
        {

            string sentencia = String.Format("select ticketid,descripcion,estado,urgencia,fecha_creacion,grupo_propietario,reportadopor," +
                "(select nombre from clasificacion where clasificacionid = tk.clasificacionid),clase from ticket tk" +
                " where historico={0} and propietario={1}" ,_incluye_historico, _propietario.ToString());

            conn.Lector = conn.Select(sentencia);
            BindingList<Ticket> lista = new BindingList<Ticket>();
            Ticket aux;

            while (conn.Lector.Read())
            {
                aux = new Ticket();

                aux.ticketid = (uint)conn.Lector.GetInt32(0);
                aux.descripcion = conn.Lector.GetString(1);
                aux.Estado = conn.Lector.GetString(2);
                aux.Urgencia = conn.Lector.GetByte(3);
                aux.fecha_creacion = conn.Lector.GetDateTime(4);
                try
                {
                    aux.Grupo_propietario = (uint)conn.Lector.GetInt32(5);
                }
                catch {
                    aux.Grupo_propietario = 0;
                }

                try
                {
                    aux.Reportadopor= (uint)conn.Lector.GetInt32(6);
                }
                catch
                { }

                aux.Clasificacion_str = conn.Lector.GetString(7);
                aux.clase = conn.Lector.GetString(8);

                lista.Add(aux);
            }

            return lista;

        }

        public bool ActualizarDescTicket(Ticket tk)
        {
            string sentencia = String.Format("update ticket set descripcion='{0}' , detalle='{1}' where ticketid={2}", tk.descripcion, tk.detalle,tk.ticketid);

            try
            {
                conn.InsertUpdateDel(sentencia);

                conn.Cerrar();
                return true;
            }
            catch
            {
                conn.Cerrar();
                return false;
            }

        }

        public bool AvanzarEstadoTicket(Ticket tk, string estado)
        {
            string parametros = String.Format("{0} , {1} , '{2}'", tk.ticketid, tk.Propietario, estado);

            try
            {
                conn.ExecuteSP("sp_avanzarEstadoTicket ", parametros);
                conn.Cerrar();
                return true;
            }catch
            {
                conn.Cerrar();
                return false;
            }
            



        }

        public bool AsignarPropietario(Ticket tk, int  nuevo_propietario ,int nuevo_grupopropietario)
        {
            string parametros = String.Format("{0} , {1} , '{2}'", tk.ticketid, nuevo_propietario, nuevo_grupopropietario);

            
            try
            {
                conn.ExecuteSP("sp_asignarPropietarioTicket ", parametros);
                conn.Cerrar();
                return true;
            }
            catch
            {
                conn.Cerrar();
                return false;
            }




        }

        public BindingList<Ticket> ObtenerTicketsSinPropietario(int grupo_propietario) 
        {

            string sentencia = String.Format("select ticketid,descripcion,estado,urgencia,fecha_creacion,grupo_propietario,reportadopor," +
                "(select nombre from clasificacion where clasificacionid = tk.clasificacionid),clase from ticket tk" +
                " where historico=0 and propietario is null or estado='NUEVO'");

            conn.Lector = conn.Select(sentencia);
            BindingList<Ticket> lista = new BindingList<Ticket>();
            Ticket aux;

            while (conn.Lector.Read())
            {
                aux = new Ticket();

                aux.ticketid = (uint)conn.Lector.GetInt32(0);
                aux.descripcion = conn.Lector.GetString(1);
                aux.Estado = conn.Lector.GetString(2);
                aux.Urgencia = conn.Lector.GetByte(3);
                aux.fecha_creacion = conn.Lector.GetDateTime(4);
                try
                {
                    aux.Grupo_propietario = (uint)conn.Lector.GetInt32(5);
                }
                catch
                {
                    aux.Grupo_propietario = 0;
                }

                try
                {
                    aux.Reportadopor = (uint)conn.Lector.GetInt32(6);
                }
                catch
                { }

                aux.Clasificacion_str = conn.Lector.GetString(7);
                aux.clase = conn.Lector.GetString(8);

                lista.Add(aux);
            }

            return lista;

        }
    }



    //public List<string> ObtenerClaseTickets ()
    //{


    //}



}
