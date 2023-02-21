<%@ Page Title="" Language="C#" MasterPageFile="~/Players.master" AutoEventWireup="true" CodeFile="Logueo.aspx.cs" Inherits="Logueo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style5
        {
            text-align: left;
            width: 148px;
        }
        .style40
        {
            text-align: center;
            font-size: xx-large;
        }
        .style41
        {
            width: 148px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="5" 
        style="width: 33%; height: 78px; margin-top: 0px; margin-left: 150px;">
        <tr>
            <td class="style40" colspan="2">
                INICIAR SESIÒN</td>
        </tr>
        <tr>
            <td class="style5">
                Usuario:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtUsuario" runat="server" BorderStyle="Solid"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: left" class="style41">
&nbsp;Contraseña:&nbsp;
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtContraseña" runat="server" BorderStyle="Solid" 
                    TextMode="Password"></asp:TextBox>
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
            &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

