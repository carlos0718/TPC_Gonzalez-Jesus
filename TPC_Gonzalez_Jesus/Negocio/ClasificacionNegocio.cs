using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    
    public class ClasificacionNegocio
    {
        public Clasificacion clasif { get; set; }

        public ConexionBase conn = new ConexionBase();


        public List<Clasificacion> ObtenerClasificaciones(string _clase,string _rubro)

        {
            List<Clasificacion> clasificaciones = new List<Clasificacion>();
            string sentencia;

            if (String.IsNullOrEmpty(_rubro))
                sentencia= String.Format("select clasificacionid ,clase  ,nombre,rubro  from clasificacion where clase='{0}'", _clase);
            else
                sentencia = String.Format("select clasificacionid ,clase  ,nombre ,rubro from clasificacion where clase='{0}' and rubro='{1}'",_clase,_rubro);


            conn.Lector = conn.Select(sentencia);
            Clasificacion aux;

            while (conn.Lector.Read())
            {
                aux = new Clasificacion();
                aux.Clasificacionid = (ushort)conn.Lector.GetInt32(0);
                aux.Clase= conn.Lector.GetString(1);
                aux.Nombre = conn.Lector.GetString(2);
                aux.Rubro= conn.Lector.GetString(3);

                clasificaciones.Add(aux);

            }


            return clasificaciones;
        }



    }
}
