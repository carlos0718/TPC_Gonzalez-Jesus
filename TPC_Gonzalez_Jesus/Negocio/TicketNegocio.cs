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



    }

    //public List<string> ObtenerClaseTickets ()
    //{
        

    //}



}
