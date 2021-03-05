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
                MostrarDashBoardTicketsPropios(0);
                
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
        protected void a_DashBoard_ServerClick(object sender, EventArgs e)
        {
            MostrarDashBoardTicketsPropios(0);
        }
        protected void a_DashBoardTodos_ServerClick(object sender, EventArgs e)
        {
            MostrarDashBoardTicketsPropios(1);
        }
        void MostrarDashBoardTicketsPropios(byte incluye_historico)
        {
            TicketNegocio tk = new TicketNegocio();

            dg_Tickets.DataSource = new BindingSource(tk.ObtenerTablaPorPropietario(37189215,incluye_historico), null);

            dg_Tickets.DataBind();
        }
        protected void a_Logout_ServerClick(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void a_DashBoardSinPropietario_ServerClick(object sender, EventArgs e)
        {
            TicketNegocio tk = new TicketNegocio();

            dg_Tickets.DataSource = new BindingSource(tk.ObtenerTicketsSinPropietario(0), null);

            dg_Tickets.DataBind();
            
        }
    }
}