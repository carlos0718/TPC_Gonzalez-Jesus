using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaDeTickets
{
    public partial class Prueba : System.Web.UI.Page
    {
        List<string> opcionesDeTicket;
        protected void Page_Load(object sender, EventArgs e)
        {

            opcionesDeTicket = new List<string>();
            opcionesDeTicket.Add("INCIDENTE");
            opcionesDeTicket.Add("SOLICITUD");
            ddlTipoTicket.DataSource = opcionesDeTicket;
            ddlTipoTicket.DataBind();
        }


    }
}