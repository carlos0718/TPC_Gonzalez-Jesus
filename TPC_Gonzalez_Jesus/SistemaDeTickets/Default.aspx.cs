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
            //tk = negocio.ObtenerTicket(Int32.Parse(Request.QueryString["ticketid"]));
            //PoblarDatosTicket(tk);
            //EstablecerPermisos();

            //PoblarRegistros();


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
                btn_TomarPropiedad.Visible = true;
                txtb_Descripcion.Enabled = false;
                txtb_Detalle.Enabled = false;



                btn_Guardar.Visible = false;
                btn_Cancelar.Visible = false;
                btn_Resolver.Visible = false;
                btn_Derivar.Visible = false;
            }
        }

    }
}