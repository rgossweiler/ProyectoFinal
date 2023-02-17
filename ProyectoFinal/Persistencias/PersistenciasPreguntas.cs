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

            oComando.Parameters.AddWithValue("@textoPregunta", pPregunta.TextoPreguntas);
            oComando.Parameters.AddWithValue("@respuesta1", pPregunta.Respuesta1);
            oComando.Parameters.AddWithValue("@respuesta2", pPregunta.Respuesta2);
            oComando.Parameters.AddWithValue("@respuesta3", pPregunta.Respuesta3);
            oComando.Parameters.AddWithValue("@correcta", pPregunta.Correcta);
            oComando.Parameters.AddWithValue("@codigoPreg", pPregunta.CodPregunta);
            oComando.Parameters.AddWithValue("@puntaje", pPregunta.Puntaje);
            oComando.Parameters.AddWithValue("@codigoCat", pPregunta.Categoria.CodCat);

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

        public static List<Pregunta> ListarPreguntasJuego(int pCodJuego)
        {
            SqlDataReader oReader;
            List<Pregunta> preguntasJuego = new List<Pregunta>();
            Pregunta pregunta = null;
            string textoPregunta, resp1, resp2, resp3, codPre, aux;
            int puntaje, correcta;
            Categorias categoria;
            
            SqlConnection oConexion = new SqlConnection(Conexion.Con);
            SqlCommand oComando = new SqlCommand("ListarPreguntasJuego", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@codigoJuego", pCodJuego);

            try
            {
                oConexion.Open();
                oReader = oComando.ExecuteReader();

                if (oReader.HasRows)
                {
                    while (oReader.Read())
                    {
                        textoPregunta = oReader["textoPregunta"].ToString();
                        resp1 = oReader["respuesta1"].ToString();
                        resp2 = oReader["respuesta2"].ToString();
                        resp3 = oReader["respuesta3"].ToString();
                        codPre = oReader["codigoPreg"].ToString();
                        puntaje = (int)oReader["puntaje"];
                        correcta = (int)oReader["correcta"];
                        aux = oReader["codigoCat"].ToString();
                        categoria = PersistenciasCategorias.BuscarCategoria(aux);

                        pregunta = new Pregunta(textoPregunta, resp1, resp2, resp3, correcta, codPre, puntaje, categoria);
                        preguntasJuego.Add(pregunta);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally { oConexion.Close(); }
            return preguntasJuego;
        }

        public static List<Pregunta> ListarPreguntas()
        {
            SqlDataReader oReader;
            List<Pregunta> preguntasJuego = new List<Pregunta>();
            Pregunta pregunta = null;
            string textoPregunta, resp1, resp2, resp3, codPre;
            int puntaje, correcta;
            Categorias categoria;

            SqlConnection oConexion = new SqlConnection(Conexion.Con);
            SqlCommand oComando = new SqlCommand("ListarPreguntas", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            try
            {
                oConexion.Open();
                oReader = oComando.ExecuteReader();

                if (oReader.HasRows)
                {
                    while (oReader.Read())
                    {
                        textoPregunta = oReader["textoPregunta"].ToString();
                        resp1 = oReader["respuesta1"].ToString();
                        resp2 = oReader["respuesta2"].ToString();
                        resp3 = oReader["respuesta3"].ToString();
                        codPre = oReader["codigoPreg"].ToString();
                        puntaje = (int)oReader["puntaje"];
                        correcta = (int)oReader["correcta"];
                        string aux = oReader["codigoCat"].ToString();
                        categoria = PersistenciasCategorias.BuscarCategoria(aux);

                        pregunta = new Pregunta(textoPregunta, resp1, resp2, resp3, correcta, codPre, puntaje, categoria);
                        preguntasJuego.Add(pregunta);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally { oConexion.Close(); }
            return preguntasJuego;
        }

        public static Pregunta BuscarPregunta(string pCodPre)
        {
            Pregunta preg = null;

            SqlDataReader oReader;
            SqlConnection oConexion = new SqlConnection(Conexion.Con);
            SqlCommand oComando = new SqlCommand("BuscarCodigoPregunta", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("codPre", pCodPre);

            try
            {
                oConexion.Open();
                oReader = oComando.ExecuteReader();

                if (oReader.HasRows)
	            {
		            if (oReader.Read())
	                {
		                string pregunta = oReader["textoPregunta"].ToString();
                        string resp1 = oReader["respuesta1"].ToString();
                        string resp2 = oReader["respuesta2"].ToString();
                        string resp3 = oReader["respuesta3"].ToString();
                        int correcta = (int)oReader["correcta"];
                        int puntaje = (int)oReader["puntaje"];
                        string aux = oReader["codigoCat"].ToString();
                        Categorias cat = PersistenciasCategorias.BuscarCategoria(aux);

                        preg = new Pregunta(pregunta, resp1, resp2, resp3, correcta, pCodPre, puntaje, cat);
                    }
	            }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally { oConexion.Close(); }
            return preg;
        }
    }
}
