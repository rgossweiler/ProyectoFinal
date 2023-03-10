<%@ Page Title="" Language="C#" MasterPageFile="~/Players.master" AutoEventWireup="true" CodeFile="Logueo.aspx.cs" Inherits="Logueo" %>

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

        .pwdText{
            background-color: #f6f6f6 !important;
            border: none !important;
            color: #0d0d0d !important;
            padding: 15px 32px !important;
            text-align: center !important;
            text-decoration: none !important;
            display: inline-block !important;
            font-size: 16px !important;
            margin: 5px !important;
            width: 85% !important;
            border: 2px solid #f6f6f6 !important;
            -webkit-transition: all 0.5s ease-in-out !important;
            -moz-transition: all 0.5s ease-in-out !important;
            -ms-transition: all 0.5s ease-in-out !important;
            -o-transition: all 0.5s ease-in-out !important;
            transition: all 0.5s ease-in-out !important;
            -webkit-border-radius: 5px 5px 5px 5px !important;
            border-radius: 5px 5px 5px 5px !important;
        }
    </style>
</head>
<body>
   <div class="wrapper fadeInDown">
  <div id="formContent" style="margin-top:-50px" align="center">
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
        <asp:TextBox ID="txtPwd" runat="server" class="fadeIn second pwdText" name="login" TextMode="Password" placeholder="Contraseña" ></asp:TextBox>

         <asp:Button  ID="InisiarSession"  runat="server" onclick="IniciarSesion_Click" 
                      Text="Iniciar Sesion" />


 <!-- Usar esta clase para animar el inicio de sesion:type="submit" value="Log In" class="fadeIn fourth"-->
    <!-- Remind Passowrd -->
       
    <div id="formFooter" >
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Width="300px"></asp:Label>        
        <asp:LinkButton ID="btnSesion" runat="server" onclick="OpcIinicioSesion_Click" BorderColor="#333399" Visible="False" CssClass="auto-style1" Width="142px" >Iniciar Sesion</asp:LinkButton>
    </div>

    </form>

  </div>
</div>
    
</body>
</html>
</asp:Content>

