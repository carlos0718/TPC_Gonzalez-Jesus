<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="SistemaDeTickets.DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <form id="form" runat="server">
         <section class="d-flex">
            <div id="sidebar-container" style="background-color: #e3f2fd;">
                <div class="logo">
                    <h4 class="font-weight-bold"> TKT IT</h4>
                </div>
                <div class="menu">
                    
                    <a href="#" runat="server" ID="a_DashBoard" onserverclick="a_DashBoard_ServerClick" style="text-decoration:none; color:black" class="d-block font-weight-bold p-3"><i class = "icon ion-md-apps mr-2 lead"></i>Abiertos </a>
                    <a href="#" runat="server" ID="a_DashBoardTodos" onserverclick="a_DashBoardTodos_ServerClick" style="text-decoration:none; color:black" class="d-block font-weight-bold p-3"><i class = "icon ion-md-clipboard mr-2 lead"></i>Todos mis tickets</a>
                    <a href="#" runat="server" ID="a_DashBoardSinPropietario" onserverclick="a_DashBoardSinPropietario_ServerClick" style="text-decoration:none; color:black" class="d-block font-weight-bold p-3"><i class = "icon ion-md-alert mr-2 lead" ></i>Sin Asignar</a>
                    <a href="#" runat="server" ID="a_Logout" onserverclick="a_Logout_ServerClick" style="text-decoration:none; color:black" class="d-block font-weight-bold p-3"><i class = "icon ion-md-alert mr-2 lead" ></i>Logout</a>
                </div>
            </div>
         
            <div ID="div_TicketGrid" style="width:100%; font-family:Courier New, Courier, monospace;  margin:15px 45px; padding-left:15px">
               <h3 style="text-align:center; background-color:aliceblue; height:2cm; padding-top:18px"><strong> Mis Tickets</strong></h3>
            
               <asp:DataGrid runat="server" ID="dg_Tickets"
                    PageSize="10" AllowPaging="True" DataKeyField="ticketid" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="black" GridLines="Both" OnItemCommand="dg_Tickets_ItemCommand" BorderColor="white">
                    <Columns>
                        <asp:BoundColumn HeaderText="Ticket" DataField="ticketid" />
                        <asp:BoundColumn HeaderText="Clase" DataField="clase" />
                        <asp:BoundColumn HeaderText="Descripcion" DataField="descripcion" />
                        <asp:BoundColumn HeaderText="Estado" DataField="Estado" />
                        <asp:BoundColumn HeaderText="Grupo Propietario" DataField="grupo_propietario" />
                        <asp:BoundColumn HeaderText="Urgencia" DataField="Urgencia" />
                        <asp:BoundColumn HeaderText="fecha_creacion" DataField="fecha_creacion" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundColumn HeaderText="Clasificacion" DataField="Clasificacion_str" />
                        <asp:ButtonColumn HeaderText="Registros" ButtonType="PushButton" Text="Ver" CommandName="btn_TkGrid_Reg" />
                    </Columns>
                </asp:DataGrid>
              </div>
             <!--   ===================================================== -->
          <%--   <div ID="div_TicketGridTodos" style="width:100%; font-family:Courier New, Courier, monospace;  margin:15px 45px; padding-left:15px">
               <h3 style="text-align:center; background-color:aliceblue; height:2cm; padding-top:18px"><strong> Mis Tickets</strong></h3>
            
               <asp:DataGrid runat="server" ID="dg_TicketsTodos"
                    PageSize="10" AllowPaging="True" DataKeyField="ticketid" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="black" GridLines="Both" OnItemCommand="dg_Tickets_ItemCommand" BorderColor="white">
                    <Columns>
                        <asp:BoundColumn HeaderText="Ticket" DataField="ticketid" />
                        <asp:BoundColumn HeaderText="Clase" DataField="clase" />
                        <asp:BoundColumn HeaderText="Descripcion" DataField="descripcion" />
                        <asp:BoundColumn HeaderText="Estado" DataField="Estado" />
                        <asp:BoundColumn HeaderText="Grupo Propietario" DataField="grupo_propietario" />
                        <asp:BoundColumn HeaderText="Urgencia" DataField="Urgencia" />
                        <asp:BoundColumn HeaderText="fecha_creacion" DataField="fecha_creacion" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundColumn HeaderText="Clasificacion" DataField="Clasificacion_str" />
                        <asp:ButtonColumn HeaderText="Registros" ButtonType="PushButton" Text="Ver" CommandName="btn_TkGrid_Reg" />
                    </Columns>
                </asp:DataGrid>
              </div>--%>
      </section>
             <br />
         <%--        <div ID="div_RegistrosGrid"> ESTO SERIA LO QUE ESTÁ DIBUJADO EN EL DEFAULT.ASPX?
                <br />Registros
                <asp:DataGrid runat="server" ID="dg_Registros"
                    PageSize="10" AllowPaging="True" DataKeyField="registroid" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="Black" GridLines="Both" >
                    <Columns>
                        <asp:BoundColumn HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:BoundColumn HeaderText="Detalle" DataField="Detalle" />
                        <asp:BoundColumn HeaderText="Fecha_creacion" DataField="Fecha_creacion" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundColumn HeaderText="Creado por" DataField="Creadopor" />
                    </Columns>
                </asp:DataGrid>
             </div>--%>


  

    </form>
   
</asp:Content>
