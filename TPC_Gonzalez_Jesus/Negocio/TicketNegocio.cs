using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

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
           

            conn.lector = conn.Select( 
                    String.Format("select * from ticket where ticketid={0}",id)
                    );

            

            while (conn.lector.Read())
            {
                ticket = new Ticket();

                ticket.ticketid = (uint)conn.lector.GetInt32(0);
                ticket.clase = conn.lector.GetString(1);
                ticket.descripcion = conn.lector.GetString(4);
            }
            //string col1Value = rdr["ColumnOneName"].ToString();
            //aux.Ticket.clase = conn.lector.GetInt32(0);


            // try
            // {
            //     aux.codArticulo = lector.GetString(1);
            // }
            // catch (Exception)
            // { aux.codArticulo = "Sin codigo"; }

            // aux.Nombre = lector.GetString(2);

            // try
            // {
            //     aux.Descripcion = lector.GetString(3);
            // }
            // catch { aux.Descripcion = "Sin descripcion"; }




            // aux.marca = new Marca();
            // aux.categoria = new Categoria();
            // aux.marca.ID = lector.GetInt32(4);
            // aux.categoria.ID = lector.GetInt32(5);

            // aux.marca.Descripcion = lector.GetString(6);
            // aux.categoria.Descripcion = lector.GetString(7);

            // aux.Precio = (float)lector.GetDecimal(8);

        }
        int CrearIncidente()
        {
            //ConexionBase conexionBase = new ConexionBase();
            //sentenciaSql = "select * from ticket";
            //conexionBase.Select(sentenciaSql);

            return -1;
        }



    }

    //public List<string> ObtenerClaseTickets ()
    //{
        

    //}



}
