<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaDeTickets.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="form" runat="server">
         <div style="background-color:aliceblue; height:2.5cm">
            <h1 style="text-align:center; color:black; padding-top:25px; margin-top:20px; padding-left:2cm;padding-right:15px;width:100%" ><strong>TICKET IT</strong></h1>
        </div><br />
        <div style="padding-left:35%;">
            <div class="form-box" id="login-box" style="width:500px;" >
                <div class="card-header" style="text-align:center"><h5><small> <strong>Iniciar Sesion</strong> </small></h5></div>
                <div class="card-body bg-secondary">
                    <div class="form-group">
                        <asp:TextBox ID="TxtUsuer" runat="server" CssClass="form-control" placeholder="Ingrese usuario..."></asp:TextBox>
                        <asp:Label ID="LbError" runat="server" ForeColor="Red" Font-Bold="true" Visible="false" Text="Usuario inexistente o contraseña incorrecta" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TxtPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingrese password..."></asp:TextBox>
                    </div>
                    <div class="card-footer" style="text-align:center">
                        <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="BtnAceptar_Click" />
                        <a ></a>
                    </div>
                    
                     <div class="card-header" style="text-align:center ; font-size:11px"> <strong>Si no tenes usuario, registrate</strong> </div>
                        <div class="card-footer" style="text-align:center">
                        <asp:Button ID="btxRegistrar" runat="server" Text="Registrar" OnClick="btxRegistrar_Click" />
                        <a ></a>
                    </div>
                </div>
              </div>   
        </div>
    </form>
</asp:Content>
