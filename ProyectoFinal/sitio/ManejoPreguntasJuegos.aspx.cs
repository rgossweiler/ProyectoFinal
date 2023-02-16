using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;
using System.Drawing;

public partial class ManejoPreguntasJuegos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";

        if (!IsPostBack)
            CargoDatos();
    }

    private void LimpioFormulario()
    {
        gvListaPreguntas.Visible = false;
        gvPregAsociadas.Visible = false;
        ddlJuego.SelectedIndex = 0;
        lblError.Text = "";
        lblJuegoSeleccionado.Text = "";
        lblPreguntasSistema.Text = "";

    }

    private void CargoDatos()
    {
        try
        {
            List<Juegos> colJuegos = LogicaJuegos.ListarJuegos();
            Session["Juegos"] = colJuegos;

            if (colJuegos.Count > 0)
            {
                ddlJuego.DataSource = colJuegos;
                ddlJuego.DataTextField = "nombreJuego";
                ddlJuego.DataValueField = "codigoJuego";
                ddlJuego.DataBind();
                ddlJuego.Items.Insert(0, new ListItem("-------------"));
            }

            else
            {
                lblError.ForeColor = Color.Red;
                lblError.Text = "No existen juegos registrados en el sistema";

                ddlJuego.Enabled = false;
                btnLimpiar.Enabled = false;
                btnConsultar.Enabled = false;
                gvListaPreguntas.Visible = false;
                gvPregAsociadas.Visible = false;

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


    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        try
        {
            int codJuego;
            Juegos oJuego = null;
            List<Juegos> colJuegos = (List<Juegos>)Session["Juegos"];
            lblJuegoSeleccionado.ForeColor = Color.Black;

            //Verifico que se hayan seleccionado un juego

            if (ddlJuego.SelectedIndex != 0)
                codJuego = Convert.ToInt32(ddlJuego.SelectedValue);
            else
            {
                gvPregAsociadas.DataSource = null;
                gvPregAsociadas.DataBind();
                throw new Exception("Seleccione un juego");
            }



            //Busco los objetos en las colecciones

            foreach (Juegos J in colJuegos)
            {
                if (J.CodigoJuego == codJuego)
                {
                    oJuego = J;
                    break;
                }
            }

            List<Pregunta> colPreguntasJuego = LogicaPreguntas.ListarPreguntasJuego(codJuego);
            Session["PreguntasJuego"] = colPreguntasJuego;
            Session["JuegoSeleccionado"] = oJuego;

            if (colPreguntasJuego.Count > 0)
            {

                gvPregAsociadas.Visible = true;
                lblJuegoSeleccionado.Text = "Listado de preguntas asociadas al juego seleccionado";
                gvPregAsociadas.DataSource = colPreguntasJuego;
                gvPregAsociadas.DataBind();
            }

            else
            {
                gvPregAsociadas.DataSource = null;
                gvPregAsociadas.DataBind();
                lblJuegoSeleccionado.ForeColor = Color.Red;
                lblJuegoSeleccionado.Text = "El juego seleccionado no tiene preguntas asociadas";

            }


            //Cargo todas las preguntas del sistema

            List<Pregunta> colPreguntas = LogicaPreguntas.ListarPreguntasSinJuego();
            Session["ListaPreguntas"] = colPreguntas;

            if (colPreguntas.Count > 0)
            {
                gvListaPreguntas.Visible = true;
                lblPreguntasSistema.Text = "Listado de preguntas disponibles en el sistema";
                gvListaPreguntas.DataSource = colPreguntas;
                gvListaPreguntas.DataBind();
            }

            else
            {
                lblError.ForeColor = Color.Red;
                lblError.Text = "0 preguntas registradas en el sistema";
            }

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }



    }
    protected void gvPregAsociadas_SelectedIndexChanged(object sender, EventArgs e)
    {

        try
        {
            List<Pregunta> colPreguntasJuego = (List<Pregunta>)Session["PreguntasJuego"];
            Juegos oJuego = (Juegos)Session["JuegoSeleccionado"];

            Pregunta oPregunta = null;

            string codigoPreg = gvPregAsociadas.SelectedRow.Cells[0].Text;

            foreach (Pregunta p in colPreguntasJuego)
            {
                if (p.CodPregunta == codigoPreg)
                {
                    oPregunta = p;
                    break;
                }
            }

            LogicaJuegos.QuitarPregunta(oJuego, oPregunta);
            lblError.ForeColor = Color.Green;
            lblError.Text = "Pregunta desvinculada con exito";
            colPreguntasJuego = LogicaPreguntas.ListarPreguntasJuego(oJuego.CodigoJuego); //Traigo la lista actualizada de la BD para mostrar en gv
            gvPregAsociadas.DataSource = colPreguntasJuego;
            gvPregAsociadas.DataBind();
            //Luego de desvincular una pregunta actualizo la memoria session con la lista actualizada traida de la BD
            Session["PreguntasJuego"] = colPreguntasJuego;

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }

    }
    protected void gvListaPreguntas_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            List<Pregunta> colPreguntas = (List<Pregunta>)Session["ListaPreguntas"];
            Juegos oJuego = (Juegos)Session["JuegoSeleccionado"];
            List<Pregunta> colPreguntasJuego = (List<Pregunta>)Session["PreguntasJuego"];

            Pregunta oPregunta = null;

            string codigoPreg = gvListaPreguntas.SelectedRow.Cells[0].Text;


            foreach (Pregunta p in colPreguntasJuego)
            {

                if (p.CodPregunta == codigoPreg)
                {
                    throw new Exception("Pregunta ya se encuentra asociada al juego");
                }
            }

            foreach (Pregunta q in colPreguntas)
            {
                if (q.CodPregunta == codigoPreg)
                {
                    oPregunta = q;
                    break;
                }
            }

            lblError.ForeColor = Color.Green;
            lblError.Text = "Pregunta vinculada con exito";
            lblJuegoSeleccionado.ForeColor = Color.Black;
            lblJuegoSeleccionado.Text = "Listado de preguntas asociadas al juego seleccionado"; //Para borrar mensaje en caso de que juego se cargara con ninguna pregunta asociada
            LogicaJuegos.AgregarPreguntaJuego(oPregunta, oJuego);
            colPreguntasJuego = LogicaPreguntas.ListarPreguntasJuego(oJuego.CodigoJuego); //Traigo la lista actualizada de la BD para mostrar en gv
            gvPregAsociadas.DataSource = colPreguntasJuego;
            gvPregAsociadas.DataBind();
            //Luego de vincular una pregunta actualizo la memoria session con la lista actualizada traida de la BD
            Session["PreguntasJuego"] = colPreguntasJuego;

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}