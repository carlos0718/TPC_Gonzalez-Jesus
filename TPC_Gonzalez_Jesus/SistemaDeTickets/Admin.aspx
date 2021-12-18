<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SistemaDeTickets.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
                 <div ID="div_TicketGrid" style="width:100%; font-family:Courier New, Courier, monospace;  margin:15px 45px; padding-left:15px">
               <h3 style="text-align:center; background-color:aliceblue; height:2cm; padding-top:18px"><strong> Mis Tickets</strong></h3>
            
               <asp:DataGrid runat="server" ID="dg_Tickets" class="table"
                    PageSize="10" AllowPaging="True" DataKeyField="ticketid" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="black" GridLines="Both" OnItemCommand="dg_Tickets_ItemCommand" BorderColor="white">
                    <Columns>
                        <asp:BoundColumn HeaderText="DNI" DataField="DNI" />
                        <asp:BoundColumn HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundColumn HeaderText="Apellido" DataField="Apellido" />
                        <asp:BoundColumn HeaderText="Fecha_alta" DataField="Fecha_alta" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundColumn HeaderText="Cliente" DataField="Cliente" />
                        <asp:ButtonColumn HeaderText="Registros" ButtonType="PushButton" Text="Ver" CommandName="btn_TkGrid_Reg" />
                    </Columns>
                </asp:DataGrid>
              </div>
    </form>
</body>
</html>
