﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="ManejoPreguntasJuegos.aspx.cs" Inherits="ManejoPreguntasJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 1000px;
            text-align: center;
        }
        .style2
        {
        }
        .style4
        {
            height: 25px;
            text-align: center;
        }
        .style5
        {
            height: 168px;
            text-align: center;
        }
        .style7
        {
            text-align: center;
            font-weight: bolder;
            font-size: xx-large;
        }
        .Boton
        {}
        .style8
        {
            width: 167px;
            height: 46px;
        }
        .style9
        {
            width: 300px;
            height: 46px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="2" style="width: 50%; margin-left: 150px;">
        <tr>
            <td class="style1" colspan="2">
                MANEJO PREGUNTAS JUEGO</td>
        </tr>
        <tr>
            <td class="style8">
                Seleccione juego</td>
            <td class="style9">
                <asp:DropDownList ID="ddlJuego" runat="server">
                </asp:DropDownList>
                <asp:Button ID="btnConsultar" runat="server" CssClass="Boton" Font-Bold="True" 
                    onclick="btnConsultar_Click" Text="CONSULTAR" Width="297px" />
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                <asp:Label ID="lblJuegoSeleccionado" runat="server" Font-Bold="True" 
                    Font-Size="Large"></asp:Label>
            &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="2">
                <asp:GridView ID="gvPregAsociadas" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" 
                    onselectedindexchanged="gvListaPreguntas_SelectedIndexChanged" 
                    Width="1000px" style="margin-right: 0px" AllowPaging="True" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="CodPregunta" HeaderText="Código Pregunta" />
                        <asp:BoundField DataField="TextoPreguntas" HeaderText="Pregunta" />
                        <asp:BoundField DataField="Puntaje" HeaderText="Puntaje" />
                        <asp:CommandField ButtonType="Button" SelectText="Vincular Pregunta" 
                            ShowSelectButton="True" />
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
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:Label ID="lblPreguntasSistema" runat="server" Font-Bold="True" 
                    Font-Size="Large"></asp:Label>
            &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:GridView ID="gvListaPreguntas" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" 
                    onselectedindexchanged="gvListaPreguntas_SelectedIndexChanged" 
                    Width="1000px" style="margin-right: 0px" AllowPaging="True" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="CodPregunta" HeaderText="Código Pregunta" />
                        <asp:BoundField DataField="TextoPreguntas" HeaderText="Pregunta" />
                        <asp:BoundField DataField="Puntaje" HeaderText="Puntaje" />
                        <asp:CommandField ButtonType="Button" SelectText="Vincular Pregunta" 
                            ShowSelectButton="True" />
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
            </td>
        </tr>
        <tr>
            <td class="style10" colspan="2">
                <asp:Button ID="btnLimpiar" CssClass="Boton" runat="server" Font-Bold="True" 
                    Text="LIMPIAR" BorderColor="Black" BorderStyle="Groove" Width="270px" 
                    onclick="btnLimpiar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style10" colspan="2">
                <asp:Label ID="lblError" runat="server"></asp:Label>
                &nbsp;
                </td>
        </tr>
    </table>
    </asp:Content>

