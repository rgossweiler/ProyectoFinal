<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="AltaUsuarios.aspx.cs" Inherits="AltaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <link href="Fonts/login.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }   
        .textBx{
            background-color: #f6f6f6 !important;
            color: #0d0d0d !important;
            padding: 15px 11px !important;
            text-align: center !important;
            text-decoration: none !important;
            display: list-item !important;
            font-size: 19px !important;
            margin: 5px !important;
            margin-left: 113px !important;
            width: 60% !important;
            border: 2px solid #f6f6f6 !important;
            transition: all 0.5s ease-in-out !important;
            border-radius: 5px 5px 5px 5px !important;
        }
        .btnBuscar{
            margin-left: 38em !important;
            margin-top: -199px !important;
            padding: 19px 15px !important;
        }
    </style>
</head>
<body>
   <div class="wrapper fadeInDown">
  <div id="formContent" align="center" style="margin-top: -124px;">
    <!-- Tabs Titles -->
    <h2 class="active"> 
         <asp:Label ID="Titulo" runat="server" Text="Alta Usuario"></asp:Label>
    </h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="Fonts/PerfilUsuario.png" id="icon" width="200" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form >
    
        <asp:TextBox ID="txtNombreUsuario" CssClass="textBx" runat="server" name="login" placeholder="Nombre de usuario" ></asp:TextBox>
        <asp:TextBox ID="txtPwd" CssClass="textBx" runat="server" name="login" placeholder="Contraseña" Visible="true" ></asp:TextBox>
        <asp:TextBox ID="txtNombreCompleto" CssClass="textBx" runat="server"  name="login" placeholder="Nombre completo" Visible="true" ></asp:TextBox>     

         <asp:Button  ID="btnBuscar" CssClass="btnBuscar" runat="server" onclick="Buscar_Click" 
                      Text="Buscar" />

        <asp:Button type="submit" ID="btnAgregar"  runat="server" onclick="Registrarse_Click" 
                     value="Log In" Text="Agregar" Visible="true" />


 <!-- Usar esta clase para animar el inicio de sesion:type="submit" value="Log In" class="fadeIn fourth"-->
    <!-- Remind Passowrd -->
       
    <div id="formFooter">
        <asp:Label ID="lblError" runat="server" ForeColor="Red" style="font-size:20px;display:inline-block !important;" Width="441px"></asp:Label>
         <asp:LinkButton align="right" style="margin-right:-53px" ID="btnLimpiar" runat="server" onclick="OpcRegistro_Click" BorderColor="#333399" Visible="true" >Limpiar</asp:LinkButton>
    </div>
    </div>

    </form>

  </div>
</div>
    
</body>
</html>
    </asp:Content>