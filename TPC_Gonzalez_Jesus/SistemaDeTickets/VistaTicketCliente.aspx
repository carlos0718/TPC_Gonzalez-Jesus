<%@ Page Language="C#" AutoEventWireup="true" enableEventValidation="false" CodeBehind="VistaTicketCliente.aspx.cs" Inherits="SistemaDeTickets.VistaTicketCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <link href = "https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css"  rel = "stylesheet" >
    <link rel="stylesheet" href="Style.css"/>
</head>
<body>
   <form id="form" runat="server">
  
             <div class="">
            <nav class="navbar navbar-light bg-light" style="margin: 10px; width: 100%; height: 2.5cm">
                <a class="navbar-brand" style="text-align: center"><b>TICKET IT </b></a>
                

            </nav>
        </div>
        <br />
        <div class="buttons">

            <asp:Button class="btn btn-info" Font-Size="12px" ID="btn_Resolver" runat="server" Text="Resolver" OnClick="btn_Resolver_Click" />
            <asp:Button class="btn btn-info" Font-Size="12px" ID="btn_Cancelar" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" />
        </div>
        <br />
        <section style="padding-right: 50px;">
            <div class="form-group">
                <div class="row">
                    <div class="col<%--col-sm-6--%>">
                        <ul style="list-style-type: none;">

                            <li>
                                <asp:Label Class="tkt" ID="LblTktID" runat="server" Text="Ticket N° :"></asp:Label>
                                <asp:TextBox ID="txtb_Ticketid" runat="server" Width="150px" Height="31px" Enabled="false"></asp:TextBox>
                            </li>
                            <li style="margin-bottom: 6px">
                                <asp:Label ID="lbl_ReportadoPor" runat="server" Text="Reportado por :"></asp:Label>
                                <asp:TextBox ID="txtb_ReportadoPor" runat="server" Width="150px" Height="31px" Style="margin-top: 5px" Enabled="false"></asp:TextBox>
                            </li>
                            <li style="margin-bottom: 6px">
                                <asp:Label class="creator" ID="LblCreator" runat="server" Text="Creator :"></asp:Label>
                                <asp:TextBox ID="txtb_Creador" runat="server" Width="150px" Height="31px" Enabled="false"></asp:TextBox>
                            </li>
                        </ul>
                    </div>
                    <div class="col">
                        <ul <%--style="list-style-type:none; text-align:center"--%>>
                            <li style="margin-bottom: 6px">
                                <asp:Label class="status" ID="LblStatus" runat="server" Text="Status :"></asp:Label>
                                <asp:TextBox runat="server" ID="txtb_Esatdo" placeholder="Estado" Width="153px" Height="31px" Enabled="false" />
                                <%--<asp:DropDownList ID="DdlStatus" runat="server" OnSelectedIndexChanged="DdlStatus_SelectedIndexChanged" Width="153px" Height="31px"></asp:DropDownList>--%>
                            </li>
                            <li style="margin-bottom: 6px;">

                                <asp:Label class="assigned" ID="lbl_Propietario" runat="server" Text="Propietario :" />
                                <asp:TextBox runat="server" ID="txtb_Propietario" placeholder="Propietario" Width="150px" Height="31px" Enabled="false" />
                                <%--<asp:DropDownList ID="ddl_Propietario" runat="server" Width="150px" Height="31px" />--%>
                            </li>
                            <li style="margin-bottom: 6px">
                                <asp:Label class="ass-group" ID="lbl_GrupoPropietario" runat="server" Text="Grupo propietario :" />
                                <asp:TextBox runat="server" ID="txtb_GrupoPropietario" placeholder="Grupo Propietario" Width="150px" Height="31px" Enabled="false" />
                                <%--<asp:DropDownList ID="ddl_GrupoPropietario" runat="server" Width="150px" Height="31px" />--%>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <div style="text-align: justify; margin-left: 20%">
            <section>
                <asp:Label ID="LblCase" Text="Descripcion :" runat="server" />
                <asp:TextBox ID="txtb_Descripcion" Enabled="false" placeholder="Ingrese una descripcion..." runat="server" Width="715px" />
                <br />
                <asp:Label ID="lbl_Detalle" runat="server"  Text="Detalle: " /><br />
                <asp:TextBox ID="txtb_Detalle" runat="server" Enabled="false" Height="100px" Width="900px" />

            </section>
        </div>
     
        <hr />
        <br />

        <!-- CARGA REGISTROS -->

        <div id="div_CargaRegistros" runat="server" visible="false">


            <div style="text-align: justify; margin-left: 20%">
                <section>
                    <asp:Label ID="lbl_Reg_Descripcion" Text="Descripcion :" runat="server" />
                    <asp:TextBox ID="txtb_Reg_Descripcion" placeholder="Ingrese una descripcion..." runat="server" Width="715px" />
                    <br />
                    <asp:Label ID="lbl_Reg_Detalle" runat="server" Text="Detalle: " /><br />
                    <asp:TextBox ID="txtb_Reg_Detalle" runat="server" Height="100px" Width="900px" />

                    <asp:Button id="BtnAgregarRegistro" runat="server" Text="Registrar" OnClick="BtnAgregarRegistro_Click" />
                </section>
            </div>


        </div>

        <!-- VER REGISTROS -->
        <div id="div_RegistrosGrid">
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

    </form>
</body>
</html>
