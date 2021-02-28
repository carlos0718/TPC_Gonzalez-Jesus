<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaDeTickets.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="form" runat="server">
        <div class="container">
            <nav class="navbar navbar-light bg-light" style="margin: 30px 10px">
                <a class="navbar-brand">TICKET IT</a>
            </nav>
        </div>
        <div>
            <div class="form-box" id="login-box" style="width:300px; margin:0px 400px">
                <div class="card-header" style="text-align:center"> Iniciar Sesion </div>
                <div class="card-body bg-secondary">
                    <div class="form-group">
                        <asp:TextBox ID="TxtUsuer" runat="server" CssClass="form-control" placeholder="Ingrese usuario..."></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TxtPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingrese password..."></asp:TextBox>
                    </div>
                    <div class="card-footer" style="text-align:center">
                        <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" OnClick="BtnAceptar_Click" />
                        <a ></a>
                    </div>
                    
                     <div class="card-header" style="text-align:center"> Si no tenes usuario, registrate </div>
                        <div class="card-footer" style="text-align:center">
                        <asp:Button ID="btxRegistrar" runat="server" Text="Registrar" OnClick="btxRegistrar_Click" />
                        <a ></a>
                </div>
            </div>
             
        </div>
    </form>
</asp:Content>
