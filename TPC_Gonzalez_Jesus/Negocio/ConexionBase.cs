using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    public class ConexionBase
    {
        string rutaBaseDatos ;
        string rutaConexionLocal;
        string nombreBase;
        SqlConnection conexion;
        SqlCommand comando ;
        public SqlDataReader lector { get; set; }



        public ConexionBase()
        {
            rutaConexionLocal = "DESKTOP-FDLLM2V\\SQLEXPRESS";
            //rutaConexionLocal = "MATIASLENOVO\\SQLEXPRESS";     // Ruta local unificada para conexion al SQL Server
            nombreBase = "TPC_GONZALEZ_JESUS";
            rutaBaseDatos = "data source = " + rutaConexionLocal + "; initial catalog = " + nombreBase + "; integrated security = sspi";
            //rutaBaseDatos = "data source = MATIASLENOVO\\SQLEXPRESS; initial catalog = CATALOGO_DB; integrated security = sspi" 
            conexion = new SqlConnection();
            comando = new SqlCommand();
            conexion.ConnectionString = rutaBaseDatos;
            comando.CommandType = System.Data.CommandType.Text;
            comando.Connection = conexion;
        }

        public SqlDataReader Select(string sentenciaSql)
        {
            comando.CommandText = sentenciaSql;

            conexion.Open();
            lector = comando.ExecuteReader();

            return lector;
            //while (lector.Read())
        }
        public int InsertUpdateDel(string sentenciaSql)
        {
            comando.CommandText = sentenciaSql;
                //"INSERT INTO ARTICULOS(Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio,imagenurl) " + "VALUES('" + nuevo.codArticulo + "','" +
                //nuevo.Nombre + "', '" + nuevo.Descripcion + "', " + nuevo.marca.ID + ", " + nuevo.categoria.ID + ", '" + nuevo.Precio + "','" + nuevo.Imagen + "')"; 
            conexion.Open();
            return comando.ExecuteNonQuery(); //Devuelve cantidad de filas afectadas
        }


        public void Cerrar()
        {
            lector.Close();
            conexion.Close();
        }

        public SqlDataReader ExecuteSP(string name,string parameters)
        {
            comando.CommandText = "exec "+name+parameters;
            //"INSERT INTO ARTICULOS(Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio,imagenurl) " + "VALUES('" + nuevo.codArticulo + "','" +
            //nuevo.Nombre + "', '" + nuevo.Descripcion + "', " + nuevo.marca.ID + ", " + nuevo.categoria.ID + ", '" + nuevo.Precio + "','" + nuevo.Imagen + "')"; 
            conexion.Open();
            return comando.ExecuteReader(); //Devuelve cantidad de filas afectadas
        }

    }
}
