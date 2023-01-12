using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Usuarios
    {
        //ATRIBUTOS
        private string nomUsuario;
        private string contraseña;
        private string nombreCompleto;

        //PROPIEDADES
        public string NomUsuario
        {
            get { return nomUsuario; }
            set { nomUsuario = value; }
        }

        public string Contraseña
        {
            get { return contraseña; }
            set { contraseña = value; }
        }

        public string NombreCompleto
        {
            get { return nombreCompleto; }
            set { nombreCompleto = value; }
        }

        //CONSTRUCTOR
        public Usuarios(string pNomUsuario, string pContraseña, string pNombreCompleto)
        {
            NombreCompleto = pNombreCompleto;
            Contraseña = pContraseña;
            NombreCompleto = pNombreCompleto;
        }

        //OPERACIONES

    }
}
