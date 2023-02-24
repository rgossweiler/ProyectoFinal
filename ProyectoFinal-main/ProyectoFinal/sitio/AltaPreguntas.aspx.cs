using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;

using EntidadesCompartidas;
using Logica;

public partial class AltaPreguntas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LimpioFormulario();
            CargoDatos();
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        string codPre = txtCodigo.Text;
        Pregunta preg = LogicaPreguntas.BuscarCodigoPregunta(codPre);
        if (preg != null)
        {
            txtCodigo.Enabled = false;
            txtPregunta.Text = preg.TextoPreguntas;
            txtRespuesta1.Text = preg.Respuesta1;
            txtRespuesta2.Text = preg.Respuesta2;
            txtRespuesta3.Text = preg.Respuesta3;
            if (preg.Correcta == 1)
                rdbtnCorrecta1.Checked = true;
            else if (preg.Correcta == 2)
                rdbtnCorrecta2.Checked = true;
            else
                rdbtnCorrecta3.Checked = true;
            ddlCategorias.DataValueField = preg.Categoria.NombreCat;
            ddlPuntaje.SelectedIndex = preg.Puntaje;
        }
        else
        {
            txtCodigo.Enabled = false;
            btnBuscar.Enabled = false;
            txtPregunta.Enabled = true;
            txtRespuesta1.Enabled = true;
            txtRespuesta2.Enabled = true;
            txtRespuesta3.Enabled = true;
            rdbtnCorrecta1.Enabled = true;
            rdbtnCorrecta2.Enabled = true;
            rdbtnCorrecta3.Enabled = true;
            ddlCategorias.Enabled = true;
            ddlPuntaje.Enabled = true;
            btnAgregar.Enabled = true;
        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            string codigo = txtCodigo.Text;
            string pregunta = txtPregunta.Text;
            string respuesta1 = txtRespuesta1.Text;
            string respuesta2 = txtRespuesta2.Text;
            string respuesta3 = txtRespuesta3.Text;

            if (pregunta == "")
                throw new Exception("La pregunta no puede quedar vacio");
            else if (respuesta1 == "")
                throw new Exception("la respuesta 1 no puede quedar vacia");
            else if (respuesta2 == "")
                throw new Exception("la respuesta 2 no puede quedar vacia");
            else if (respuesta3 == "")
                throw new Exception("la respuesta 3 no puede quedar vacia");

            int correcta;
            if (rdbtnCorrecta1.Checked)
                correcta = 1;
            else if (rdbtnCorrecta2.Checked)
                correcta = 2;
            else if (rdbtnCorrecta3.Checked)
                correcta = 3;
            else
                throw new Exception("Tiene que elegir una respuesta correcta");
            int puntaje = Convert.ToInt32(ddlPuntaje.SelectedValue);
            if (puntaje == 0)
                throw new Exception("Debe de elegir un puntaje para la pregunta");
            string aux = ddlCategorias.SelectedValue;
            if (ddlCategorias.SelectedIndex == 0)
                throw new Exception("Debe de elegir una categoría para la pregunta");
            Categorias cat = LogicaCategorias.BuscarCategoria(aux);

            Pregunta preg = new Pregunta(pregunta, respuesta1, respuesta2, respuesta3, correcta, codigo, puntaje, cat);
            LogicaPreguntas.AgregarPregunta(preg);

            lblError.ForeColor = Color.Green;
            lblError.Text = "La pregunta se creó con éxito ";
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
        lblError.Text = "";
        txtPregunta.Enabled = false;
        txtRespuesta1.Enabled = false;
        txtRespuesta2.Enabled = false;
        txtRespuesta3.Enabled = false;
        txtCodigo.Enabled = true;
        txtCodigo.Text = "";
        txtPregunta.Text = "";
        txtRespuesta1.Text = "";
        txtRespuesta2.Text = "";
        txtRespuesta3.Text = "";

        rdbtnCorrecta1.Enabled = false;
        rdbtnCorrecta2.Enabled = false;
        rdbtnCorrecta3.Enabled = false;
        rdbtnCorrecta1.Checked = false;
        rdbtnCorrecta2.Checked = false;
        rdbtnCorrecta3.Checked = false;
        btnBuscar.Enabled = true;

        ddlCategorias.Enabled = false;
        ddlPuntaje.Enabled = false;
        ddlCategorias.SelectedIndex = -1;
        ddlPuntaje.SelectedIndex = 0;
        btnAgregar.Enabled = false;
    }

    private void CargoDatos()
    {
        List<Categorias> colCategorias = LogicaCategorias.ListarCategorias();

        if (colCategorias.Count > 0)
        {
            ddlCategorias.DataSource = colCategorias;
            ddlCategorias.DataTextField = "NombreCat";
            ddlCategorias.DataValueField = "CodCat";
            ddlCategorias.DataBind();
            ddlCategorias.Items.Insert(0, new ListItem("Elija una opcion"));
        }
        else
        {
            lblError.ForeColor = Color.Blue;
            lblError.Text = "No hay Categorias Registradas";
            ddlCategorias.Enabled = false;
        }
    }
}