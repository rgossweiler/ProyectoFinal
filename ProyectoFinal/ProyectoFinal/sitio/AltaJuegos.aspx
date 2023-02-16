<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="AltaJuegos.aspx.cs" Inherits="AltaJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            height: 31px;
        }
        .style3
        {
            height: 31px;
            width: 176px;
        }
        .style4
        {
            width: 176px;
        }
        .style5
        {
            font-size: xx-large;
        }
        .style6
        {
            width: 36px;
            font-size: large;
            text-align: left;
        }
        .style7
        {
            height: 43px;
            width: 36px;
            text-align: left;
        }
        .style8
        {
            height: 43px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="5" style="width: 47%; margin-left: 0px;">
        <tr>
            <td colspan="2" style="text-align: center" class="style5">
                ALTA JUEGOS</td>
        </tr>
        <tr>
            <td class="style6">
                NOMBRE:</td>
            <td class="style8">
                <asp:TextBox ID="txtNombre" runat="server" BorderStyle="Solid"></asp:TextBox>
            &nbsp;&nbsp;
                <asp:Button ID="btnBuscarNombre" runat="server" BorderStyle="Solid" 
                    onclick="btnBuscarNombre_Click" Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                CODIGO:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtCodigo" runat="server" BorderStyle="Solid"></asp:TextBox>
            &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style6">
                DIFICULTAD:</td>
            <td style="text-align: left">
                <asp:DropDownList ID="ddlDificultad" runat="server">
                    <asp:ListItem Value="0">Elegir una opcion</asp:ListItem>
                    <asp:ListItem>Facil</asp:ListItem>
                    <asp:ListItem>Medio</asp:ListItem>
                    <asp:ListItem>Dificil</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style6">
                CREADOR:</td>
            <td style="text-align: left">
                <asp:DropDownList ID="ddlUsuarios" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:Button ID="btnAgregar" runat="server" BorderStyle="Solid" Text="Agregar" 
                    onclick="btnAgregar_Click" />
&nbsp;
                <asp:Button ID="btnLimpiar" runat="server" BorderStyle="Solid" Text="Limpiar" 
                    onclick="btnLimpiar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

