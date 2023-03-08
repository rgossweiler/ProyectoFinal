using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;

public partial class Administradores : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Administrador"] == null)
                Response.Redirect("Principal.aspx");
            else
            {
                Usuarios user = (Usuarios)Session["Administrador"];
                lblUsuario.Text = user.NomUsuario;
            }
        }
        catch
        {
            Response.Redirect("Principal.aspx");
        }
    }

    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session["Administrador"] = null;
        Response.Redirect("Principal.aspx");
    }
}
