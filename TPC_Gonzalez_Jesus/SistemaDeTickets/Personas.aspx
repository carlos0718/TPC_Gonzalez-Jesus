<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Personas.aspx.cs" Inherits="SistemaDeTickets.Personas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox runat="server" ID="txtb_DNI" placeholder="Ingrese DNI" TextMode="Number" ></asp:TextBox>
            <asp:Button runat="server" ID="btn_BuscarDNI" Text="Buscar" OnClick="btn_BuscarDNI_Click" />
            <br />
            <asp:Label runat="server" ID="lbl_Apellido" Text="Apellido: " ></asp:Label>
            <asp:Label runat="server" ID="lbl_Apellido_Value" Text=" - " ></asp:Label>
            <br />
            <asp:Label runat="server" ID="lbl_Nombre" Text="Nombre: " ></asp:Label>
            <asp:Label runat="server" ID="lbl_Nombre_Value" Text=" - " ></asp:Label>
            <br />
            <asp:Label runat="server" ID="lbl_Alta" Text="Alta: : " ></asp:Label>
            <asp:Label runat="server" ID="lbl_Alta_value" Text=" - " ></asp:Label>
            <br />
            <asp:Label runat="server" ID="lbl_Nacimiento" Text="Nacimiento: " ></asp:Label>
            <asp:Label runat="server" ID="lbl_Nacimiento_value" Text=" - " ></asp:Label>
            <br />
            <asp:Label runat="server" ID="lbl_EsCliente" Text="Es cliente?: " ></asp:Label>
            <asp:CheckBox runat="server" ID="cb_EsCliente"  Checked="False" Enabled="False" />
        </div>
    </form>
</body>
</html>
