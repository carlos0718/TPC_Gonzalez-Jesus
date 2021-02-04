<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="SistemaDeTickets.Prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>


    <form id="Prueba" runat="server">
        <div>
            <asp:Label ID="lbl_BuscarTkt" runat="server" Text="Ingrese el ticket a buscar : " />
            <asp:TextBox ID="tb_Ticketid" runat="server" />
            </div>
        <div>
            <asp:Button ID="btnTest" runat="server" Text="Boton de prueba" OnClick="btnTest_Click" />
        </div>

        <div>
            <asp:Label ID="lbl_Ticketid" runat ="server" Text="ID de ticket: " />
            <asp:Label ID="lbl_Ticketid_value" runat="server" Text=" - " />
        </div>

        <div>
            <asp:Label ID="lblClaseTicket" runat ="server" Text="Clase de ticket: " />
            <asp:Label ID="lblClaseTicket_Value" runat="server" Text=" - " />
        </div>





        <br /><br /><br />
        <div>
            Seccion nuevo ticket:
            <div>
                <asp:Label runat="server" Text="Clase de ticket: " />
            </div>
            <div>
                <asp:DropDownList ID="ddl_ListaClases" runat="server" />
            </div>
       
            <div>
                <asp:Label runat="server" Text="Descripcion: " />
                <asp:TextBox runat="server" ID="tb_Descripcion"  />
            </div>
            <div>
                <asp:Label  runat="server" ID="lbl_Detalle"  Text="Detalle" />
                <asp:TextBox ID="tb_Detalle" runat="server"  TextMode="MultiLine" Rows="10" />
            </div>


            <div>
                <asp:Label runat="server" Text="Urgencia: " />
            </div>
            <div>
                <asp:DropDownList ID="ddl_Urgencia" runat="server" />
            </div>

        </div>

<%--        <div id="div1">
            <% foreach(TIpo variable in arrayname) { %>
                <div>
                <%: psObject %>
                </div>
            <% } //foreach %>
        </div>--%>
<%--       <div>
        </div>
        <asp:DropDownList ID="ddlTipoTicket" runat="server" >
        </asp:DropDownList>
        <asp:Label ID="lblMain" runat="server" Text="Label"></asp:Label>--%>
    </form>
</body>
</html>
