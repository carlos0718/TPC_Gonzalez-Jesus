using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    class TicketNegocio
    {
        Dominio.Ticket Ticket { get; set; }
        List<string> ClaseTicket { get; }
        TicketNegocio()
        {
            Ticket = new Ticket();
            ClaseTicket = new List<string>();
            ClaseTicket.Add("INCIDENTE");
            ClaseTicket.Add("SOLICITUD");
            ClaseTicket.Add("PROBLEMA");
            ClaseTicket.Add("OT");
        }

        int CrearIncidente()
        {
            ConexionBase conexionBase = new ConexionBase();
            sentenciaSql = "select * from ticket";
            conexionBase.Select(sentenciaSql);


            return -1;
        }



    }



}
