using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaDeTickets
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DdlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<string> tiposDeEstado;
            
            tiposDeEstado = new List<string>();
            tiposDeEstado.Add("Nuevo");
            tiposDeEstado.Add("En Espera");
            tiposDeEstado.Add("En Progreso");
            tiposDeEstado.Add("Resuelto");
            tiposDeEstado.Add("Cerrado");
            tiposDeEstado.Add("Cancelado");
            DdlStatus.DataValueField = tiposDeEstado.ToString();
      
        }
    }
}