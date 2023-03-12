using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;

using EntidadesCompartidas;
using Logica;

public partial class AltaUsuarios : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (!IsPostBack)
            LimpiarFormularioRegistro();
    }

    protected void LimpiarFormularioRegistro()
    {
        txtNombreCompleto.Text = "";
        txtNombreCompleto.Enabled = false;
        txtNombreUsuario.Text = "";
        txtNombreUsuario.Enabled = true;
        txtPwd.Text = "";
        txtPwd.Enabled = false;
        btnBuscar.Enabled = true;

        btnAgregar.Enabled = false;
        txtNombreCompleto.Visible = true;
        btnLimpiar.Visible = true;
    }

    private void HabilitarFormulario()
    {
        txtNombreUsuario.Enabled = false;
        txtNombreCompleto.Enabled = true;
        txtPwd.Enabled = true;
        btnBuscar.Enabled = false;
        btnAgregar.Enabled = true;
    }

    protected void Buscar_Click(object sender, EventArgs e)
    {
        lblError.Text = "";

        try
        {
            if (txtNombreUsuario.Text.Trim() == "")
                throw new Exception("El numbre de usuario no puede estar vacio.");

            var usuario = Logica.LogicaUsuarios.BuscarUsuario(txtNombreUsuario.Text);

            if (usuario != null)
            {
                //txtPwd.Text = usuario.Contraseña;
                //txtNombreCompleto.Text = usuario.NombreCompleto;
                lblError.ForeColor = Color.Red;
                lblError.Text = "El usuario ya existe";
                txtNombreUsuario.Enabled = false;
                btnBuscar.Enabled = false;
            }
            else
            {
                lblError.Text = "El usuario no existe, desea agregarlo?";
                HabilitarFormulario();
            }
        }
        catch (Exception ex)
        {
            LimpiarFormularioRegistro();
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
    protected void Registrarse_Click(object sender, EventArgs e)
    {
        lblError.Text = "";

        try
        {
            if (txtNombreCompleto.Text.Trim() == "")
            {
                lblError.ForeColor = Color.Red;
                lblError.Text = "El nombre no puede estar vacio.";
            }

            Usuarios nuevoUsuario = new Usuarios(txtNombreUsuario.Text, txtPwd.Text, txtNombreCompleto.Text);

            var registrado = Logica.LogicaUsuarios.AgregarUsuario(nuevoUsuario);

            if (registrado == 1)
            {
                lblError.ForeColor = Color.Green;
                lblError.Text = "Usuario registrado exitosamente";
                btnAgregar.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
    protected void OpcRegistro_Click(object sender, EventArgs e)
    {
        LimpiarFormularioRegistro();
    }
}