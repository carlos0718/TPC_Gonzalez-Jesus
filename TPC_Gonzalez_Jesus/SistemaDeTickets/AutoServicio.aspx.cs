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

        List<Dominio.Clasificacion> clasificaciones;
        protected void Page_Load(object sender, EventArgs e)
        {

            TicketNegocio tk = new TicketNegocio();

            lbl_user_value.Text = Session["nombre"] + " " + Session["apellido"];

            dg_Tickets.DataSource = new BindingSource(tk.ObtenerTablaPorReportado(Int32.Parse(Session["dni"].ToString())), null);

            dg_Tickets.DataBind();

        }

        protected void ddl_Clase_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_clasif.Items.Clear();
            ClasificacionNegocio clasif = new ClasificacionNegocio();
            clasificaciones = clasif.ObtenerClasificaciones(ddl_Clase.SelectedItem.Text, String.Empty);

            List<string> textoClasif = new List<string>();

            foreach (Dominio.Clasificacion clas in clasificaciones)
            {
                textoClasif.Add(clas.Rubro + " - " + clas.Nombre);
            }


            ddl_clasif.DataSource = clasificaciones;
            ddl_clasif.DataTextField = "Nombre";
            ddl_clasif.DataValueField = "Clasificacionid";



            lbl_clasifif.Visible = true;

            ddl_clasif.DataBind();
        }

        protected void ddl_clasif_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClasificacionNegocio clasif = new ClasificacionNegocio();
            clasificaciones = clasif.ObtenerClasificaciones(ddl_Clase.SelectedItem.Text, String.Empty);

            Dominio.Clasificacion aux = clasificaciones[ddl_clasif.SelectedIndex];

            //lbl_clasifif.Text = ddl_clasif.SelectedIndex.ToString();
            lbl_clasifif.Text = aux.Rubro;

        }

        protected void btn_CrearIncidente_Click(object sender, EventArgs e)
        {

            TicketNegocio tkneg = new TicketNegocio();
            ClasificacionNegocio clasif = new ClasificacionNegocio();
            clasificaciones = clasif.ObtenerClasificaciones(ddl_Clase.SelectedItem.Text, String.Empty);
            Dominio.Clasificacion aux = clasificaciones[ddl_clasif.SelectedIndex];

            //lbl_clasifif.Text = ddl_clasif.SelectedIndex.ToString();
            //lbl_clasifif.Text = 
            string clase = ddl_Clase.SelectedItem.Text;
            string descripcion = txtb_Descripcion_value.Text;
            string detalle = txtb_Detalle_value.Text;
            int urgencia = Int32.Parse(ddl_urgencia.Text.Substring(0, 1));
            int clasificacionid = aux.Clasificacionid;

            var algo = Session;
            uint creadorpor = UInt32.Parse((string)Session["dni"]);
            uint reportadorpor = UInt32.Parse((string)Session["dni"]);


            int ticketid = 0;// tkneg.CrearTicket(clase, descripcion, detalle, urgencia, clasificacionid, creadorpor, reportadorpor);
            if (ticketid == 0)
            {
                Response.Redirect("AutoServicio.aspx");
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "alert(\"Ticket creado: " + ticketid + "\");", true);
            }
            else
            {
                lblError.Visible = true;
            }
        }
    }
}