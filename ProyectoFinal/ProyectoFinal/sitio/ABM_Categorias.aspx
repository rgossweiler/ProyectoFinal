<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="ABM_Categorias.aspx.cs" Inherits="ABM_Categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style2
        {
        }
        .style6
        {
            text-align: center;
        }
        .style8
        {
            font-size: xx-large;
            text-align: center;
        }
        .style9
        {
        width: 235px;
        text-align: left;
    }
    .style10
    {
        width: 863px;
        height: 43px;
    }
    .style11
    {
        text-align: left;
        width: 863px;
    }
    .style12
    {
        width: 235px;
        text-align: left;
        height: 43px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table border="4" style="width: 45%; margin-left: 150px;">
            <tr>
                <td class="style6" colspan="2">
                    <span class="style8">MANTENIMIENTO CATEGORIAS</span><br />
                </td>
            </tr>
            <tr>
                <td class="style12">
                    CODIGO</td>
                <td class="style11">
                    <asp:TextBox ID="txtCodigo" runat="server" BorderStyle="Solid"></asp:TextBox>
                &nbsp;&nbsp;
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                        onclick="btnBuscar_Click1" BorderStyle="Solid" />
                </td>
            </tr>
            <tr>
                <td class="style9">
                    NOMBRE CODIGO:</td>
                <td class="style11">
                    <asp:TextBox ID="txtNombreCodigo" runat="server" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6" colspan="2">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" 
                        onclick="btnAgregar_Click" BorderStyle="Solid" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" 
                        onclick="btnModificar_Click" BorderStyle="Solid" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                        onclick="btnEliminar_Click" BorderStyle="Solid" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                        onclick="btnLimpiar_Click" BorderStyle="Solid" />
                </td>
            </tr>
            <tr>
                <td class="style6" colspan="2">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

