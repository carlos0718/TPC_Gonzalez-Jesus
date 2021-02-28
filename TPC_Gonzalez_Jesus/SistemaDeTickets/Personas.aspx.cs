using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
namespace SistemaDeTickets
{
    public partial class Personas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_BuscarDNI_Click(object sender, EventArgs e)
        {
            PersonaNegocio persona = new PersonaNegocio();
            persona.ObtenerPersona( Int32.Parse( txtb_DNI.Text));

            lbl_Apellido_Value.Text = persona.Persona.Apellido;
            lbl_Nombre_Value.Text = persona.Persona.Nombre;
            lbl_Alta_value.Text = persona.Persona.Fecha_alta.Date.ToString();
            lbl_Nacimiento_value.Text = persona.Persona.Fecha_nacimiento.Date.ToString();
            cb_EsCliente.Checked = persona.Persona.Cliente;
            //lbl_Salida.Text = persona.Persona.Apellido + persona.Persona.Nombre;    
        }
    }
}