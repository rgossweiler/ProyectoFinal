using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using EntidadesCompartidas;
using Logica;

public partial class PrincipalAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Jugadas> lista = LogicaJugadas.ListarJugadas();
        gvPuntajes.DataSource = lista;
        gvPuntajes.DataBind();
    }
}