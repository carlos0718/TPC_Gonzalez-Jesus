<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaDeTickets._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <form id="form" runat="server">
        <section>
            <div class="container">
                <div class="row">   
                    <div class="col-sm-6">            
                     <ul style="list-style-type:none;">
                           <li> 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblTktID" runat="server" Text="Ticket N° :"></asp:Label>
                                <asp:TextBox ID="TxtID" runat="server" Width="152px"></asp:TextBox>
                           </li>
                            <li>
                                <asp:Label ID="LblAffectedUser" runat="server" Text="Affected User :"></asp:Label>
                                <asp:TextBox ID="TxtAffectedUser" runat="server"></asp:TextBox>
                            </li>
                            <li>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblCreator" runat="server" Text="Creator :"></asp:Label>
                                <asp:TextBox ID="TxtCreator" runat="server"></asp:TextBox>
                            </li>
                    </ul>
                    </div>
                    <div class="col-sm-6">     
                        <ul style="list-style-type:none;">
                            <li>
                                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                <asp:Label ID="LblStatus" runat="server" Text="Status :"></asp:Label>
                                <asp:DropDownList ID="TxtStatus" runat="server" Width="150px"></asp:DropDownList>
                            </li>
                            <li>
                                <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp--%>
                                <asp:Label ID="LblAssigned" runat="server" Text="Assigned :"></asp:Label>
                                <asp:DropDownList ID="DdlAssigned" runat="server" Width="150px"></asp:DropDownList>
                            </li>
                            <li>
                                <asp:Label ID="LblAssignedGroup" runat="server" Text="Assigned Group :"></asp:Label>
                                <asp:DropDownList ID="DslAssignedGroup" runat="server" Width="150px"></asp:DropDownList>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
        </section>
    </form>
       <%-- <asp:DropDownList ID="TIpoTicket" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>--%>
   

</asp:Content>
