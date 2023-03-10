<%@ Page Title="" Language="C#" MasterPageFile="~/Players.master" AutoEventWireup="true" CodeFile="Principal.aspx.cs" Inherits="Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="logoImage" Align="center">
        <div  style="height: 234px; overflow: auto;">   
            <asp:GridView ID="gvPuntajes" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="0" style="text-align: center; margin-top: 50px;overflow:scroll" 
                Height="250px" Width="840px" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="fechaHoraJugada" DataFormatString="{0:MM/dd/yy}" 
                        HeaderText="Fecha" />
                    <asp:BoundField DataField="juego.nombreJuego" HeaderText="Juego" />
                    <asp:BoundField DataField="nombreJugador" HeaderText="Nombre" />
                    <asp:BoundField DataField="puntajeTotal" HeaderText="Puntaje" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
         <a href="" target="_blank">
      <asp:Image ID="logoImg" class="logo" style="
        width: 190px;
        margin-top: -190px;
        margin-bottom: -116px !important;
        margin-left: 998px;
        padding-left: 3;
        transform: scaleX(-1);" src="Fonts/images/confucio.png" alt="" runat="server"/>
	  </a>
        </div>
       
        </a>
       
</asp:Content>



