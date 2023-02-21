<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="AltaJuegos.aspx.cs" Inherits="AltaJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style5
        {
            font-size: xx-large;
        }
        .style6
        {
            font-size: large;
            text-align: left;
        }
        .style8
        {
            height: 43px;
            text-align: left;
            width: 478px;
        }
        .style9
        {
            width: 478px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="5" style="width: 51%; margin-left: 150px;">
        <tr>
            <td colspan="2" style="text-align: center" class="style5">
                ALTA JUEGOS</td>
        </tr>
        <tr>
            <td class="style6">
                CODIGO:</td>
            <td class="style8">
                <asp:TextBox ID="txtCodigo" runat="server" BorderStyle="Solid"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Button ID="btnBuscar" runat="server" BorderStyle="Solid" 
                    onclick="btnBuscar_Click" Text="Buscar" ValidationGroup="Buscar" />
            &nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtCodigo" ErrorMessage="El codigo es incorrecto" 
                    Operator="GreaterThan" Type="Integer" ValidationGroup="Buscar" 
                    ValueToCompare="0" ForeColor="Red">Numero entero mayor a 0</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                NOMBRE:</td>
            <td class="style8">
                <asp:TextBox ID="txtNombre" runat="server" BorderStyle="Solid"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtNombre" ErrorMessage="CompareValidator" ForeColor="Red" 
                    ValidationGroup="Juegos">Campo Obligatorio</asp:CompareValidator>
                </td>
        </tr>
        <tr>
            <td class="style6">
                DIFICULTAD:</td>
            <td style="text-align: left" class="style9">
                <asp:DropDownList ID="ddlDificultad" runat="server">
                    <asp:ListItem Value="0">Elegir una opcion</asp:ListItem>
                    <asp:ListItem>Facil</asp:ListItem>
                    <asp:ListItem>Medio</asp:ListItem>
                    <asp:ListItem>Dificil</asp:ListItem>
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="ddlDificultad" ErrorMessage="CompareValidator" 
                    ForeColor="Red" ValidationGroup="Juegos">Campo Obligatorio</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style11" colspan="2">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style11" colspan="2">
                <asp:Button ID="btnAgregar" runat="server" BorderStyle="Solid" Text="Agregar" 
                    onclick="btnAgregar_Click" />
&nbsp;&nbsp;
                <asp:Button ID="btnModificar" runat="server" BorderStyle="Solid" 
                    onclick="btnModificar_Click" Text="Modificar" />
&nbsp;&nbsp;
                <asp:Button ID="btnLimpiar" runat="server" BorderStyle="Solid" Text="Limpiar" 
                    onclick="btnLimpiar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style11" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

