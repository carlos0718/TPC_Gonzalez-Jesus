<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="SistemaDeTickets.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:darkcyan;font-family:Courier New, Courier, monospace;text-align:center; margin-top:30px">
    <form id="form1" runat="server">


        <div runat="server" visible="true" id="div_Inicial">
                <div>
                    
                    <asp:Label ID="lbl_ClienteEmpleado" Text="Es cliente o empleado?" runat="server"   />
                <asp:DropDownList ID="ddl_ClienteEmpleado" runat="server"  AutoPostBack="true"   OnSelectedIndexChanged="ddl_ClienteEmpleado_SelectedIndexChanged" >
                     <asp:ListItem selected hidden>Elegir</asp:ListItem>
                     <asp:ListItem>Empleado</asp:ListItem>
                     <asp:ListItem>Cliente</asp:ListItem>
                </asp:DropDownList>
            </div>
                Formulario de carga de datos
                <br />
<%--                Ingresa tu documento y luego presiona buscar    
                <br />--%>
                <asp:TextBox runat="server" ID="txtb_DNI" TextMode="Number" placeholder="Ingrese DNI..." />
                <%--<asp:Button runat="server" ID="btn_BuscarDNI" Text="Buscar" OnClick="btn_BuscarDNI_Click" />--%>
                <asp:TextBox runat="server" ID="txtb_Nombre"  placeholder="Ingrese Nombre" />
                <asp:TextBox runat="server" ID="txtb_Apellido"  placeholder="Ingrese Apellido" />
                <br />

                <asp:TextBox runat="server" ID="txtb_Date" TextMode="Date" />

              <%--  <asp:DropDownList ID="ddl_Ano" runat="server"  AutoPostBack="false"   >
                    <asp:ListItem selected hidden>Año</asp:ListItem>
                     <asp:ListItem>1993</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddl_Mes" runat="server"  AutoPostBack="false"   >
                    <asp:ListItem selected hidden>Mes</asp:ListItem>
                     <asp:ListItem>05</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddl_Dia" runat="server"  AutoPostBack="false"   >
                    <asp:ListItem selected hidden>Dia</asp:ListItem>
                     <asp:ListItem>16</asp:ListItem>
                </asp:DropDownList>--%>
        <br />
        <asp:Label runat="server" ID="lbl_esCliente" Text="Es Cliente?: " />
        <asp:CheckBox runat="server" ID="cb_EsCliente" Checked="false" />
        <br />
        <asp:TextBox runat="server" ID="txtb_Password" placeholder="Ingrese contraseña" TextMode="Password"/>
        <asp:TextBox runat="server" ID="txtb_PassWordConfirm" placeholder="Confirme contraseña" TextMode="Password"/>

        <asp:Button runat="server" ID="btn_Confirmar" Text="Enviar" OnClick="btn_Confirmar_Click" />

        </div>
        <div id="div_final" runat="server" visible="false">
        <asp:Label runat="server" ID="lbl_returnInfo" ForeColor="Red" />
            <asp:Button runat="server" Text="Continuar" />

        </div>
    </form>
</body>
</html>
