<%@ Page Title="" Language="C#" MasterPageFile="~/Players.master" AutoEventWireup="true" CodeFile="Jugar.aspx.cs" Inherits="Jugar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 253px;
            text-align: left;
        }
        .style3
        {
            text-align: right;
        }
        .style31
        {
            text-align: center;
            height: 61px;
        }
        .style20
        {
            text-align: right;
        }
        .style32
        {
            font-size: xx-large;
        }
        .style35
        {
            text-align: center;
            height: 45px;
        }
        .style36
        {
            text-align: right;
            height: 45px;
            width: 350px;
            margin-left: 40px;
        }
        .style40
        {
            width: 564px;
            text-align: center;
            height: 45px;
        }
        .style29
        {
            text-align: right;
        }
        .style28
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="5" style="width: 62%; margin-left: 150px;">
        <tr>
            <td class="style32" colspan="3">
                JUGAR!</td>
        </tr>
        <tr>
            <td class="style20">
                Elija un juego:
                <asp:DropDownList ID="ddlJuegos" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlJuegos_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style29">
                Puntaje total:</td>
            <td class="style28">
                <asp:TextBox ID="txtPuntajeTotal" runat="server" BorderColor="Black" 
                    BorderStyle="Solid" style="text-align: left">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                &nbsp;<asp:TextBox ID="txtPregunta" runat="server" Height="98px" Width="853px" 
                    BorderStyle="Solid"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style31">
                <asp:Button ID="btnOpcion1" runat="server" Width="201px" 
                    onclick="btnOpcion1_Click" BorderStyle="Solid" />
            </td>
            <td class="style31">
                <asp:Button ID="btnOpcion2" runat="server" Width="201px" 
                    onclick="btnOpcion2_Click" BorderStyle="Solid" />
            </td>
            <td class="style31">
                <asp:Button ID="btnOpcion3" runat="server" Width="201px" onclientclick="true" 
                    onclick="btnOpcion3_Click" BorderStyle="Solid" />
            </td>
        </tr>
        <tr>
            <td class="style35" colspan="3">
                &nbsp;
                <asp:Label ID="lblError" runat="server">Presiona el botón comenzar para iniciar la partida</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style35">
                player:
                <asp:TextBox ID="txtPlayer" runat="server" BorderStyle="Solid"></asp:TextBox>
            </td>
            <td class="style40">
                <asp:Button ID="btnSiguiente" runat="server" onclick="btnSiguiente_Click" 
                    Text="Comenzar" BorderStyle="Solid" />
            </td>
            <td class="style36">
                <asp:Label ID="lblPreguntas" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

