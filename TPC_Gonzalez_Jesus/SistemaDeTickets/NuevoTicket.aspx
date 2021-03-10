<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoTicket.aspx.cs" Inherits="SistemaDeTickets.NuevoTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:darkcyan;font-family:Courier New, Courier, monospace;text-align:justify; margin-top:15px">
     <div style="background-color:aliceblue; height:2.5cm">
            <h1 style="text-align:center; color:black; padding-top:25px; margin-top:20px; padding-left:1cm;padding-right:15px;width:100%" ><strong>AUTOSERVICIO</strong></h1>
        </div><br />
    <form id="form1" runat="server" style="padding:20px; margin-left:5cm; margin-right:5cm">
        <div style="margin-bottom:20px">
            <asp:Label runat="server" ID="lbl_user" Font-Size="17px" Font-Bold="true"  Text="Usuario: "/>
            <asp:Label runat="server" ID="lbl_user_value" />
            <br />
            <br />
            <asp:Label runat="server" ID="lbl_miembrosdesde" Font-Size="17px" Font-Bold="true" Text="Miembro desde: "  />
            <asp:Label runat="server" ID="lbl_miembrodesde_value"  />
        </div>
        <div style="margin-bottom:20px">
            <asp:Label runat="server" ID="lbl_cargaTicket" Font-Size="17px" Font-Bold="true" Text="Tipo: "/>
            <asp:DropDownList runat="server" ID="ddl_Clase"  Width="7.5cm" Font-Size="15px" BorderWidth="7px" BorderColor="white" Font-Italic="true"
                AutoPostBack="true" OnSelectedIndexChanged="ddl_Clase_SelectedIndexChanged">
                     <asp:ListItem selected hidden>-----</asp:ListItem>
                     <asp:ListItem>INCIDENTE</asp:ListItem>
                     <asp:ListItem>SOLICITUD</asp:ListItem>
            </asp:DropDownList>

           <div style="padding-top: 20px">
                <asp:Label runat="server" ID="lbl_clasif" Font-Size="17px" Font-Bold="true" Text="Motivo : "/>
                <asp:DropDownList runat="server" ID="ddl_clasif" AutoPostBack="true" Width="7.5cm" Font-Size="15px" BorderWidth="7px" BorderColor="white" Font-Italic="true"
                    AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_clasif_SelectedIndexChanged" />
                <asp:Label runat="server" ID="lbl_clasifif" Text="Rubro"  Visible="false"/>
           </div>
           <div style="padding-top:20px">
               <asp:Label runat="server"  Font-Size="17px" Font-Bold="true" Text="Urgencia: "/>
                <asp:DropDownList runat="server" ID="ddl_urgencia"  Width="7.5cm" Font-Size="15px" BorderWidth="7px" BorderColor="white" Font-Italic="true">
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
               <asp:Label runat="server" Font-Size="17px" Font-Bold="true" Text="Descripción : "/>
            <br />
            <br />
            <asp:TextBox runat="server" ID="txtb_Descripcion_value" TextMode="MultiLine" MaxLength="299" Width="70%" Height="100px"/>
            <br />
            <br />
                <asp:Label runat="server" Font-Size="17px" Font-Bold="true" Text="Ingrese el Detalle: "/>
            <br />
            <br />
            <asp:TextBox runat="server" ID="txtb_Detalle_value" TextMode="MultiLine" MaxLength="2999" Width="70%" Height="100px"/>
            <br />
            <br />
           </div>
            <asp:Button runat="server" ID="btn_CrearIncidente" Text="Enviar" OnClick="btn_CrearIncidente_Click" />
            <br />
        </div>
        <br />

    </form>
</body>
</html>
