using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace Persistencias
{
    internal class Conexion
    {
        public const string Con = @"Data Source=MSI\SQLEXPRESS01; Initial catalog=ProyectoFinal; Integrated Security=true";
        //public const string Con = @"Data Source=DESKTOP-ULT8L7H\SQLEXPRESS; Initial Catalog=ProyectoFinal;Integrated Security = true";
    }
}
