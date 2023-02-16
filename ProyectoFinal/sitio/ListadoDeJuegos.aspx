<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="ListadoDeJuegos.aspx.cs" Inherits="ListadoDeJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="5" style="width: 53%; margin-left: 150px;">
        <tr>
            <td style="text-align: center; font-size: xx-large;">
                LISTADO DE JUEGOS</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:DropDownList ID="ddlJuego" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlJuego_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:GridView ID="gvJugadas" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="fechaHoraJugada" HeaderText="Fecha Jugada" />
                        <asp:BoundField DataField="nombreJugador" HeaderText="Jugador" />
                        <asp:BoundField DataField="puntajeTotal" HeaderText="Puntaje Total" />
                        <asp:BoundField HeaderText="codigoJuego" DataField="codigoJuego" 
                            Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:GridView ID="gvPreguntas" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="Preguntas" HeaderText="Pregunta" />
                        <asp:BoundField DataField="respuesta1" HeaderText="Opcion 1" />
                        <asp:BoundField DataField="respuesta2" HeaderText="Opcion 2" />
                        <asp:BoundField DataField="respuesta3" HeaderText="Opcion 3" />
                        <asp:BoundField HeaderText="codigoJuego" InsertVisible="False" 
                            DataField="codigoJuego" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lblError1" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblError2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click" 
                    Text="Limpiar" />
            </td>
        </tr>
    </table>
</asp:Content>

