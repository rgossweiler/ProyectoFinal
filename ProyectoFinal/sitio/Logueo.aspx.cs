using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using EntidadesCompartidas;
using Logica;

public partial class Logueo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            btnLimpiar_Click(sender, e);
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtUsuario.Text == "")
                throw new Exception("Debe ingresar un usuario");
            else if (txtContraseña.Text == "")
                throw new Exception("Debe de ingresar una contraseña");
            if (LogicaUsuarios.LogeoUsuario(txtUsuario.Text, txtContraseña.Text) == 0)
                throw new Exception("Usuario o Contraseña incorrectas");
            else
            {
                lblError.ForeColor = Color.Green;
                lblError.Text = "Ingreso correctamente";
                Session["Administrador"] = LogicaUsuarios.BuscarUsuario(txtUsuario.Text);
                Response.Redirect("PrincipalAdmin.aspx");
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message; 
        }
        
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        txtUsuario.Text = "";
        txtContraseña.Text = "";
    }
}