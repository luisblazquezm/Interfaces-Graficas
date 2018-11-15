using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ejercicio3_Consola2
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


    /// <summary>
    ///  OJO EL EVENTO INDICA MEDIANTE UN EVENTO DEL MODELO A LA VISTA (QUE ESTAS SE ACTUALICEN) CUANDO EL MODELO CAMBIE
    /// </summary>

    class observador
    {
        TrabajoDuro tb;
        public observador() { tb = new TrabajoDuro(); } // Le pasa la referencia al observador (si mismo)
        public void funciona()
        {
            Console.WriteLine("Vamos a probar sin Informe");
            tb.ATrabajar();
            Console.WriteLine("Vamos a probar con Informe1");
            tb.tareaEnProceso += InformeAvance; // Aporta más flexibilidad
            tb.ATrabajar();//<--------------------------------- OJO en esta ejecuta solo InformeAvance 
            Console.WriteLine("Probando probando, cambio y corto.");
            tb.tareaEnProceso += InformeAvance2; // Aporta más flexibilidad
            //tb.tareaEnProceso -= InformeAvance; // No quiero que se ejecute INforme avance
            tb.ATrabajar(); //<--------------------------------- OJO en esta ejecuta los dos InformeAvance e InformeAvance2
            Console.WriteLine("Terminado");
        }
        public void InformeAvance(Object sender, TareasEventArgs e)
        {
            string str = String.Format("Ya llevamos el {0}", e.x); // indice de los elementos {0},{1}...", x, y el 0 sustituira el x y 1 el y
            Console.WriteLine(str);
        }
        public void InformeAvance2(Object sender, TareasEventArgs e)
        {
            string str = String.Format("*****"); 
            Console.WriteLine(str);
        }
    }

    class otraClase
    {
        TrabajoDuro miTrabajo = new TrabajoDuro(); 
    }

    // Notación {NOMBRE EVENTO}EventArgs
    class TareasEventArgs : EventArgs // <----------- Hereda de EventArgs (Es como el NSDictionary de Cocoa)
    {
        public int x; // Se puede poner lo que queramos
    }


    delegate void TipoDelegado (Object sender, TareasEventArgs e);

    class TrabajoDuro
    {
        int PocentajeHecho;                      
        public event TipoDelegado tareaEnProceso;

        // Siempre se pone para disparar el evento on{NOMBRE DEL EVENTO}
        void onTareaEnProceso(TareasEventArgs e)
        {
            if (tareaEnProceso != null) // <------------------------ IMPORTANTE para ejecutar un delegado siempre hay que comprobar que no sea NULL
                tareaEnProceso(this, e);
        }

       
        public TrabajoDuro(/*observador o*/) // Clase desacoplada, ya no depende de la clase Obesevador
        {
            PocentajeHecho = 0;
            // eljefe = o;
        }

        public void ATrabajar() // Metodo que se va a ejecutar
        {
            int i;
            TareasEventArgs e = new TareasEventArgs();
            for (i = 0; i < 500; i++)
            {
                System.Threading.Thread.Sleep(1); //Hacemos el trabajo
                switch (i)
                {
                    case 125:
                        e.x = 25;
                        onTareaEnProceso(e);
                        break;
                    case 250:
                        e.x = 50;
                        onTareaEnProceso(e);
                        break;
                    case 375:
                        e.x = 75;
                        onTareaEnProceso(e);
                        break;
                }
            }
        }
    }
}