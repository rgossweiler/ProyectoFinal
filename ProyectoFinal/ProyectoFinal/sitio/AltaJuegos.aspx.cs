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
        lblError.Text = "";

        if (!IsPostBack)
        {
            CargoDatosDDL();
            LimpioFormulario();
        }
    }

    protected void btnBuscarNombre_Click(object sender, EventArgs e)
    {
        string nomJuego = txtNombre.Text;
        Juegos game = LogicaJuegos.BuscarJuegoNombre(nomJuego);
        if (game != null)
        {
            btnAgregar.Enabled = false;
            ddlDificultad.Enabled = false;
            ddlUsuarios.Enabled = false;
            ddlDificultad.SelectedValue = game.Dificultad;
            ddlUsuarios.SelectedValue = game.Creador.NomUsuario;
            txtCodigo.Text = (game.CodigoJuego).ToString();
        }
        else
        {
            ddlDificultad.Enabled = true;
            ddlUsuarios.Enabled = true;
            btnAgregar.Enabled = true;
            txtCodigo.Text = (LogicaJuegos.ContarJuegosExistentes()).ToString(); ;
        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            int codigo = Convert.ToInt32(txtCodigo.Text); //el codigo es autogenerado....
            string nombre = txtNombre.Text;
            List<Pregunta> preguntasJuego = new List<Pregunta>();
            DateTime fechaCreado = DateTime.Now;
            string dificultad = ddlDificultad.SelectedValue;
            string aux = ddlUsuarios.SelectedValue;
            Usuarios creador = LogicaUsuarios.BuscarUsuario(aux);

            Juegos game;

            if (ddlDificultad.SelectedIndex == 0)
            {
                lblError.ForeColor = Color.Red;
                lblError.Text = "Debe de elegir una dificultad para el juego";
            }
            else if (ddlUsuarios.SelectedIndex == 0)
            {
                lblError.ForeColor = Color.Red;
                lblError.Text = "Debe de elegir un usuario creador del juego";
            }
            else
            {
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
        btnAgregar.Enabled = false;
        btnBuscarNombre.Enabled = true;
        
        txtCodigo.Enabled = false;
        txtCodigo.Text = "";
        txtCodigo.Enabled = false;
        txtNombre.Enabled = true;
        txtNombre.Text = "";
        
        ddlDificultad.Enabled = false;
        ddlDificultad.SelectedIndex = 0;
        ddlUsuarios.Enabled = false;
        ddlUsuarios.SelectedIndex = 0;
    }

    private void CargoDatosDDL()
    {
        List<Usuarios> colUser = LogicaUsuarios.ListarUsuarios();
        Session["Usuarios"] = colUser;

        if (colUser.Count > 0)
        {
            ddlUsuarios.DataSource = colUser;
            ddlUsuarios.DataTextField = "nomUsuario";
            ddlUsuarios.DataValueField = "nomUsuario";
            ddlUsuarios.DataBind();
            ddlUsuarios.Items.Insert(0, new ListItem("Elija una opcion"));
        }
        else
        {
            lblError.ForeColor = Color.Blue;
            lblError.Text = "No hay Usuarios Registrados";
            ddlUsuarios.Enabled = false;
        }
    }
}