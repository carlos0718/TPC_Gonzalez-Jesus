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

        public void ObtenerTicket(int id)
        {
           

            conn.Lector = conn.Select( 
                    String.Format("select * from ticket where ticketid={0}",id)
                    );

            

            while (conn.Lector.Read())
            {
                ticket = new Ticket();

                ticket.ticketid = (uint)conn.Lector.GetInt32(0);
                ticket.clase = conn.Lector.GetString(1);
                ticket.descripcion = conn.Lector.GetString(4);
            }
            //string col1Value = rdr["ColumnOneName"].ToString();
            //aux.Ticket.clase = conn.Lector.GetInt32(0);


            // try
            // {
            //     aux.codArticulo = Lector.GetString(1);
            // }
            // catch (Exception)
            // { aux.codArticulo = "Sin codigo"; }

            // aux.Nombre = Lector.GetString(2);

            // try
            // {
            //     aux.Descripcion = Lector.GetString(3);
            // }
            // catch { aux.Descripcion = "Sin descripcion"; }




            // aux.marca = new Marca();
            // aux.categoria = new Categoria();
            // aux.marca.ID = Lector.GetInt32(4);
            // aux.categoria.ID = Lector.GetInt32(5);

            // aux.marca.Descripcion = Lector.GetString(6);
            // aux.categoria.Descripcion = Lector.GetString(7);

            // aux.Precio = (float)Lector.GetDecimal(8);

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

            conn.Lector=conn.Select(sentencia);
            BindingList<Ticket> lista = new BindingList<Ticket>();
            Ticket aux;
            
            while  (conn.Lector.Read())
            {
                aux = new Ticket();
                
                aux.ticketid= (uint)conn.Lector.GetInt32(0);
                aux.descripcion = conn.Lector.GetString(1);
                aux.Estado= conn.Lector.GetString(2);
                aux.Urgencia= conn.Lector.GetByte(3);
                aux.fecha_creacion = conn.Lector.GetDateTime(4);
                try
                {
                    aux.fecha_fin = conn.Lector.GetDateTime(5);
                }catch
                { }
                
                aux.Historico = conn.Lector.GetBoolean(6);

                lista.Add(aux);
            }

            return lista;

        }

    }



    //public List<string> ObtenerClaseTickets ()
    //{


    //}



}
