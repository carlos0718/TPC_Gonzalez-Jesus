using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Dominio;

namespace SistemaDeTickets
{
    public partial class DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                MostrarDashBoardTicketsPropios();
                
        }



        
        protected void a_DashBoard_ServerClick(object sender, EventArgs e)
        {

        }

        protected void dg_Tickets_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "btn_TkGrid_Reg")
            {
                Response.Redirect("Default.aspx?ticketid=" + e.Item.Cells[0].Text);  // envia el numero de ticket
                //Response.Write(e.Item.Cells[0].Text);
                //RegistroNegocio negocio = new RegistroNegocio();
                //dg_Registros.DataSource = new BindingSource(negocio.ObtenerRegistrosTicket( Int32.Parse(e.Item.Cells[0].Text) ), null);

                //dg_Registros.DataBind();
            }
        }

        void MostrarDashBoardTicketsPropios()
        {
            TicketNegocio tk = new TicketNegocio();

            dg_Tickets.DataSource = new BindingSource(tk.ObtenerTablaPorPropietario(37189215), null);

            dg_Tickets.DataBind();
        }
    }
}