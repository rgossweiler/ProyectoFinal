<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="AltaPreguntas.aspx.cs" Inherits="AltaPreguntas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style10
        {
            text-align: center;
            font-size: xx-large;
        }
        .style11
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="5" style="width: 59%; margin-left: 150px;">
        <tr>
            <td class="style10" colspan="2">
                ALTA PREGUNTAS</td>
        </tr>
        <tr>
            <td class="style1">
                CODIGO:</td>
            <td class="style11">
                &nbsp;
                <asp:TextBox ID="txtCodigo" runat="server" Width="200px" BorderStyle="Solid"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
                    Text="Buscar" />
                &nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtCodigo" ErrorMessage="debe de ser 3 letras y 2 numeros" 
                    ForeColor="#CC0000" ValidationExpression="[a-zA-Z]{3}\d{2}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                PREGUNTA:</td>
            <td class="style11">
                &nbsp;
                <asp:TextBox ID="txtPregunta" runat="server" Width="400px" BorderStyle="Solid"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                OPCION 1:</td>
            <td style="text-align: left">
                &nbsp;
                <asp:TextBox ID="txtRespuesta1" runat="server" Width="400px" 
                    BorderStyle="Solid"></asp:TextBox>
                <asp:RadioButton ID="rdbtnCorrecta1" runat="server" GroupName="Correcta" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                OPCION 2:</td>
            <td style="text-align: left">
&nbsp;&nbsp;<asp:TextBox ID="txtRespuesta2" runat="server" Width="400px" BorderStyle="Solid"></asp:TextBox>
                <asp:RadioButton ID="rdbtnCorrecta2" runat="server" GroupName="Correcta" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                OPCION 3:</td>
            <td style="text-align: left">
                &nbsp;&nbsp;<asp:TextBox ID="txtRespuesta3" runat="server" Width="400px" 
                    BorderStyle="Solid"></asp:TextBox>
                <asp:RadioButton ID="rdbtnCorrecta3" runat="server" GroupName="Correcta" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                PUNTAJE:</td>
            <td style="text-align: left">
                <asp:DropDownList ID="ddlPuntaje" runat="server" Height="16px" Width="200px">
                    <asp:ListItem Value="0">Elija una opcion</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" style="text-align: left">
                CATEGORIA:</td>
            <td align="center" style="text-align: left">
                <asp:DropDownList ID="ddlCategorias" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                &nbsp;&nbsp;
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
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
                &nbsp;&nbsp;
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

