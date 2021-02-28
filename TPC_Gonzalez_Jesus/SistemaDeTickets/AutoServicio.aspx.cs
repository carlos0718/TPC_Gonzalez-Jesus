using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Negocio;
namespace SistemaDeTickets
{
    public partial class AutoServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            TicketNegocio tk = new TicketNegocio();

            lbl_user_value.Text = Session["nombre"] + " " + Session["apellido"];

            dg_Tickets.DataSource =  new BindingSource( tk.ObtenerTablaPorReportado(37189215) , null);

            dg_Tickets.DataBind();

        }
    }
}