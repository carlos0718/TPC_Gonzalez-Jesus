using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
namespace SistemaDeTickets
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["user"] = TxtUsuer.ToString();

            //if(Page.IsPostBack)
            //{
            //    if(Session["user"].ToString() == null)
            //    {
            //        Response.Redirect("Login.aspx");
            //    }
            //    else
            //    {
            //        Response.Redirect("Default.aspx");
            //    }
            //}
        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Default.aspx");

            if (String.IsNullOrEmpty(TxtUsuer.Text))
                return;

            int code = 0;
            PersonaNegocio per = new PersonaNegocio();

            code = per.LogInPersona(Int32.Parse(TxtUsuer.Text), TxtPass.Text);


            if (code == 0)
            {
                LbError.Visible = true;
                return;
            }

            per.ObtenerPersona(code);


            Session["dni"] = code.ToString();
            Session["nombre"] = per.Persona.Nombre;
            Session["apellido"] = per.Persona.Apellido;
            Session["alta"] = per.Persona.Fecha_alta;
            Session["nacimiento"] = per.Persona.Fecha_nacimiento;
            Session["escliente"] = per.Persona.Cliente;

            if (per.Persona.Cliente)
                Response.Redirect("AutoServicio.aspx");
            Response.Redirect("DashBoard.aspx");

            
        }

        protected void btxRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }
    }
}