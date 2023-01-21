using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;

namespace Persistencias
{
    public class PersistenciasJuegos
    {
        public void BuscarJuego(string pNombreJuego, int pCodJuego)
        {
            DateTime fechaCreado;
            string dificultad;
            Usuarios creador;
            List<Pregunta> preguntasJuego;

            Juegos pJuego = null;
            SqlDataReader oReader;

            SqlConnection oConexion = new SqlConnection(Conexion.Con);
            SqlCommand oComando = new SqlCommand("@BuscarJuego", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@nomJuego", pNombreJuego);
            oComando.Parameters.AddWithValue("@codJuego", pCodJuego);

            try
            {
                oConexion.Open();
                oReader = oComando.ExecuteReader();

                if (oReader.HasRows)
                {
                    if (oReader.Read())
                    {
                        pNombreJuego = oReader["nombreJuego"].ToString();
                        pCodJuego = (int)oReader["codigoJuego"];
                        fechaCreado = (DateTime)oReader["fechaCreado"];
                        dificultad = oReader["dificultad"].ToString();
                        string aux = oReader["creador"].ToString();
                        creador = PersistenciasUsuarios.BuscarUsuario(aux);
                        //faltan partes del proyecto SP ListarPreguntasJuego (listar las preguntas de adentro de un juego);
                        //Crear el objeto juego con los datos
                        //cambiar void por juego para que retorne el objeto juego.
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally { oConexion.Close(); }
        }

        
    }
}
