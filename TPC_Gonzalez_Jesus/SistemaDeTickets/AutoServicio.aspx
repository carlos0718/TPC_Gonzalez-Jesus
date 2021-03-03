<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutoServicio.aspx.cs" Inherits="SistemaDeTickets.AutoServicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:darkcyan;font-family:Courier New, Courier, monospace;text-align:justify; margin-top:30px">
    <form id="form1" runat="server" style="padding:20px">
        <div style="margin-bottom:20px">
            <asp:Label runat="server" ID="lbl_user" Text="Usuario: "/>
            <asp:Label runat="server" ID="lbl_user_value" />
            <br />
            <br />
            <asp:Label runat="server" ID="lbl_miembrosdesde" Text="Miembro desde: " />
            <asp:Label runat="server" ID="lbl_miembrodesde_value"  />
        </div>
        <div style="margin-bottom:20px">
            <asp:Label runat="server" ID="lbl_cargaTicket" TextStrong="Cargar un nuevo ticket: "/>
            <asp:DropDownList runat="server" ID="ddl_Clase" AutoPostBack="true" OnSelectedIndexChanged="ddl_Clase_SelectedIndexChanged">
                     <asp:ListItem selected hidden>Tipo de ticket</asp:ListItem>
                     <asp:ListItem>INCIDENTE</asp:ListItem>
                     <asp:ListItem>SOLICITUD</asp:ListItem>
            </asp:DropDownList>

           <div style="padding-top: 20px">
                <asp:Label runat="server" ID="lbl_clasif" Text="Elija un motivo para su ticket: "/>
                <asp:DropDownList runat="server" ID="ddl_clasif" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_clasif_SelectedIndexChanged" />
                <asp:Label runat="server" ID="lbl_clasifif" Text="Rubro"  Visible="false"/>
           </div>
           <div style="padding-top:20px">
               <strong>Urgencia : </strong>
                <asp:DropDownList runat="server" ID="ddl_urgencia">
                <asp:ListItem selected hidden>-----</asp:ListItem>
                     <asp:ListItem>1 - Critica</asp:ListItem>
                     <asp:ListItem>2 - Grave</asp:ListItem>
                     <asp:ListItem>3 - Moderada</asp:ListItem>
                     <asp:ListItem>4 - Normal</asp:ListItem>
                     <asp:ListItem>5 - Baja</asp:ListItem>
            </asp:DropDownList>
           </div>
           <br />
           <div>
               <strong>Descripción: </strong><br />
            <br />
            <asp:TextBox runat="server" ID="txtb_Descripcion_value" TextMode="MultiLine" MaxLength="299" Width="70%" Height="100px"/>
            <br />
                <strong>Ingrese el detalle: </strong>
            <br />
            
             
            <asp:TextBox runat="server" ID="txtb_Detalle_value" TextMode="MultiLine" MaxLength="2999" Width="70%" Height="100px"/>
            <br />
           </div>
            <asp:Button runat="server" ID="btn_CrearIncidente" Text="Enviar" OnClick="btn_CrearIncidente_Click" />
            <br />
        </div>
        <br />
        <hr />
        Mis Tickets:
        <div style="padding-left:15%">
            <asp:DataGrid runat="server" ID="dg_Tickets"
            PageSize="10" AllowPaging="True" DataKeyField="ticketid" AutoGenerateColumns="False" CellPadding="4" 
            ForeColor="Black" GridLines="Both">
        <Columns>  
            <asp:BoundColumn HeaderText="Ticket" DataField="ticketid"/>
            <asp:BoundColumn HeaderText="Descripcion" DataField="descripcion" />
            <asp:BoundColumn HeaderText="Estado" DataField="Estado" />
            <asp:BoundColumn HeaderText="Urgencia" DataField="Urgencia" />
            <asp:BoundColumn HeaderText="fecha_creacion" DataField="fecha_creacion" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundColumn HeaderText="fecha_fin" DataField="fecha_fin" />
            <asp:BoundColumn HeaderText="Cerrado" DataField="Historico"  />

        </Columns>  
        </asp:DataGrid>
        </div>
    </form>
</body>
</html>
