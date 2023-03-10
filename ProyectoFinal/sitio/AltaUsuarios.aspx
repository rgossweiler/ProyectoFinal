<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.master" AutoEventWireup="true" CodeFile="AltaUsuarios.aspx.cs" Inherits="AltaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="Fonts/login.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
   <div class="wrapper fadeInDown">
  <div id="formContent" align="center">
    <!-- Tabs Titles -->
    <h2 class="active"> 
         <asp:Label ID="Titulo" runat="server" Text="Iniciar Sesion"></asp:Label>
    </h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="Fonts/PerfilUsuario.png" id="icon" width="200" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form >
    
        <asp:TextBox ID="txtNombreUsuario" runat="server" class="fadeIn second" name="login" placeholder="Nombre de usuario" ></asp:TextBox>
        <asp:TextBox ID="txtPwd" runat="server" class="fadeIn second" name="login" placeholder="Contraseña" ></asp:TextBox>
        <asp:TextBox ID="txtNombreCompleto" runat="server" class="fadeIn second" name="login" placeholder="Nombre completo" Visible="true" ></asp:TextBox>     

         <asp:Button  ID="InisiarSession"  runat="server" onclick="Buscar_Click" 
                      Text="Buscar" />

        <asp:Button type="submit" ID="Registrarse"  runat="server" onclick="Registrarse_Click" 
                     value="Log In" Text="Registrarse" Visible="true" />

        <asp:Button type="submit" ID="Limpiar"  runat="server" onclick="LimpiarFormulario_Click" 
                     value="Log In" Text="Limpiar" Visible="true" />

 <!-- Usar esta clase para animar el inicio de sesion:type="submit" value="Log In" class="fadeIn fourth"-->
    <!-- Remind Passowrd -->
       
    <div id="formFooter" style="display:flex !important">
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Width="300px"></asp:Label>
         <asp:LinkButton ID="btnRegistro" runat="server" onclick="OpcRegistro_Click" BorderColor="#333399" Visible="False" >Regisrarse</asp:LinkButton>
        <asp:LinkButton ID="btnSesion" runat="server" onclick="OpcIinicioSesion_Click" BorderColor="#333399" Visible="False" CssClass="auto-style1" Width="142px" >Iniciar Sesion</asp:LinkButton>
    </div>

    </form>

  </div>
</div>
    
</body>
</html>
    </asp:Content>
