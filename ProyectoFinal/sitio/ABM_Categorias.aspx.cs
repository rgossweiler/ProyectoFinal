using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;
using System.Drawing;

public partial class ABM_Categorias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";

        if (!IsPostBack)
            LimpioFormulario();
    }

    private void LimpioFormulario()
    {

        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;
        btnAgregar.Enabled = false;
        btnBuscar.Enabled = true;

        txtCodigo.Text = "";
        txtCodigo.Enabled = true;
        txtNombreCodigo.Text = "";
        txtNombreCodigo.Enabled = false;
    }

    private void ActivoBotones(bool esAlta)
    {
        btnModificar.Enabled = !esAlta;
        btnEliminar.Enabled = !esAlta;
        btnAgregar.Enabled = esAlta;
        btnBuscar.Enabled = false;

        txtCodigo.Enabled = false;
        txtNombreCodigo.Enabled = true;
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            Categorias oCategoria = (Categorias)Session["UnaCategoria"];

            oCategoria.NombreCat = txtNombreCodigo.Text.Trim();

            LogicaCategorias.ModificarCategoria(oCategoria);

            lblError.ForeColor = Color.Green;
            lblError.Text = "Modificacion exitosa";

        }
        catch (Exception ex)
        {

            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            Categorias oCategoria = (Categorias)Session["UnaCategoria"];

            LogicaCategorias.EliminarCategoria(oCategoria);
            lblError.ForeColor = Color.Green;
            lblError.Text = "Eliminacion exitosa";
        }
        catch (Exception ex)
        {

            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }





    protected void btnBuscar_Click1(object sender, EventArgs e)
    {
        try
        {
            Categorias oCategoria = LogicaCategorias.BuscarCategoria(txtCodigo.Text.Trim());

            if (oCategoria != null)
            {
                //Muestro el nombre//Habilito Edición
                txtNombreCodigo.Text = oCategoria.NombreCat;
                ActivoBotones(false);
            }
            else
            {
                ActivoBotones(true);
                lblError.ForeColor = Color.Blue;
                lblError.Text = "El código no esta registrado en el sistema";
            }

            Session["UnaCategoria"] = oCategoria;

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


    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            string codigo = txtCodigo.Text;
            string nombreCat = txtNombreCodigo.Text;

            Categorias oCategoria = new Categorias(codigo, nombreCat);
            LogicaCategorias.AgregarCategoria(oCategoria);
            lblError.ForeColor = Color.Green;
            lblError.Text = "Alta con éxito";

            LimpioFormulario();

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}