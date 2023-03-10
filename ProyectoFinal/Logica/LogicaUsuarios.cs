using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencias;

namespace Logica
{
    public class LogicaUsuarios
    {
        public static int AgregarUsuario(Usuarios usuario)
        {
            return PersistenciasUsuarios.AgregarUsuario(usuario);
        }

        public static Usuarios BuscarUsuario(string nomUsuario)
        {
            return PersistenciasUsuarios.BuscarUsuario(nomUsuario);
        }

        public static int LogeoUsuario(string usuario, string contraseña)
        {
            return PersistenciasUsuarios.LogeoUsuario(usuario, contraseña);
        }
    }
}
