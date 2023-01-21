using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;

namespace Persistencias
{
    public class PersistenciasPreguntas
    {
        public static int AgregarPregunta(Pregunta pPregunta)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.Con);
            SqlCommand oComando = new SqlCommand("AgregarPregunta", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@textoPregunta", pPregunta.Preguntas);
            oComando.Parameters.AddWithValue("@respuesta1", pPregunta.Respuesta1);
            oComando.Parameters.AddWithValue("@respuesta2", pPregunta.Respuesta2);
            oComando.Parameters.AddWithValue("@respuesta3", pPregunta.Respuesta3);
            oComando.Parameters.AddWithValue("@correcta", pPregunta.Correcta);
            oComando.Parameters.AddWithValue("@codigoPreg", pPregunta.CodPregunta);
            oComando.Parameters.AddWithValue("@puntaje", pPregunta.Puntaje);
            oComando.Parameters.AddWithValue("@codCat", pPregunta.Categoria.CodCat);

            SqlParameter oRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            oRetorno.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oRetorno);

            int resultado = 0;

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();

                resultado = (int)oComando.Parameters["@Retorno"].Value;
                if (resultado == -1)
                    throw new Exception("El código ya se encuentra registrado ");
                else if (resultado == -2)
                    throw new Exception("Ocurrió un error inesperado");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally { oConexion.Close(); }
            return resultado;
        }


    }
}
