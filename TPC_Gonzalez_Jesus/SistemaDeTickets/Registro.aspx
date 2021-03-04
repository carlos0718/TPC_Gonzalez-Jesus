<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="SistemaDeTickets.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:darkcyan;font-family:Courier New, Courier, monospace;text-align:center;">
    <form id="form1" runat="server">
     <div style="background-color:aliceblue; height:2.5cm">
         <h1 style="text-align:center; color:black; padding-top:25px"><strong>Formulario de carga de datos</strong></h1>
     </div>
        
    <fieldset style="margin: 2% 20% ; border-color:cornsilk; padding:4%">
        <div runat="server" visible="true" id="div_Inicial">
                <div>
                    <asp:Label ID="lbl_ClienteEmpleado" Text=" Es cliente o empleado" Font-Bold="true" ForeColor="White" Font-Size="17px"  runat="server" /><br />
                    <asp:DropDownList ID="ddl_ClienteEmpleado" runat="server" Width="7.5cm" Font-Size="15px" BorderWidth="7px" BorderColor="white" Font-Italic="true"
                        AutoPostBack="true"   OnSelectedIndexChanged="ddl_ClienteEmpleado_SelectedIndexChanged" >
                     <asp:ListItem Selected hidden>Elegir</asp:ListItem>
                     <asp:ListItem  >Empleado</asp:ListItem>
                     <asp:ListItem>Cliente</asp:ListItem>
                </asp:DropDownList>
            </div>
                <br />
<%--                Ingresa tu documento y luego presiona buscar    
                <br />--%>
                
                <div>
                    <asp:TextBox runat="server" ID="txtb_DNI" TextMode="Number" Width="7cm" Font-Size="15px"  Font-Italic="true"
                        BorderWidth="7px" BorderColor="white" placeholder="Ingrese DNI..." /><br />
                </div><br />
                <%--<asp:Button runat="server" ID="btn_BuscarDNI" Text="Buscar" OnClick="btn_BuscarDNI_Click" />--%>
               <div>
                    <asp:TextBox runat="server" ID="txtb_Nombre"  Width="7cm" Font-Size="15px" Font-Italic="true"
                        BorderWidth="7px" BorderColor="white" placeholder="Ingrese Nombre" />
               </div><br />
                <div>
                    <asp:TextBox runat="server" ID="txtb_Apellido"  Width="7cm" Font-Size="15px" Font-Italic="true"
                        BorderWidth="7px" BorderColor="white" placeholder="Ingrese Apellido" />
                </div>
                <br />
                <div>
                    <asp:TextBox runat="server" ID="txtb_Date" Width="7cm" Font-Size="15px" Font-Italic="true"
                        BorderWidth="7px" BorderColor="white" TextMode="Date" />
                </div>

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
        <asp:Label runat="server" ID="lbl_esCliente" Text="Es Cliente?: " /> <%--esta linea quitar--%>
        <asp:CheckBox runat="server" ID="cb_EsCliente" Checked="false" /> <%--esta linea quitar--%>
        <br />
                <div>
                    <asp:TextBox runat="server" ID="txtb_Password"  Width="7cm" Font-Size="15px" Font-Italic="true"
                        BorderWidth="7px" BorderColor="white" placeholder="Ingrese contraseña" TextMode="Password"/>
                </div><br />
                <div>
                    <asp:TextBox runat="server" ID="txtb_PassWordConfirm"  Width="7cm" Font-Size="15px" Font-Italic="true"
                        BorderWidth="7px" BorderColor="white" placeholder="Confirme contraseña" TextMode="Password"/>
                </div><br />
                <div>
                    <asp:Button runat="server" ID="btn_Confirmar" Font-Size="15px" Font-Italic="true"
                        BorderWidth="2px" BorderColor="white" Text="Enviar" OnClick="btn_Confirmar_Click" />
                </div>
                

        </div>
        <div id="div_final" runat="server" visible="false">
        <asp:Label runat="server" ID="lbl_returnInfo" ForeColor="Red" />
            <asp:Button runat="server" Text="Continuar" />

        </div>
    </fieldset>
    </form>
</body>
</html>
