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
        lblError.Text = "";
        if (!IsPostBack)
            LimpiarFormularioInicioSesion();
    }

    protected void LimpiarFormularioInicioSesion()
    {
        txtNombreUsuario.Text = "";
        txtPwd.Text = "";
        InisiarSession.Visible = true;

        btnSesion.Visible = false;
    }
    protected void LimpiarFormularioRegistro()
    {
        InisiarSession.Attributes.Add("style", "padding: 15px 20px !important;");

        txtNombreUsuario.Text = "";
        txtPwd.Text = "";
        InisiarSession.Visible = false;

        btnSesion.Visible = true;
    }

    protected void IniciarSesion_Click(object sender, EventArgs e)
    {
        lblError.Text = "";

        try
        {
            var logueo = Logica.LogicaUsuarios.LogeoUsuario(txtNombreUsuario.Text, txtPwd.Text);

            if (logueo == 1)
            {
                Session["Administrador"] = LogicaUsuarios.BuscarUsuario(txtNombreUsuario.Text);
                Response.Redirect("PrincipalAdmin.aspx",false);
            }
        }
        catch (Exception ex)
        {
            LimpiarFormularioInicioSesion();
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void OpcIinicioSesion_Click(object sender, EventArgs e)
    {
        Titulo.Text = "Iniciar Sesion";
        LimpiarFormularioInicioSesion();
    }
}