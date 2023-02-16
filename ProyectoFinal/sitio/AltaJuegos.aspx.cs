using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;
using System.Drawing;

public partial class AltaJuegos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LimpioFormulario();
            lblError.Text = "";
        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            string nombre = txtNombre.Text;
            List<Pregunta> preguntasJuego = new List<Pregunta>();
            DateTime fechaCreado = DateTime.Now;
            string dificultad = ddlDificultad.SelectedValue;
            Usuarios creador;

            Juegos game;

            if (ddlDificultad.SelectedIndex == 0)
            {
                lblError.ForeColor = Color.Red;
                lblError.Text = "Debe de elegir una dificultad para el juego";
            }
            else
            {
                creador = (Usuarios)Session["Administrador"];
                game = new Juegos(nombre, 0, fechaCreado, dificultad, creador, preguntasJuego);
                LogicaJuegos.AgregarJuego(game);

                LimpioFormulario();
                lblError.ForeColor = Color.Green;
                lblError.Text = "El juego se creó correctamente";
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
        LimpioFormulario();
    }

    private void LimpioFormulario()
    {
        txtNombre.Text = "";
        ddlDificultad.SelectedIndex = 0;
    }
}