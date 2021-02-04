using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace SistemaDeTickets
{
    public partial class Prueba : System.Web.UI.Page
    {
        List<string> opcionesDeTicket;
        protected void Page_Load(object sender, EventArgs e)
        {

            


            // Creacion de un ticket nuevo:
            TicketNegocio tkt = new TicketNegocio();
            ddl_ListaClases.DataSource = tkt.ticket.ClasesTicket;
            ddl_ListaClases.DataBind();
            ddl_Urgencia.DataSource = tkt.ticket.Urgencias;
            ddl_Urgencia.DataBind();
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
           
            if (tb_Ticketid.Text != String.Empty)
            {
                TicketNegocio tkt = new TicketNegocio();

                tkt.ObtenerTicket(Int32.Parse(tb_Ticketid.Text));
                lbl_Ticketid_value.Text = tkt.ticket.ticketid.ToString();
                lblClaseTicket_Value.Text = tkt.ticket.descripcion;

            }


        }
    }
}