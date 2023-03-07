using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using EntidadesCompartidas;
using Logica;

public partial class Jugar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            lblError.Text = "Presiona el botón comenzar para iniciar la partida";
            LimpioFormulario();
            CargarListaJuego();
            int aux = 0, puntaje = 0;
            Session["Contador"] = aux;
            Session["puntaje"] = puntaje;
        }
    }

    protected void btnOpcion1_Click(object sender, EventArgs e)
    {
        btnOpcion1.Enabled = false;
        btnOpcion2.Enabled = false;
        btnOpcion3.Enabled = false;
        
        Pregunta p = (Pregunta)Session["Pregunta"];
        if (p.Correcta == 1)
        {
            btnOpcion1.BackColor = Color.Green;
            cargarPuntaje(p);
            lblError.Text = "Respuesta Correcta";
        }
        else if(p.Correcta == 2)
        {
            btnOpcion1.BackColor = Color.Red;
            btnOpcion2.BackColor = Color.Green;
            lblError.Text = "Respuesta incorrecta";
        }
        else
        {
            btnOpcion1.BackColor = Color.Red;
            btnOpcion3.BackColor = Color.Green;
            lblError.Text = "Respuesta incorrecta";
        }
    }

    protected void btnOpcion2_Click(object sender, EventArgs e)
    {
        btnOpcion1.Enabled = false;
        btnOpcion2.Enabled = false;
        btnOpcion3.Enabled = false;

        Pregunta p = (Pregunta)Session["Pregunta"];
        if (p.Correcta == 2)
        {
            btnOpcion2.BackColor = Color.Green;
            cargarPuntaje(p);
            lblError.Text = "Respuesta Correcta";
        }
        else if (p.Correcta == 1)
        {
            btnOpcion2.BackColor = Color.Red;
            btnOpcion1.BackColor = Color.Green;
            lblError.Text = "Respuesta incorrecta";
        }
        else
        {
            btnOpcion2.BackColor = Color.Red;
            btnOpcion3.BackColor = Color.Green;
            lblError.Text = "Respuesta incorrecta";
        }
    }

    protected void btnOpcion3_Click(object sender, EventArgs e)
    {
        btnOpcion1.Enabled = false;
        btnOpcion2.Enabled = false;
        btnOpcion3.Enabled = false;

        Pregunta p = (Pregunta)Session["Pregunta"];
        if (p.Correcta == 3)
        {
            btnOpcion3.BackColor = Color.Green;
            cargarPuntaje(p);
            lblError.Text = "Respuesta Correcta";
        }
        else if (p.Correcta == 1)
        {
            btnOpcion3.BackColor = Color.Red;
            btnOpcion1.BackColor = Color.Green;
            lblError.Text = "Respuesta incorrecta";
        }
        else
        {
            btnOpcion3.BackColor = Color.Red;
            btnOpcion2.BackColor = Color.Green;
            lblError.Text = "Respuesta incorrecta";
        }
    }

    private void CargoDatos(Pregunta p)
    {

        btnOpcion1.Enabled = true;
        btnOpcion2.Enabled = true;
        btnOpcion3.Enabled = true;

        Session["Pregunta"] = p;
        txtPregunta.Text = p.TextoPreguntas;
        btnOpcion1.Text = p.Respuesta1;
        btnOpcion2.Text = p.Respuesta2;
        btnOpcion3.Text = p.Respuesta3;
    }

    private void LimpioFormulario()
    {
        txtPregunta.Enabled = false;
        txtPregunta.Text = "";
        txtPuntajeTotal.Enabled = false;
        txtPuntajeTotal.Text = "0";
        btnOpcion1.Text = "";
        btnOpcion1.Enabled = false;
        btnOpcion2.Text = "";
        btnOpcion2.Enabled = false;
        btnOpcion3.Text = "";
        btnOpcion3.Enabled = false;
        btnSiguiente.Enabled = true;
        lblError.Text = "";
        btnSiguiente.Enabled = false;
        btnSiguiente.Text = "Comenzar";
        btnSiguiente.Visible = true;
        btnJugoNuevo.Visible = false;
        ddlJuegos.Enabled = true;
    }

    private void cargarPuntaje(Pregunta p)
    {
        int puntaje = (int)Session["puntaje"];
        puntaje = puntaje + p.Puntaje;
        txtPuntajeTotal.Text = puntaje.ToString();
        Session["puntaje"] = puntaje;
    }

    private void CargarListaJuego()
    {
        List<Juegos> games = LogicaJuegos.ListarJuegosPreguntas();
        Session["Juegos"] = games;
        ddlJuegos.DataSource = games;
        ddlJuegos.DataTextField = "nombreJuego";
        ddlJuegos.DataBind();
        ddlJuegos.Items.Insert(0, new ListItem("Elija un juego"));
    }

    protected void btnSiguiente_Click(object sender, EventArgs e)
    {
        

        int aux = (int)Session["contador"];
        
        try
        {
            lblError.Text = "";

            if (txtPlayer.Text == "")
                throw new Exception("Ingrese su nombre");

            Juegos juego = (Juegos)Session["Juego"];
            
            if (aux < juego.PreguntasJuego.Count)
            {
                lblPreguntas.Text = (aux + 1) + "/" + juego.PreguntasJuego.Count;

                CargoDatos(juego.PreguntasJuego[aux]);
                btnSiguiente.Text = "Siguiente pregunta";
                
                aux++;
                Session["contador"] = aux;

                if (aux == juego.PreguntasJuego.Count)
                {
                    btnSiguiente.Text = "Finalizar";
                    lblError.Text = "Ultima Pregunta";
                }

                btnOpcion1.Enabled = true;
                btnOpcion1.BackColor = Color.White;
                btnOpcion2.Enabled = true;
                btnOpcion2.BackColor = Color.White;
                btnOpcion3.Enabled = true;
                btnOpcion3.BackColor = Color.White;

            }
            else
            {
                if (txtPlayer.Text == "")
                {
                    throw new Exception("Debe de ingresar un nombre de jugador");
                }
                else
                {
                    int puntajeTotal = Convert.ToInt32(txtPuntajeTotal.Text);
                    LogicaJugadas.AgregarJugada(txtPlayer.Text, juego, puntajeTotal);
                    btnSiguiente.Visible = false;
                    btnJugoNuevo.Visible = true;
                    throw new Exception(txtPlayer.Text + " obtuvo el puntaje " + puntajeTotal);
                    
                }
            }

         // if()
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void ddlJuegos_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlJuegos.SelectedIndex != 0)
        {
            ddlJuegos.Enabled = false;
            btnSiguiente.Enabled = true;
            List<Juegos> games = (List<Juegos>)Session["Juegos"];
            Juegos game = games[ddlJuegos.SelectedIndex-1];
            Session["Juego"] = game;
        }
    }

    protected void btnJugoNuevo_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
        int aux = 0;
        Session["Contador"] = aux;

    }
}