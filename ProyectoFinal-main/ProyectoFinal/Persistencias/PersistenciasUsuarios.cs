using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;

namespace Persistencias
{
    public class PersistenciasUsuarios
    {
        public static int AgregarUsuario(Usuarios pUsuario)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.Con);
            SqlCommand oComando = new SqlCommand("AgregarUsuario", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@nomUs", pUsuario.NomUsuario);
            oComando.Parameters.AddWithValue("@contraseña", pUsuario.Contraseña);
            oComando.Parameters.AddWithValue("@nombreCompleto", pUsuario.NombreCompleto);

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
                    throw new Exception("El nombre de usuario ya se encuentra en uso");
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

        public static Usuarios BuscarUsuario(string pNomUs)
        {
            string nombreCompleto, contraseña;
            SqlDataReader oReader;
            Usuarios oUsuario = null;

            SqlConnection oConexion = new SqlConnection(Conexion.Con);
            SqlCommand oComando = new SqlCommand("BuscarUsuario", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;
            oComando.Parameters.AddWithValue("@nomUs", pNomUs);

            try
            {
                oConexion.Open();
                oReader = oComando.ExecuteReader();

                if (oReader.HasRows)
                {
                    if (oReader.Read())
                    {
                        nombreCompleto = oReader["nombreCompleto"].ToString();
                        contraseña = oReader["contraseña"].ToString();

                        oUsuario = new Usuarios(pNomUs, contraseña, nombreCompleto);
                        if (oUsuario == null)
                            throw new Exception("Usuario no registrado");
                    }
                }
                oReader.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally { oConexion.Close(); }
            return oUsuario;
        }

        public static int LogeoUsuario(string pUsuario, string pContraseña)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.Con);
            SqlCommand oComando = new SqlCommand("LogueUsuario", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@nomUs", pUsuario);
            oComando.Parameters.AddWithValue("@Pass", pContraseña);

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
                    throw new Exception("Usuario o Contraseña incorrectos");
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
