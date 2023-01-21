using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Jugadas
    {
        //ATRIBUTOS
        private int numJugada;
        private string nombreJugador;
        private DateTime fechaHoraJugada;
        private int puntaje;
        private Juegos juego;

        //PROPIEDADES
        public int NumJugada
        {
            get { return numJugada; }
            set { numJugada = value; }
        }

        public string NombreJugador
        {
            get { return nombreJugador; }
            set { nombreJugador = value; }
        }

        public DateTime FechaHoraJugada
        {
            get { return fechaHoraJugada; }
            set
            {
                if (value < DateTime.Now)
                    throw new Exception("La fecha no puede ser anterior al dia de hoy");
                else
                    fechaHoraJugada = value;
            }
        }

        public int Puntaje
        {
            get { return puntaje; }
            set
            {
                if (value < 1 || value > 10)
                    throw new Exception("El puntaje debe de estar entre 1 y 10");
                else
                    puntaje = value;
            }
        }

        public Juegos Juego
        {
            get { return juego; }
            set { juego = value; }
        }

        //CONSTRUCTOR
        public Jugadas(int pNumJugada, string pNombreJugador, DateTime pFechaHoraJugada, int pPuntaje, Juegos pJuego)
        {
            NumJugada = pNumJugada;
            NombreJugador = pNombreJugador;
            FechaHoraJugada = pFechaHoraJugada;
            Puntaje = pPuntaje;
            Juego = pJuego;
        }

        //OPERACIONES
    }
}
