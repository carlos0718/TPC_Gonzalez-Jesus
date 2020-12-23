<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaDeTickets.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="form" runat="server">
        <div>
            <div class="form-box" id="login-box" style="width:300px; margin:0px 400px">
                <div class="card-header" style="text-align:center"> Iniciar Sesion </div>
                <div class="card-body bg-secondary">
                    <div class="form-group">
                        <asp:TextBox ID="TxtUsuer" runat="server" CssClass="form-control" placeholder="Ingrese usuario..."></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TxtPass" runat="server" CssClass="form-control" placeholder="Ingrese password..."></asp:TextBox>
                    </div>
                    <div class="card-footer" style="text-align:center">
                        <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" />
                    </div>
                </div>
            </div>
             
        </div>
    </form>
</asp:Content>
