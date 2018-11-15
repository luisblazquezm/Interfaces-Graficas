using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ejercicio3_Consola
{
    // Esto está mal hecho ( ALTO ACOPLAMIENTO )
    class Acopladas
    {
        static void Main(string[] args)
        {
            observador obj = new observador();
            obj.funciona();
        }
    }
    class observador
    {
        TrabajoDuro tb;
        public observador() { tb = new TrabajoDuro(this); } // Le pasa la referencia al observador (si mismo)
        public void funciona()
        {
            Console.WriteLine("Vamos a probar el informe");
            tb.ATrabajar();
            Console.WriteLine("Terminado");
        }
        public void InformeAvance(int x)
        {
            string str = String.Format("Ya llevamos el {0}", x); // indice de los elementos {0},{1}...", x, y el 0 sustituira el x y 1 el y
            Console.WriteLine(str);
        }
    }

    class otraClase
    {
        // TrabajoDuro miTrabajo = new TrabajoDuro(this); // OJO NO ES REUTILIZABLE (Clase acoplada, necesita una referencia de observador obligatoriamente)
    }


    class TrabajoDuro
    {
        int PocentajeHecho;
        observador eljefe;
        public TrabajoDuro(observador o) 
        {
            PocentajeHecho = 0;
            eljefe = o;
        }
        public void ATrabajar()
        {
            int i;
            for (i = 0; i < 500; i++)
            {
                System.Threading.Thread.Sleep(1); //Hacemos el trabajo
                switch (i)
                {
                    case 125:
                        PocentajeHecho = 25;
                        eljefe.InformeAvance(PocentajeHecho);
                        break;
                    case 250:
                        PocentajeHecho = 50;
                        eljefe.InformeAvance(PocentajeHecho);
                        break;
                    case 375:
                        PocentajeHecho = 75;
                        eljefe.InformeAvance(PocentajeHecho);
                        break;
                }
            }
        }
    }
    
}
