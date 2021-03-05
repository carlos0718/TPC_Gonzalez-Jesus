<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaDeTickets._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form" runat="server">
        <div class="">
            <nav class="navbar navbar-light bg-light" style="margin: 10px; width:100%; height:2.5cm">
                <a class="navbar-brand" style="text-align:center" ><b> TICKET IT </b></a>
                        <%--<ID="txtb_Buscar" input style="width:300px ; " class="form-control mr-sm-2" type="search" placeholder="Numero de ticket" aria-label="Search">--%>
                        <asp:TextBox runat="server" ID="txtb_Buscar" Width="300px" CssClass="form-control mr-sm-2" placeholder="Numero de ticket" />
                        <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
                        <asp:Button runat="server" ID="btn_Buscar" CssClass="btn btn-outline-success ny-2 my-sm-0" Text="Buscar"  OnClick="btn_Buscar_Click" />
                    
            </nav>
         </div><br />
         <div class="buttons">   
            <asp:Label Class="tkt" ID="lbl_EsPropietario" runat="server" Text="Soy propietario? :"></asp:Label>
            <asp:CheckBox ID="chkb_EsPropietario" runat="server"  Enabled="true"/>
            <asp:Button class="btn btn-info" font-size="12px" ID="btn_Guardar" runat="server" Text="Grabar Datos" />
            <asp:Button class="btn btn-info" font-size="12px" ID="btn_Resolver" runat="server" Text="Resolver" />
            <asp:Button class="btn btn-info" font-size="12px" ID="btn_Cancelar" runat="server" Text="Cancelar" />
            <asp:Button class="btn btn-info" font-size="12px" ID="btn_TomarPropiedad" runat="server" Text="Tomar prop." />
            <asp:Button class="btn btn-info" font-size="12px" ID="btn_Derivar" runat="server" Text="Derivar" />
         </div>
        <br />
        <section style="padding-right:50px;">
            <div class="form-group">
                <div class="row" >   
                    <div class="col<%--col-sm-6--%>">            
                     <ul style="list-style-type:none;">
         
                           <li> 
                               <asp:Label Class="tkt" ID="LblTktID" runat="server" Text="Ticket N° :"></asp:Label>
                                <asp:TextBox ID="txtb_Ticketid" runat="server" Width="150px" Height="31px" Enabled="false"></asp:TextBox>
                           </li>
                           <li style="margin-bottom:6px"> 
                                <asp:Label ID="lbl_ReportadoPor" runat="server" Text="Reportado por :"></asp:Label>
                                <asp:TextBox ID="txtb_ReportadoPor" runat="server" Width="150px" Height="31px" style="margin-top:5px" Enabled="false"></asp:TextBox>
                           </li>
                            <li style="margin-bottom:6px">
                                <asp:Label class="creator" ID="LblCreator" runat="server" Text="Creator :"></asp:Label>
                                <asp:TextBox ID="txtb_Creador" runat="server" Width="150px" Height="31px" Enabled="false"></asp:TextBox>
                            </li>
                    </ul>
                    </div>
                    <div class="col">     
                        <ul <%--style="list-style-type:none; text-align:center"--%>>
                            <li style="margin-bottom:6px">
                                <asp:Label class="status" ID="LblStatus" runat="server" Text="Status :"></asp:Label>
                                <asp:TextBox runat="server" ID="txtb_Esatdo" placeholder="Estado" Width="153px" Height="31px" Enabled="false"/>
                                <%--<asp:DropDownList ID="DdlStatus" runat="server" OnSelectedIndexChanged="DdlStatus_SelectedIndexChanged" Width="153px" Height="31px"></asp:DropDownList>--%>
                            </li>
                            <li style="margin-bottom:6px;">
                                
                                <asp:Label class="assigned" ID="lbl_Propietario" runat="server" Text="Propietario :" />
                                <asp:TextBox runat="server" ID="txtb_Propietario" placeholder="Propietario" Width="150px" Height="31px" Enabled="false"/>
                                <%--<asp:DropDownList ID="ddl_Propietario" runat="server" Width="150px" Height="31px" />--%>
                            </li>
                            <li style="margin-bottom:6px">
                                <asp:Label class="ass-group" ID="lbl_GrupoPropietario" runat="server" Text="Grupo propietario :" />
                                <asp:TextBox runat="server" ID="txtb_GrupoPropietario" placeholder="Grupo Propietario" Width="150px" Height="31px" Enabled="false" />
                                <%--<asp:DropDownList ID="ddl_GrupoPropietario" runat="server" Width="150px" Height="31px" />--%>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
        </section>
        <div style="text-align:justify;margin-left:20%">
            <section>
                <asp:Label ID="LblCase" Text="Descripcion :" runat="server" />
                <asp:TextBox ID="txtb_Descripcion" placeholder="Ingrese una descripcion..." runat="server" Width="715px" />  
                <br />
                    <asp:Label ID="lbl_Detalle" runat="server" Text="Detalle: " /><br />
                    <asp:TextBox ID="txtb_Detalle" runat="server" Height="100px" Width="900px"  />
                
            </section>
        </div><br /><br />
        <hr /><br />
            <div ID="div_RegistrosGrid"> 
                <strong>Registros de trabajo</strong>
                <asp:DataGrid runat="server" ID="dg_Registros"
                    PageSize="10" AllowPaging="True" DataKeyField="registroid" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="Black" GridLines="Both" BorderColor="white">
                    <Columns>
                        <asp:BoundColumn HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:BoundColumn HeaderText="Detalle" DataField="Detalle" />
                        <asp:BoundColumn HeaderText="Fecha_creacion" DataField="Fecha_creacion" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundColumn HeaderText="Creado por" DataField="Creadopor" />
                    </Columns>
                </asp:DataGrid>
             </div>


    </form><br /><br />
       <%-- <asp:DropDownList ID="TIpoTicket" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>--%>

</asp:Content>
