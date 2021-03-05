using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
namespace SistemaDeTickets
{
    public partial class _Default : Page
    {

        TicketNegocio negocio = new TicketNegocio();
        Ticket tk;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
                return;
            tk = negocio.ObtenerTicket(Int32.Parse(Request.QueryString["ticketid"]));
            PoblarDatosTicket(tk);



        }
        protected void DdlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //List<string> tiposDeEstado;
            
            //tiposDeEstado = new List<string>();
            //tiposDeEstado.Add("Nuevo");
            //tiposDeEstado.Add("En Espera");
            //tiposDeEstado.Add("En Progreso");
            //tiposDeEstado.Add("Resuelto");
            //tiposDeEstado.Add("Cerrado");
            //tiposDeEstado.Add("Cancelado");
            //DdlStatus.DataValueField = tiposDeEstado.ToString();
      
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            tk = negocio.ObtenerTicket(Int32.Parse(txtb_Buscar.Text));
            if (tk.ticketid == 0)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "s", "window.alert('El ticket no existe!');", true);
            else
                PoblarDatosTicket(tk);
                
        }

        void PoblarDatosTicket(Ticket _ticket)
        {
            txtb_Ticketid.Text = _ticket.ticketid.ToString();
            TxtAffectedUser.Text = _ticket.Reportadopor.ToString();
            TxtCreator.Text = _ticket.Creadopor.ToString();
            txtb_Esatdo.Text = _ticket.Estado;

            //ddl_Propietario.Items.Insert(0, new ListItem(_ticket.Propietario.ToString()));

            txtb_Propietario.Text = _ticket.Propietario.ToString();
            txtb_GrupoPropietario.Text = _ticket.Grupo_propietario.ToString();

            txtb_Descripcion.Text = _ticket.descripcion;
            txtb_Detalle.Text = _ticket.detalle;
        }
    }
}