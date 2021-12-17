<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaDeTickets.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form" runat="server">
        <div style="background-color: aliceblue; height: 2.5cm">
            <h1 style="text-align: center; color: black; padding-top: 25px; margin-top: 20px; padding-left: 2cm; padding-right: 15px; width: 100%"><strong>TICKET IT</strong></h1>
        </div>
        <br />
        <div style="padding:0 45px">

            <div class="form-box" id="login-box">
                <div CssClass="card-header" style="text-align: center; color: black">
                    <h5><strong>Iniciar Sesion</strong> </h5>
                </div>
                <div style="border-color:black" class="card-body" >
                    <div class="form-group">
                        <asp:TextBox ID="TxtUsuer" runat="server" CssClass="form-control"  placeholder="Ingrese usuario..."></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TxtPass" runat="server" TextMode="Password" CssClass="form-control" ValidateRequestMode="Enabled" placeholder="Ingrese password..."></asp:TextBox>
                    </div>
                    <div style="text-align: center; margin-bottom: 10px">
                        <asp:Button ID="BtnAceptar" class="btn btn-primary" runat="server" Text="Aceptar" OnClick="BtnAceptar_Click" />

                    </div>
                    <div class="card-header" style="text-align: center; font-size: 11px; color: black"><strong>Si no tenés usuario, registrate</strong> </div>
                    <div style="text-align: center; margin-top: 10px">
                        <asp:Button ID="btxRegistrar" class="btn btn-primary" runat="server" Text="Registrar" OnClick="btxRegistrar_Click" />
                    </div>
                </div>
            </div>
            <asp:Label ID="LbError" runat="server"  Visible="false" CssClass="alert alert-danger w-25 ml-25" role="alert" Text="Usuario inexistente o contraseña incorrecta" />
        </div>

    </form>
</asp:Content>
