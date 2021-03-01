<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutoServicio.aspx.cs" Inherits="SistemaDeTickets.AutoServicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" ID="lbl_user" Text="Usuario: "/>
            <asp:Label runat="server" ID="lbl_user_value" />
            <br />
            <asp:Label runat="server" ID="lbl_miembrosdesde" Text="Miembro desde: " />
            <asp:Label runat="server" ID="lbl_miembrodesde_value"  />
        </div>
        <br />
        <div>
            <asp:Label runat="server" ID="lbl_cargaTicket" Text="Cargar un nuevo ticket: "/>
            <br />
            <asp:DropDownList runat="server" ID="ddl_Clase" AutoPostBack="true" OnSelectedIndexChanged="ddl_Clase_SelectedIndexChanged">
                     <asp:ListItem selected hidden>Tipo de ticket</asp:ListItem>
                     <asp:ListItem>INCIDENTE</asp:ListItem>
                     <asp:ListItem>SOLICITUD</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" ID="lbl_clasif" Text="Elija un motivo para su ticket: "/>
            <asp:DropDownList runat="server" ID="ddl_clasif" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_clasif_SelectedIndexChanged" />
            <asp:Label runat="server" ID="lbl_clasifif" Text="Rubro"  Visible="false"/>
            <br />
            De una breve descripcion: 
            <br />
            <asp:TextBox runat="server" ID="txtb_Descripcion_value" TextMode="MultiLine" MaxLength="299" />
            <br />
            Ingrese el detalle: 
            <br />
            
             
            <asp:TextBox runat="server" ID="txtb_Detalle_value" TextMode="MultiLine" MaxLength="2999" />
            <br />
            <asp:Button runat="server" ID="btn_CrearIncidente" Text="Enviar" OnClick="btn_CrearIncidente_Click" />
            <br />
            <asp:DropDownList runat="server" ID="ddl_urgencia">
                <asp:ListItem selected hidden>Urgencia</asp:ListItem>
                     <asp:ListItem>1 - Critica</asp:ListItem>
                     <asp:ListItem>2 - Grave</asp:ListItem>
                     <asp:ListItem>3 - Moderada</asp:ListItem>
                     <asp:ListItem>4 - Normal</asp:ListItem>
                     <asp:ListItem>5 - Baja</asp:ListItem>
            </asp:DropDownList>
           
        </div>
        <br />
        <div>


        </div>
        <br />
        Mis Tickets:
        <asp:DataGrid runat="server" ID="dg_Tickets"
            PageSize="10" AllowPaging="True" DataKeyField="ticketid" AutoGenerateColumns="False" CellPadding="4" 
            ForeColor="Green" GridLines="Both">
        <Columns>  
            <asp:BoundColumn HeaderText="Ticket" DataField="ticketid" />
            <asp:BoundColumn HeaderText="Descripcion" DataField="descripcion" />
            <asp:BoundColumn HeaderText="Estado" DataField="Estado" />
            <asp:BoundColumn HeaderText="Urgencia" DataField="Urgencia" />
            <asp:BoundColumn HeaderText="fecha_creacion" DataField="fecha_creacion" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundColumn HeaderText="fecha_fin" DataField="fecha_fin" />
            <asp:BoundColumn HeaderText="Cerrado" DataField="Historico"  />

                
        </Columns>  
        </asp:DataGrid>
    </form>
</body>
</html>
