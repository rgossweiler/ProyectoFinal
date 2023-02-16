<%@ Page Title="" Language="C#" MasterPageFile="~/Players.master" AutoEventWireup="true" CodeFile="Logueo.aspx.cs" Inherits="Logueo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style4
        {
            text-align: center;
            width: 412px;
            font-size: xx-large;
        }
        .style5
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="5" 
        style="width: 58%; height: 78px; margin-top: 0px; margin-left: 150px;">
        <tr>
            <td class="style4" colspan="2">
                INICIAR SESSION</td>
        </tr>
        <tr>
            <td class="style5">
                Usuario:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtUsuario" runat="server" BorderStyle="Solid"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
&nbsp;Contraseña:&nbsp;
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtContraseña" runat="server" BorderStyle="Solid"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnIngresar" runat="server" onclick="btnIngresar_Click" 
                    Text="Ingresar" />
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click" 
                    Text="Limpiar" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

