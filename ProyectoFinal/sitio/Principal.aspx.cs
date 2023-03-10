using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using EntidadesCompartidas;
using Logica; 

public partial class Principal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Jugadas> lista = LogicaJugadas.ListarJugadas();
        gvPuntajes.Style.Add("overflow", "scroll");
        gvPuntajes.DataSource = lista;
        gvPuntajes.DataBind();

        if (lista != null)
            logoImg.EnableViewState = true;
        else
            logoImg.EnableViewState = false;

        Session["Administrador"] = null;
    }
}

