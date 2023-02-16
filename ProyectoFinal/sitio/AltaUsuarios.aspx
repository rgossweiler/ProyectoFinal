<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="AltaUsuarios.aspx.cs" Inherits="AltaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 145px;
        }
        .style10
        {
            text-align: center;
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="5" style="width: 41%; margin-left: 150px;">
        <tr>
            <td class="style10" colspan="2">
                ALTA USUARIOS&nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                USUARIO:</td>
            <td>
                <asp:TextBox ID="txtUsuario" runat="server" BorderStyle="Solid" Width="200px"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
                    Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                CONTRASEÑA:</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" BorderStyle="Solid" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                NOMBRE:</td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" BorderStyle="Solid" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                APELLIDO:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtApellido" runat="server" BorderStyle="Solid" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
&nbsp;&nbsp;<asp:Label ID="lblError" runat="server"></asp:Label>
            &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnAgregar" runat="server" onclick="btnAgregar_Click" 
                    Text="Agregar" />
&nbsp;&nbsp;
                <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click" 
                    Text="Limpiar" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

