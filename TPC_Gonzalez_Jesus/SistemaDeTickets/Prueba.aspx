<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="SistemaDeTickets.Prueba" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="Prueba" runat="server">
        <div>
            <br />
            <asp:Label ID="lbl_BuscarTkt" runat="server" Text="Ingrese el ticket a buscar : " />
            <asp:TextBox ID="tb_Ticketid" runat="server" />
            </div>
        <div>
            <br /><br />
            <asp:Button ID="btnTest" runat="server" Text="Boton de prueba" OnClick="btnTest_Click" ForeColor="White"  BackColor="#0066ff" BorderStyle="None"/>
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
</asp:Content>