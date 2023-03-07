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
        txtNombreCompleto.Text = "";
        txtNombreUsuario.Text = "";
        txtPwd.Text = "";
        InisiarSession.Visible = true;

        txtNombreCompleto.Visible = false;
        btnSesion.Visible = false;
    }
    protected void LimpiarFormularioRegistro()
    {
        InisiarSession.Attributes.Add("style", "padding: 15px 20px !important;");

        txtNombreCompleto.Text = "";
        txtNombreUsuario.Text = "";
        txtPwd.Text = "";
        InisiarSession.Visible = false;

        txtNombreCompleto.Visible = true;
        btnSesion.Visible = true;
    }

    protected void IniciarSesion_Click(object sender, EventArgs e)
    {
        lblError.Text = "";

        try
        {
            Usuarios usuario = new Usuarios(txtNombreUsuario.Text, txtPwd.Text, txtNombreCompleto.Text);
            var logueo = Logica.LogicaUsuarios.LogeoUsuario(txtNombreUsuario.Text, txtPwd.Text);

            if (logueo == 1)
            {
                Session["Administrador"] = LogicaUsuarios.BuscarUsuario(txtNombreUsuario.Text);
                Response.Redirect("PrincipalAdmin.aspx",false);
            }
            else
            {

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