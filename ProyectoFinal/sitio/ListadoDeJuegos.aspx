<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="ListadoDeJuegos.aspx.cs" Inherits="ListadoDeJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            text-align: center;
        }
        .style50
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="left" border="5" style="width: 53%; margin-left: 150px;">
        <tr>
            <td style="font-size: xx-large;" class="style5">
                LISTADO DE JUEGOS</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:DropDownList ID="ddlJuego" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlJuego_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style50">
                <asp:GridView ID="gvJugadas" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" AllowPaging="True" PageSize="5" Width="1030px">
                    <Columns>
                        <asp:BoundField DataField="fechaHoraJugada" HeaderText="Fecha Jugada" />
                        <asp:BoundField DataField="nombreJugador" HeaderText="Jugador" />
                        <asp:BoundField DataField="puntajeTotal" HeaderText="Puntaje Total" />
                        <asp:BoundField HeaderText="codigoJuego" DataField="codigoJuego" 
                            Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="center" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:GridView ID="gvPreguntas" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" AllowPaging="True" PageSize="5" Width="1031px">
                    <Columns>
                        <asp:BoundField DataField="TextoPreguntas" HeaderText="Pregunta" />
                        <asp:BoundField DataField="respuesta1" HeaderText="Opcion 1" />
                        <asp:BoundField DataField="respuesta2" HeaderText="Opcion 2" />
                        <asp:BoundField DataField="respuesta3" HeaderText="Opcion 3" />
                        <asp:BoundField HeaderText="codigoJuego" InsertVisible="False" 
                            DataField="codigoJuego" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="center" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="lblError1" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblError2" runat="server"></asp:Label>
            &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click" 
                    Text="Limpiar" />
            </td>
        </tr>
    </table>
</asp:Content>

