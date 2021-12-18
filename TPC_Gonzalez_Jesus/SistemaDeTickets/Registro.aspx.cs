using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
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
                //lbl_ClienteEmpleado.Text = ddl_ClienteEmpleado.SelectedItem.Value;
            //}
        }

        //Busca por dni, en caso de no encontrar pedira los datos para cargar un nuevo usuario
        protected void btn_BuscarDNI_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_Confirmar_Click(object sender, EventArgs e)
        {
            if (!txtb_Password.Text.Equals( txtb_PassWordConfirm.Text ))
            {
                LbError.Visible = true;
                return;
            }
            PersonaNegocio per = new PersonaNegocio();
            int return_code = 0;

            return_code=per.RegistrarPersona(Int32.Parse(txtb_DNI.Text), txtb_Nombre.Text, txtb_Apellido.Text,txtb_Date.Text, cb_EsCliente.Checked, txtb_Password.Text);

            div_Inicial.Visible = false;
            div_final.Visible = true;

            if (return_code == 0)
                lbl_returnInfo.Text = "El usuario ya existe. Si esto no es asi, contacte a un administrador.";
            else
                lbl_returnInfo.Text = "Se registro correctamente el usuario.";

        }


        protected void btn_VolverInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}