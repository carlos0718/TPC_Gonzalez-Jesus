using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class DominiosNegocio
    {
        public Dominios dominios { get; set; }

        public List<Dominios> lista_dominios { get; }

        ConexionBase conn;
        public DominiosNegocio()
        {
            dominios = new Dominios();
            conn = new ConexionBase();
        }

        public BindingList<Dominios> ObtenerDominios(string _tipo)
        {
            string sentencia = "select dominioid,tipo_dominio,valor_texto,valor_entero " +
                   "from DOMINIOS " +
                    "where tipo_dominio=" +_tipo;



            conn.Lector = conn.Select(sentencia);
            BindingList<Dominios> lista = new BindingList<Dominios>();
            Dominios aux;

            while (conn.Lector.Read())
            {
                aux = new Dominios();

                aux.Dominiosid = conn.Lector.GetInt32(0);
                aux.Tipo_dominio = conn.Lector.GetString(1);
                aux.Valor_texto = conn.Lector.GetString(2);
                aux.Valor_enter = conn.Lector.GetInt32(3);

                lista.Add(aux);
            }

            return lista;


        }
        public void ObtenerAreaPorNombre(string _nombre)
        {
                string sentencia = String.Format("select dominioid,tipo_dominio,valor_texto,valor_entero " +
               "from DOMINIOS " +
                "where tipo_dominio='AREA' and valor_texto='{0}'", _nombre);

            conn.Lector = conn.Select(sentencia);
            dominios = new Dominios();

            while (conn.Lector.Read())
            {
                dominios.Dominiosid = conn.Lector.GetInt32(0);
                dominios.Tipo_dominio = conn.Lector.GetString(1);
                dominios.Valor_texto = conn.Lector.GetString(2);
                dominios.Valor_enter = conn.Lector.GetInt32(3);
            }
        }

        public void ObtenerAreaPorIdArea(int _valor_entero)
        {
            string sentencia = String.Format("select dominioid,tipo_dominio,valor_texto,valor_entero " +
           "from DOMINIOS " +
            "where tipo_dominio='AREA' and valor_entero={0}", _valor_entero);

            conn.Lector = conn.Select(sentencia);
            dominios = new Dominios();

            while (conn.Lector.Read())
            {
                dominios.Dominiosid = (int)conn.Lector.GetInt16(0);
                dominios.Tipo_dominio = conn.Lector.GetString(1);
                dominios.Valor_texto = conn.Lector.GetString(2);
                dominios.Valor_enter = conn.Lector.GetInt32(3);
            }
        }

    }
}
