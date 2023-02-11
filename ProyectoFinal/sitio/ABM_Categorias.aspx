<%@ Page Title="" Language="C#" MasterPageFile="~/MPAdministradores.master" AutoEventWireup="true" CodeFile="ABM_Categorias.aspx.cs" Inherits="ABM_Categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 177px;
        }
        .style2
        {
            width: 153px;
        }
        .style3
        {
            width: 426px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <p>
        MANTENIMIENTO CATEGORIAS</p>
    <p>
        &nbsp;</p>
    <div>
        <table border="4" style="width: 65%;">
            <tr>
                <td class="style1">
                    CODIGO</td>
                <td class="style2">
                    <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
                </td>
                <td class="style3">
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                        onclick="btnBuscar_Click1" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    NOMBRE CODIGO</td>
                <td class="style2">
                    <asp:TextBox ID="txtNombreCodigo" runat="server"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" 
                        onclick="btnAgregar_Click" />
                </td>
                <td class="style2">
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" 
                        onclick="btnModificar_Click" />
                </td>
                <td class="style3">
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                        onclick="btnEliminar_Click" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                        onclick="btnLimpiar_Click" />
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
                <td class="style2">
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Principal.aspx">HomePage</asp:LinkButton>
                </td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

