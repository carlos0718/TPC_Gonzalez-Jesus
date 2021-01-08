<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaDeTickets._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form" runat="server">
        <div class="container">
            <nav class="navbar navbar-light bg-light" style="margin: 30px 10px">
                <a class="navbar-brand">TICKET IT</a>
                        <input style="width:300px ; " class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    
            </nav>
         </div>
        <div style="text-align:right">   

                    <asp:Button ID="btnResolved" runat="server" Text="Resolved" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    <asp:Button ID="btnOpen" runat="server" Text="Re-Open" />
        </div>
        <br />
        <section>
            <div class="form-group">
                <div class="row">   
                    <div class="col-sm-6">            
                     <ul style="list-style-type:none; text-align:center">
                           <li style="margin-bottom:6px"> 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblTktID" runat="server" Text="Ticket N° :"></asp:Label>
                                <asp:TextBox ID="TxtID" runat="server" Width="180px"></asp:TextBox>
                           </li>
                           <li style="margin-bottom:6px"> 
                                <asp:Label ID="LblAffectedUser" runat="server" Text="Affected User :"></asp:Label>
                                <asp:TextBox ID="TxtAffectedUser" runat="server"></asp:TextBox>
                           </li>
                            <li style="margin-bottom:6px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="LblCreator" runat="server" Text="Creator :"></asp:Label>
                                <asp:TextBox ID="TxtCreator" runat="server"></asp:TextBox>
                            </li>
                    </ul>
                    </div>
                    <div class="col-sm-6">     
                        <ul style="list-style-type:none; text-align:center">
                            <li style="margin-bottom:6px">
                                &nbsp;<%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="LblStatus" runat="server" Text="Status :"></asp:Label>
                                <asp:DropDownList ID="DdlStatus" runat="server" OnSelectedIndexChanged="DdlStatus_SelectedIndexChanged" Width="153px" Height="31px"></asp:DropDownList>
                            </li>
                            <li style="margin-bottom:6px">
                                <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp--%>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="LblAssigned" runat="server" Text="Assigned :"></asp:Label>
                                <asp:DropDownList ID="DdlAssigned" runat="server" Width="150px" Height="31px"></asp:DropDownList>
                            </li>
                            <li style="margin-bottom:6px">
                                <asp:Label ID="LblAssignedGroup" runat="server" Text="Assigned Group :"></asp:Label>
                                <asp:DropDownList ID="DdlAssignedGroup" runat="server" Width="150px" Height="31px"></asp:DropDownList>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
        </section>
        <div style="text-align:center">
            <section>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblCase" Text="Case :" runat="server" />
                <asp:TextBox ID="TxtCase" placeholder="Enter Case title" runat="server" Width="715px" />  
                <div >
                    <asp:Label ID="LblDescripton" runat="server" Text="Description "></asp:Label>
                    <div style="text-align:center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server" Height="195px" Width="789px"></asp:TextBox>
                    </div>
                </div>
            </section>
        </div>
    </form>
       <%-- <asp:DropDownList ID="TIpoTicket" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>--%>
   

</asp:Content>
