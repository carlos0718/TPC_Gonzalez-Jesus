using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SistemaDeTickets
{

    public partial class VistaTicketCliente : System.Web.UI.Page
    {
        TicketNegocio negocio = new TicketNegocio();
        Ticket tk;
        protected void Page_Load(object sender, EventArgs e)
        {
            tk = negocio.ObtenerTicket(Int32.Parse(Request.QueryString["ticketid"]));

            Session["ticketid"] = tk.ticketid;
            PoblarDatosTicket(tk);

            PoblarRegistros();
        }

        void PoblarDatosTicket(Ticket _ticket)
        {
            //if (Int32.Parse(Session["dni"].ToString()) == _ticket.Reportadopor)
            //es_propietario = true;


            txtb_Ticketid.Text = _ticket.ticketid.ToString();

            PersonaNegocio reportadopor = new PersonaNegocio();
            reportadopor.ObtenerPersona((int)_ticket.Reportadopor);
            _ticket.Reportadopor_str = reportadopor.Persona.Nombre + " " + reportadopor.Persona.Apellido;
            txtb_ReportadoPor.Text = _ticket.Reportadopor_str;

            PersonaNegocio creadopor = new PersonaNegocio();
            creadopor.ObtenerPersona((int)_ticket.Creadopor);
            _ticket.Creadopor_str = creadopor.Persona.Nombre + " " + creadopor.Persona.Apellido;
            txtb_Creador.Text = _ticket.Creadopor_str;

            txtb_Esatdo.Text = _ticket.Estado;

            //ddl_Propietario.Items.Insert(0, new ListItem(_ticket.Propietario.ToString()));


            PersonaNegocio propietario = new PersonaNegocio();
            propietario.ObtenerPersona((int)_ticket.Propietario);
            _ticket.Propietario_str = propietario.Persona.Nombre + " " + propietario.Persona.Apellido;
            txtb_Propietario.Text = _ticket.Propietario_str;

            DominiosNegocio dominio = new DominiosNegocio();
            dominio.ObtenerAreaPorIdArea((int)_ticket.Grupo_propietario);
            txtb_GrupoPropietario.Text = dominio.dominios.Valor_texto;

            txtb_Descripcion.Text = _ticket.descripcion;
            txtb_Detalle.Text = _ticket.detalle;
        }

        void PoblarRegistros()
        {
            RegistroNegocio negocio = new RegistroNegocio();
            dg_Registros.DataSource = new BindingSource(negocio.ObtenerRegistrosTicket((int)tk.ticketid), null);

            dg_Registros.DataBind();
        }

        protected void btn_Resolver_Click(object sender, EventArgs e)
        {
            ActualizarEstado("RESUELTO");
            tk = negocio.ObtenerTicket(Int32.Parse(Session["ticketid"].ToString()));
            int dni = Int32.Parse(Session["dni"].ToString());

            RegistroNegocio reg_neg = new RegistroNegocio();
            if (reg_neg.InsertarRegistro("Ticket RESUELTO por cliente.", "Ticket " + txtb_Esatdo.Text + " por cliente.", tk.clase, tk.ticketid, dni) != 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "alert(\"Registro cargado.!\");", true);
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            ActualizarEstado("CANCELADO");
            tk = negocio.ObtenerTicket(Int32.Parse(Session["ticketid"].ToString()));
            int dni = Int32.Parse(Session["dni"].ToString());

            RegistroNegocio reg_neg = new RegistroNegocio();
            if (reg_neg.InsertarRegistro("Ticket CANCELADO por cliente.", "Ticket " + txtb_Esatdo.Text + " por cliente.", tk.clase, tk.ticketid, dni) != 0)
            { 
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "alert(\"Registro cargado.!\");", true);
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnAgregarRegistro_Click(object sender, EventArgs e)
        {
            
            tk = negocio.ObtenerTicket(Int32.Parse(Session["ticketid"].ToString()));
            int dni = Int32.Parse(Session["dni"].ToString());

            RegistroNegocio reg_neg = new RegistroNegocio();
            if (reg_neg.InsertarRegistro(txtb_Reg_Descripcion.Text, txtb_Reg_Detalle.Text, tk.clase, tk.ticketid, dni) != 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "alert(\"Registro cargado.!\");", true);
            }
            Response.Redirect("VistaTicketCliente.aspx?ticketid=" + tk.ticketid);
        }

        void ActualizarEstado(string estado)
        {
            tk = negocio.ObtenerTicket(Int32.Parse(Session["ticketid"].ToString()));
            if (negocio.AvanzarEstadoTicket(tk, estado))
                ClientScript.RegisterClientScriptBlock(this.GetType(), "s", "window.alert('El ticket se actualizo correctamente');", true);
            else
                ClientScript.RegisterClientScriptBlock(this.GetType(), "s", "window.alert('El ticket no se pudo actualizar');", true);
        }
    }
}