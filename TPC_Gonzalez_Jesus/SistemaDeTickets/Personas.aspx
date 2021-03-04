<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Personas.aspx.cs" Inherits="SistemaDeTickets.Personas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:darkcyan;font-family:Courier New, Courier, monospace;text-align:center;">
    <div style="background-color:aliceblue; height:2.5cm; margin-bottom:25px">
         <h1 style="text-align:center; color:black; padding-top:25px"><strong>DATOS PERSONALES</strong></h1>
     </div>
    <form id="form1" runat="server">
        <fieldset style="margin: 2% 20% ; border-color:cornsilk; padding: 2% 4%">
            <div >
                <asp:TextBox runat="server" ID="txtb_DNI" placeholder="Ingrese DNI" TextMode="Number" 
                    Width="7cm" Font-Size="15px"  Font-Italic="true" BorderWidth="7px" BorderColor="white"></asp:TextBox>
                <asp:Button runat="server" ID="btn_BuscarDNI" Text="Buscar" OnClick="btn_BuscarDNI_Click" />
                <br />
                <br />
                <div style="text-align:justify">
                    <asp:Label runat="server" ID="lbl_Apellido" Font-Bold="true" ForeColor="White" Font-Size="17px" Text="Apellido: " ></asp:Label>
                    <asp:Label runat="server" ID="lbl_Apellido_Value" Text=" - " ></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="lbl_Nombre" Font-Bold="true" ForeColor="White" Font-Size="17px" Text="Nombre: " ></asp:Label>
                    <asp:Label runat="server" ID="lbl_Nombre_Value" Text=" - " ></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="lbl_Alta" Font-Bold="true" ForeColor="White" Font-Size="17px" Text="Alta: : " ></asp:Label>
                    <asp:Label runat="server" ID="lbl_Alta_value" Text=" - " ></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="lbl_Nacimiento" Font-Bold="true" ForeColor="White" Font-Size="17px" Text="Nacimiento: " ></asp:Label>
                    <asp:Label runat="server" ID="lbl_Nacimiento_value" Text=" - " ></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="lbl_EsCliente" Font-Bold="true" ForeColor="White" Font-Size="17px" Text="Es cliente?: " ></asp:Label>
                    <asp:CheckBox runat="server" ID="cb_EsCliente"  Checked="False" Enabled="False" />
               </div>
            </div>
        </fieldset>
    </form>
</body>
</html>
