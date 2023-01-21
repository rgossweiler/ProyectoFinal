using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Juegos
    {
        //ATRIBUTOS
        private string nombreJuego;
        private int codigoJuego;
        private DateTime fechaCreado;
        private string dificultad;
        private Usuarios creador;
        private List<Pregunta> preguntasJuego;

        //PROPIEDADES
        public string NombreJuego
        {
            get { return nombreJuego; }
            set { nombreJuego = value; }
        }

        public int CodigoJuego
        {
            get { return codigoJuego; }
            set { codigoJuego = value; }
        }

        public DateTime FechaCreado
        {
            get { return fechaCreado; }
            set { fechaCreado = value; }
        }

        public string Dificultad
        {
            get { return dificultad; }
            set { dificultad = value; }
        }

        public Usuarios Creador
        {
            get { return creador; }
            set { creador = value; }
        }

        public List<Pregunta> PreguntasJuego
        {
            get { return preguntasJuego; }
            set { preguntasJuego = value; }
        }

        //CONSTRUCTOR
        public Juegos(string pNombreJuego, int pCodigoJuego, DateTime pFechaCreado, string pDificultad, Usuarios pCreador, List<Pregunta> pPreguntasJuego)
        {
            NombreJuego = pNombreJuego;
            CodigoJuego = pCodigoJuego;
            FechaCreado = pFechaCreado;
            Dificultad = pDificultad;
            Creador = pCreador;
            PreguntasJuego = pPreguntasJuego;
        }

        //OPERACIONES

    }
}
