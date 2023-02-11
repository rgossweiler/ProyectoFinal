<%@ Page Title="" Language="C#" MasterPageFile="~/MPAdministradores.master" AutoEventWireup="true" CodeFile="ManejoPreguntasJuegos.aspx.cs" Inherits="ManejoPreguntasJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
        }
        .style3
        {
            width: 602px;
        }
        .style4
        {
            height: 25px;
        }
        .style5
        {
            height: 210px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <table border="2" style="width: 65%;">
        <tr>
            <td class="style1" colspan="3" style="font-weight: bolder">
                MANEJO PREGUNTAS JUEGO</td>
        </tr>
        <tr>
            <td class="style1">
                Seleccione juego</td>
            <td class="style2" colspan="2">
                <asp:DropDownList ID="ddlJuego" runat="server">
                </asp:DropDownList>
&nbsp;
                <asp:Button ID="btnConsultar" runat="server" CssClass="Boton" Font-Bold="True" 
                    onclick="btnConsultar_Click" Text="CONSULTAR" Width="481px" />
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="3">
                <asp:Label ID="lblJuegoSeleccionado" runat="server" Font-Bold="True" 
                    Font-Size="Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="3">
                <asp:GridView ID="gvPregAsociadas" runat="server" AutoGenerateColumns="False" 
                    BorderColor="#000066" BorderStyle="Solid" CellPadding="4" ForeColor="#333333" 
                    onselectedindexchanged="gvPregAsociadas_SelectedIndexChanged" Width="857px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="CodPregunta" HeaderText="Codigo Pregunta" />
                        <asp:BoundField DataField="TextoPregunta" HeaderText="Texto Pregunta" />
                        <asp:BoundField DataField="Puntaje" HeaderText="Puntaje" />
                        <asp:CommandField ButtonType="Button" SelectText="Desvincular Pregunta" 
                            ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                <asp:Label ID="lblPreguntasSistema" runat="server" Font-Bold="True" 
                    Font-Size="Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                <asp:GridView ID="gvListaPreguntas" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" ForeColor="Black" GridLines="Vertical" 
                    onselectedindexchanged="gvListaPreguntas_SelectedIndexChanged" 
                    Width="852px" style="margin-right: 0px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="CodPregunta" HeaderText="Código Pregunta" />
                        <asp:BoundField DataField="TextoPregunta" HeaderText="Texto Pregunta" />
                        <asp:BoundField DataField="Puntaje" HeaderText="Puntaje" />
                        <asp:CommandField ButtonType="Button" SelectText="Vincular Pregunta" 
                            ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnLimpiar" CssClass="Boton" runat="server" Font-Bold="True" 
                    Text="LIMPIAR" BorderColor="Black" BorderStyle="Groove" Width="270px" 
                    onclick="btnLimpiar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Principal.aspx">HomePage</asp:LinkButton>
                </td>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div>
    </div>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

