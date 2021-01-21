<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SistemaDeTickets.DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <form id="form" runat="server">
         <section class="d-flex">
            <div id="sidebar-container" style="background-color: #e3f2fd;">
                <div class="logo">
                    <h4 class="font-weight-bold"> TKT IT</h4>
                </div>
                <div class="menu">
                    <a href="#" style="text-decoration:none; color:black" class="d-block font-weight-bold p-3"><i class = "icon ion-md-apps mr-2 lead"></i>Dashboard </a>
                    <a href="#" style="text-decoration:none; color:black" class="d-block font-weight-bold p-3"><i class = "icon ion-md-clipboard mr-2 lead"></i>My Tickect's </a>
                    <a href="#" style="text-decoration:none; color:black" class="d-block font-weight-bold p-3"><i class = "icon ion-md-alert mr-2 lead" ></i>Unassigned tkt</a>
                    <a href="#" style="text-decoration:none; color:black" class="d-block font-weight-bold p-3"></a>
                </div>
            </div>

        </section> 

    </form>
   
</asp:Content>
