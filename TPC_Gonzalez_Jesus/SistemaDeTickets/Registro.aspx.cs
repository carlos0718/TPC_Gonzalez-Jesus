using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaDeTickets
{
    public partial class Registro : System.Web.UI.Page
    {
        List<string> ClienteEmpleado = new List<string> { "Elegir", "Empleado", "Cliente" };
        protected void Page_Load(object sender, EventArgs e)
        {
            //ddl_ClienteEmpleado.DataSource = ClienteEmpleado;
            //ddl_ClienteEmpleado.DataBind();
            if (Page.IsPostBack)
            {

            }
        }

        protected void ddl_ClienteEmpleado_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (Page.IsPostBack)
            //{
                lbl_ClienteEmpleado.Text = ddl_ClienteEmpleado.SelectedItem.Value;
            //}
        }

        //Busca por dni, en caso de no encontrar pedira los datos para cargar un nuevo usuario
        protected void btn_BuscarDNI_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_Confirmar_Click(object sender, EventArgs e)
        {

        }
    }
}