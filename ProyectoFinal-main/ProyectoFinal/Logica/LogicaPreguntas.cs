using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencias;

namespace Logica
{
    public class LogicaPreguntas
    {
        public static int AgregarPregunta(Pregunta pregunta)
        {
            return PersistenciasPreguntas.AgregarPregunta(pregunta);
        }

        public static List<Pregunta> ListarPreguntasJuego(int codJuego)
        {
            return PersistenciasPreguntas.ListarPreguntasJuego(codJuego);
        }

        public static List<Pregunta> ListarPreguntas()
        {
            return PersistenciasPreguntas.ListarPreguntas();
        }

        public static Pregunta BuscarCodigoPregunta(string pCodPre)
        {
            return PersistenciasPreguntas.BuscarPregunta(pCodPre);
        }
    }
}
