using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
using System.Windows.Forms;

namespace SistemaDeTickets
{
    public partial class _Default : Page
    {

        TicketNegocio negocio = new TicketNegocio();
        Ticket tk;
        bool es_propietario = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
                return;
            tk = negocio.ObtenerTicket(Int32.Parse(Request.QueryString["ticketid"]));

            Session["ticketid"] = tk.ticketid;
            PoblarDatosTicket(tk);
            EstablecerPermisos();

            PoblarRegistros();


        }
        protected void DdlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //List<string> tiposDeEstado;
            
            //tiposDeEstado = new List<string>();
            //tiposDeEstado.Add("Nuevo");
            //tiposDeEstado.Add("En Espera");
            //tiposDeEstado.Add("En Progreso");
            //tiposDeEstado.Add("Resuelto");
            //tiposDeEstado.Add("Cerrado");
            //tiposDeEstado.Add("Cancelado");
            //DdlStatus.DataValueField = tiposDeEstado.ToString();
      
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            tk = negocio.ObtenerTicket(Int32.Parse(txtb_Buscar.Text));
           
            if (tk.ticketid == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "s", "window.alert('El ticket no existe!');", true);
                return;
            }
            Session["ticketid"] = tk.ticketid;
            PoblarDatosTicket(tk);
            EstablecerPermisos();
            PoblarRegistros();
        }

        void PoblarDatosTicket(Ticket _ticket)
        {
            if (Int32.Parse(Session["dni"].ToString()) == _ticket.Propietario)
                es_propietario = true;
            

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
        void EstablecerPermisos()
        {
            chkb_EsPropietario.Checked = es_propietario;
            chkb_EsPropietario.Enabled = false;

            if (es_propietario)
            {
                div_CargaRegistros.Visible = true;

                txtb_Descripcion.Enabled = true;
                txtb_Detalle.Enabled = true;


                btn_TomarPropiedad.Visible = false;
                btn_Guardar.Visible = true;
                btn_Cancelar.Visible = true;
                btn_Resolver.Visible = true;
                btn_Derivar.Visible = true;
            }
            else
            {
                div_CargaRegistros.Visible = false;

                btn_TomarPropiedad.Visible = true;
                txtb_Descripcion.Enabled = false;
                txtb_Detalle.Enabled = false;



                btn_Guardar.Visible = false;
                btn_Cancelar.Visible = false;
                btn_Resolver.Visible = false;
                btn_Derivar.Visible = false;
            }
        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {
            tk = negocio.ObtenerTicket(Int32.Parse(Request.QueryString["ticketid"]));
            tk.descripcion = txtb_Descripcion.Text;
            tk.detalle = txtb_Detalle.Text;

            if (negocio.ActualizarDescTicket(tk))
                ClientScript.RegisterClientScriptBlock(this.GetType(), "s", "window.alert('El ticket se actualizo correctamente');", true);
            else
                ClientScript.RegisterClientScriptBlock(this.GetType(), "s", "window.alert('El ticket no se pudo actualizar');", true);
        }

        void ActualizarEstado(string estado)
        {
            tk = negocio.ObtenerTicket(Int32.Parse(Session["ticketid"].ToString() ));
            if (negocio.AvanzarEstadoTicket(tk, estado))
                ClientScript.RegisterClientScriptBlock(this.GetType(), "s", "window.alert('El ticket se actualizo correctamente');", true);
            else
                ClientScript.RegisterClientScriptBlock(this.GetType(), "s", "window.alert('El ticket no se pudo actualizar');", true);
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            ActualizarEstado("CANCELADO");
            Response.Redirect(Request.RawUrl);
        }

        protected void btn_Resolver_Click(object sender, EventArgs e)
        {

            ActualizarEstado("RESUELTO");
            Response.Redirect(Request.RawUrl);
        }

        protected void btn_TomarPropiedad_Click(object sender, EventArgs e)
        {
            tk = negocio.ObtenerTicket(Int32.Parse(Session["ticketid"].ToString() ));
            negocio.AsignarPropietario(tk, Int32.Parse(Session["dni"].ToString()), 2);

            Response.Redirect(Request.RawUrl);

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            tk = negocio.ObtenerTicket(Int32.Parse(Session["ticketid"].ToString()));
            

            
            Response.Redirect(Request.RawUrl);
        }
    }
}