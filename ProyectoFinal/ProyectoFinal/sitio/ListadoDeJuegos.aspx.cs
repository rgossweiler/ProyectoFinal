using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using EntidadesCompartidas;
using Logica;

public partial class ListadoDeJuegos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargoDatosDDL();
            btnLimpiar_Click(sender, e);
        }
    }
    
    private void CargoDatosDDL()
    {
        List<Juegos> game = LogicaJuegos.ListarJuegosPreguntas();
        Session["juegos"] = game;

        if (game.Count > 0)
        {
            ddlJuego.DataSource = game;
            ddlJuego.DataTextField = "nombreJuego";
            ddlJuego.DataBind();
            ddlJuego.Items.Insert(0, new ListItem("Elija una opcion"));
        }
        else
        {
            lblError1.ForeColor = Color.Red;
            lblError1.Text = "No hay juegos registrados";
            ddlJuego.Enabled = false;
        }
    }

    private void CargoDatosGvPreguntas(Juegos game)
    {
        List<Pregunta> question = LogicaPreguntas.ListarPreguntasJuego(game.CodigoJuego);

        if (question.Count > 0)
        {
            gvPreguntas.DataSource = question;
            gvPreguntas.DataBind();
        }
        else
        {
            lblError2.ForeColor = Color.Red;
            lblError2.Text = "El juego no tiene preguntas asociadas";
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        lblError1.Text = "";
        gvJugadas.DataSource = null;
        gvJugadas.DataBind();
        gvPreguntas.DataSource = null;
        gvPreguntas.DataBind();
        
    }

    protected void ddlJuego_SelectedIndexChanged(object sender, EventArgs e)
    {
        try 
	    {
            lblError1.Text = "";
		    int indice = ddlJuego.SelectedIndex;
            if (indice == 0)
            {
                btnLimpiar_Click(sender, e);
                throw new Exception("Debe elegir un juego");
            }
            List<Juegos> games = (List<Juegos>)Session["juegos"];
            Juegos game = games[indice-1];
            List<Jugadas> records = LogicaJugadas.ListarJugadasJuego(game);
            if (records.Count > 0)
            {
                gvJugadas.DataSource = records;
                gvJugadas.DataBind();
                CargoDatosGvPreguntas(game);
            }
            else
            {
                lblError1.ForeColor = Color.Red;
                lblError1.Text = "Nadie a jugado este juego aun";

            }
	    }
	    catch (Exception ex)
	    {
            lblError1.ForeColor = Color.Red;
            lblError1.Text = ex.Message; 
	    }
    }
}