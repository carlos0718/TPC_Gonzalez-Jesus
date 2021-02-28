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
        </div>
        <br />
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
