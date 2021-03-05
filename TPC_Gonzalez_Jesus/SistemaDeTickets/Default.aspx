<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaDeTickets._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form" runat="server">
        <div class="container">
            <nav class="navbar navbar-light bg-light" style="margin: 30px 110px; width:100%">
                <a class="navbar-brand" style="text-align:center" ><b> TICKET IT </b></a>
                        <%--<ID="txtb_Buscar" input style="width:300px ; " class="form-control mr-sm-2" type="search" placeholder="Numero de ticket" aria-label="Search">--%>
                        <asp:TextBox runat="server" ID="txtb_Buscar" Width="300px" CssClass="form-control mr-sm-2" placeholder="Numero de ticket" />
                        <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
                        <asp:Button runat="server" ID="btn_Buscar" CssClass="btn btn-outline-success ny-2 my-sm-0" Text="Buscar"  OnClick="btn_Buscar_Click" />
                    
            </nav>
         </div>
         <div class="buttons">   
            <asp:Button class="btn btn-info" font-size="12px" ID="btnUpdate" runat="server" Text="Update" />
            <asp:Button class="btn btn-info" font-size="12px" ID="btnResolved" runat="server" Text="Resolved" />
            <asp:Button class="btn btn-info" font-size="12px" ID="btnClose" runat="server" Text="Close" />
            <asp:Button class="btn btn-info" font-size="12px" ID="btnCancel" runat="server" Text="Cancel" />
            <asp:Button class="btn btn-info" font-size="12px" ID="btnOpen" runat="server" Text="Re-Open" />
         </div>
        <br />
        <section>
            <div class="form-group">
                <div class="row">   
                    <div class="col<%--col-sm-6--%>">            
                     <ul <%--style="list-style-type:none; text-align:center"--%>>
                           <li"> 
                               <asp:Label Class="tkt" ID="LblTktID" runat="server" Text="Ticket N° :"></asp:Label>
                                <asp:TextBox ID="txtb_Ticketid" runat="server" Width="150px" Height="31px"></asp:TextBox>
                           </li>
                           <li style="margin-bottom:6px"> 
                                <asp:Label ID="LblAffectedUser" runat="server" Text="Affected User :"></asp:Label>
                                <asp:TextBox ID="TxtAffectedUser" runat="server" Width="150px" Height="31px" style="margin-top:5px"></asp:TextBox>
                           </li>
                            <li style="margin-bottom:6px">
                                <asp:Label class="creator" ID="LblCreator" runat="server" Text="Creator :"></asp:Label>
                                <asp:TextBox ID="TxtCreator" runat="server" Width="150px" Height="31px"></asp:TextBox>
                            </li>
                    </ul>
                    </div>
                    <div class="col">     
                        <ul <%--style="list-style-type:none; text-align:center"--%>>
                            <li style="margin-bottom:6px">
                                <asp:Label class="status" ID="LblStatus" runat="server" Text="Status :"></asp:Label>
                                <asp:TextBox runat="server" ID="txtb_Esatdo" placeholder="Estado" Width="153px" Height="31px" />
                                <%--<asp:DropDownList ID="DdlStatus" runat="server" OnSelectedIndexChanged="DdlStatus_SelectedIndexChanged" Width="153px" Height="31px"></asp:DropDownList>--%>
                            </li>
                            <li style="margin-bottom:6px">
                                
                                <asp:Label class="assigned" ID="lbl_Propietario" runat="server" Text="Propietario :" />
                                <asp:TextBox runat="server" ID="txtb_Propietario" placeholder="Propietario" Width="150px" Height="31px" Enabled="false"/>
                                <%--<asp:DropDownList ID="ddl_Propietario" runat="server" Width="150px" Height="31px" />--%>
                            </li>
                            <li style="margin-bottom:6px">
                                <asp:Label class="ass-group" ID="lbl_GrupoPropietario" runat="server" Text="Grupo propietario :" />
                                <asp:TextBox runat="server" ID="txtb_GrupoPropietario" placeholder="Grupo Propietario" Width="150px" Height="31px" Enabled="false"/>
                                <%--<asp:DropDownList ID="ddl_GrupoPropietario" runat="server" Width="150px" Height="31px" />--%>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
        </section>
        <div style="text-align:center">
            <section>
                <asp:Label ID="LblCase" Text="Descripcion :" runat="server" />
                <asp:TextBox ID="txtb_Descripcion" placeholder="Ingrese una descripcion..." runat="server" Width="715px" />  
                <div >
                    <asp:Label ID="lbl_Detalle" runat="server" Text="Detalle: " />
                    <div style="text-align:center">
                        <asp:TextBox ID="txtb_Detalle" runat="server" Height="195px" Width="789px"  />
                    </div>
                </div>
            </section>
        </div>
    </form>
       <%-- <asp:DropDownList ID="TIpoTicket" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>--%>
   

</asp:Content>
