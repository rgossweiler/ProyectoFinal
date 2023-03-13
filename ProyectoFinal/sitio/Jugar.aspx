<%@ Page Title="" Language="C#" MasterPageFile="~/Players.master" AutoEventWireup="true" CodeFile="Jugar.aspx.cs" Inherits="Jugar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        table{
            margin-left: 10px;
            margin-top: 23px;
            border-radius: 27px !important;
            background-color:snow;
            border-color: black;
            border-collapse: inherit !important;
        }
        tr,td{
            border: none;
            border-color: transparent;
        }
        }
        .style32
        {
            font-size: xx-large;
            text-align: center;
            height: 100px !important;
        }
        .style35
        {
            text-align: center;
            height: 71px;
            padding-bottom: 34px !important;
            padding-top: 55px;
            font-size: 20px;
        }
        .style36
        {
            text-align: right;
            height: 45px;
            width: 351px;
            margin-left: 40px;
        }
        .style40
        {
            width: 503px;
            text-align: center;
            height: 45px;
        }
        .style41
        {
            text-align: center;
            height: 38px;
            width: 351px;
        }
        .style42
        {
            text-align: center;
            height: 38px;
            width: 503px;
        }
        .style44
        {
            text-align: center;
            height: 38px;
            width: 365px;
        }
        .style45
        {
            text-align: center;
            height: 45px;
            width: 365px;
            font-family: cursive;
        }
        .auto-style1 {
            width: 73%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div Align="center">
    <table class="auto-style1" border="5">
        <tr style="height: 90px;">
            <td class="style32" colspan="3">
               <a style="font-size: 30px;margin-left: 11.4em;font-family: cursive;">JUGAR!</a></td>
        </tr>
        <tr style="height: 50px;">
            <td style="text-align:center;">
               <a>
                <asp:DropDownList ID="ddlJuegos" runat="server" style="margin-top:6px;width: 155px;" AutoPostBack="True" 
                    onselectedindexchanged="ddlJuegos_SelectedIndexChanged">
                </asp:DropDownList>
                   </a>           
            </td>
            <td >
                <asp:TextBox ID="txtDificultad" style="margin-top: 8px;margin-left: 40px;" runat="server" BorderStyle="Solid" Width="100px"></asp:TextBox>&nbsp;&nbsp;
                <asp:TextBox ID="txtFecha" runat="server" BorderStyle="Solid" Width="100px"></asp:TextBox>
             </td>
            <td style="text-align:center"><a>Puntaje Total: 
                <asp:TextBox ID="txtPuntajeTotal" runat="server" BorderColor="Black" 
                    BorderStyle="Solid" style="text-align: center; width:50px">0</asp:TextBox>
                </a>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                &nbsp;<asp:TextBox ID="txtPregunta" runat="server" Height="98px" style="width:-webkit-fill-available; margin-top:6px; text-align:center" 
                    BorderStyle="Solid"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style44">
                <asp:Button ID="btnOpcion1" runat="server" Width="146px" 
                    onclick="btnOpcion1_Click" style="margin-bottom: -80px;" BorderStyle="Solid" />
            </td>
            <td class="style42">
                <asp:Button ID="btnOpcion2" runat="server" Width="146px" 
                    onclick="btnOpcion2_Click" style="margin-bottom: -80px;" BorderStyle="Solid" />
            </td>
            <td class="style41">
                <asp:Button ID="btnOpcion3" runat="server" style="margin-bottom: -80px;" Width="146px" onclientclick="true" 
                    onclick="btnOpcion3_Click" BorderStyle="Solid" />
            </td>
        </tr>
        <tr>
            <td class="style35" colspan="3">
                &nbsp;
                <asp:Label ID="lblError" runat="server">Presiona el botón comenzar para iniciar la partida</asp:Label>
            &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style45">
               <a style="font-size:20px"> Player:</a>
                <asp:TextBox ID="txtPlayer" runat="server" BorderStyle="Solid" style="width: 130px;"></asp:TextBox>
            </td>
            <td class="style40">
                <asp:Button ID="btnSiguiente" runat="server" onclick="btnSiguiente_Click" 
                    Text="Comenzar" BorderStyle="Solid" />
            &nbsp;&nbsp;
                <asp:Button ID="btnJugoNuevo" runat="server" onclick="btnJugoNuevo_Click" 
                    Text="Juego Nuevo" Visible="False" />
            </td>
            <td class="style36">
                <asp:Label ID="lblPreguntas" runat="server" style="margin-right: 10px;"></asp:Label>
            </td>
        </tr>
    </table>
        </div>
</asp:Content>

