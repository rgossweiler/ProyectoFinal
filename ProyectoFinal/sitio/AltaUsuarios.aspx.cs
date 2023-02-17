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
        if (!IsPostBack)
            LimpioFormulario();
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        Usuarios user = LogicaUsuarios.BuscarUsuario(txtUsuario.Text);
        if (user == null)
        {
            lblError.ForeColor = Color.Blue;
            lblError.Text = "Usuario no registrado – ingrese los datos para registrar un nuevo usuario";

            txtPassword.Enabled = true;
            txtNombre.Enabled = true;
            txtApellido.Enabled = true;
            txtUsuario.Enabled = false;
            btnBuscar.Enabled = false;
            btnAgregar.Enabled = true;
        }
        else
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = "Usuario registrado – elija un nuevo nombre de usuario";
            LimpioFormulario();
        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            string usuario, password, nombre, apellido, nombreCompleto;
            usuario = txtUsuario.Text;
            password = txtPassword.Text;
            nombre = txtNombre.Text;
            apellido = txtApellido.Text;
            nombreCompleto = nombre + " " + apellido;

            Usuarios user = new Usuarios(usuario, password, nombreCompleto);
            LogicaUsuarios.AgregarUsuario(user);
            lblError.ForeColor = Color.Green;
            lblError.Text = "Registro de usuario exitoso";
            LimpioFormulario();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
    }

    private void LimpioFormulario()
    {
        txtUsuario.Enabled = true;
        txtUsuario.Text = "";
        txtPassword.Enabled = false;
        txtPassword.Text = "";
        txtNombre.Enabled = false;
        txtNombre.Text = "";
        txtApellido.Enabled = false;
        txtApellido.Text = "";
        btnAgregar.Enabled = false;
        btnBuscar.Enabled = true;
    }
}