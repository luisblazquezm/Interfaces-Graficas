using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Ejercicio4
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public struct FuncRect
        {
            public double XMin, YMin, XMax, YMax;
        }

        public FuncRect real, pant;

        //TODO ESTO SERAN ENUMS EN LA CLASE UTILS DE MI TRABAJO
        public const int SEN = 0;
        public const int COS = 1;
        public const int EXPONENCIAL = 2;
        public const int PRODUCTO = 3;
        public const int CUADRATICA = 4;
        public const int FRACCIONARIA = 5;


        public static int numFunction = 0;

        public static Boolean entered = false;
        public double ScaleRate = 1.1;
        public ScaleTransform scaleTransform = new ScaleTransform();      //---------> object for Scale-Transform //-------------> scaleRate that has to be Zoom for each point of Mouse_Wheel
        public bool added;

        public MainWindow()
        {
            InitializeComponent();
            lienzo.MouseWheel += new MouseWheelEventHandler(Canvas_MouseWheel);
        }

        private void DrawButton_Click(object sender, RoutedEventArgs e)
        {
            // OJO BORRA TODO LO ANTERIOR 
            lienzo.Children.Clear();
            if (numFunction > 0)
                numFunction++;
            else if (numFunction >= FRACCIONARIA)
                numFunction = 0;
            DrawGraphic();
        }

        private void DrawAxis()
        {
            Line ejex = new Line();
            Line ejey = new Line();
            Line axisStrip = new Line();

            double distancia = 0.333;
            double pos = real.XMin;
            double length1 = -0.25, length2 = 0.25;
            int counter;

            ejex.Stroke = Brushes.Black;
            ejey.Stroke = Brushes.Black;


            // EJE X
            ejex.X1 = 0;
            ejex.X2 = pant.XMax;
            ejex.Y1 = ConvertYFromRealToPant(0,0);
            ejex.Y2 = ConvertYFromRealToPant(0,0);

            // EJE Y
            ejey.Y1 = 0;
            ejey.Y2 = pant.YMax;
            ejey.X1 = ConvertXFromRealToPant(0, 0);
            ejey.X2 = ConvertXFromRealToPant(0, 0);

            lienzo.Children.Add(ejex);
            lienzo.Children.Add(ejey);

            /* Hay que mejorar la implementación de esto EJE X */
            counter = 6;
            for (int i = 0; pos < 10; i++)
            {
                // Altura de la raya de -0.5 a 0.5
                if (counter == 6)
                {
                    length1 = -0.5;
                    length2 = 0.5;
                    counter = 0;
                } else
                {
                    length1 = -0.25;
                    length2 = 0.25;
                }

                axisStrip.X1 = ConvertXFromRealToPant(pos, pant.XMin);  
                axisStrip.X2 = ConvertXFromRealToPant(pos, pant.XMin);
                axisStrip.Y1 = ConvertYFromRealToPant(length1, pant.YMin);
                axisStrip.Y2 = ConvertYFromRealToPant(length2, pant.YMin);

                //Console.WriteLine("AXIS {4}: X1:{0} X2:{1} Y1:{2} Y2:{3} POS: {5}", axisStrip.X1, axisStrip.X2, axisStrip.Y1, axisStrip.Y2, i, pos);

                lienzo.Children.Add(axisStrip);

                pos += distancia;
                axisStrip = new Line();
                axisStrip.Stroke = Brushes.Black;
                counter++;

            }

            /* Hay que mejorar la implementación de esto EJE Y */
            counter = 6;
            pos = -10;
            axisStrip = new Line();
            axisStrip.Stroke = Brushes.Black;
            for (int i = 0; pos < 10; i++)
            {
                // Altura de la raya de -0.5 a 0.5
                if (counter == 6)
                {
                    length1 = -0.5;
                    length2 = 0.5;
                    counter = 0;
                }
                else
                {
                    length1 = -0.25;
                    length2 = 0.25;
                }

                axisStrip.X1 = ConvertXFromRealToPant(length1, pant.XMin);
                axisStrip.X2 = ConvertXFromRealToPant(length2, pant.XMin);
                axisStrip.Y1 = ConvertYFromRealToPant(pos, pant.YMin);
                axisStrip.Y2 = ConvertYFromRealToPant(pos, pant.YMin);

                lienzo.Children.Add(axisStrip);

                pos += distancia;
                axisStrip = new Line();
                axisStrip.Stroke = Brushes.Black;
                counter++;

            }



        }

        private void DrawGraphic()
        {
            PointCollection puntos = new PointCollection();
            Polyline polilinea = new Polyline();
            double xreal, yreal, xpant, ypant;
            int numpuntos;

            entered = true;

            DeclareFuncRect();

            numpuntos = (int)pant.XMax;

            polilinea.Stroke = Brushes.Red;

            for (int i = 0; i <= numpuntos; i++) // OJOOOOOOOOOOOOOO Aqui he cambiado el < por <= para que llegue de -10 a 10 y no de -10 a 9.66 por ejemplo
            {
                xreal = real.XMin + i * (real.XMax - real.XMin) / numpuntos;
                yreal = SwitchFunctionFromButton(xreal);

                xpant = ConvertXFromRealToPant(xreal, pant.XMin);
                ypant = ConvertYFromRealToPant(yreal, pant.YMin);

                /* OJO QUITAR DE PROPIEDADES LA CONSOLA -> BOTON DEREECHO PROYECTO CONSOLA*/
                //Console.WriteLine("Xreal:{0} Yreal:{1} Xpant:{2} Ypant:{3}", xreal, yreal, xpant, ypant);

                Point punto = new Point(xpant, ypant);
                puntos.Add(punto);
            }

            polilinea.Points = new PointCollection(puntos);
            lienzo.Children.Add(polilinea);

            DrawAxis();
        }

        private double SwitchFunctionFromButton(double xreal)
        {
            double a = 12;
            double b = 3;
            double c = 4;

            switch (numFunction)
            {
                case CUADRATICA:
                    return a * Math.Pow(xreal, 2) + b * xreal + c;
                case SEN:
                    numFunction++;
                    return a * Math.Sin(b * xreal); // x^2
                case COS:
                    return a * Math.Cos(b * xreal);
                case EXPONENCIAL:
                    return a * Math.Pow(xreal, b);
                case PRODUCTO:
                    return a * xreal + b;
                case FRACCIONARIA:
                    return a / (b * xreal);
                default:
                    return xreal* xreal; // x^2
            }
        }

        private double ConvertXFromRealToPant(double xreal, double width)
        {
            return (pant.XMax - width) * ((xreal - real.XMin) / (real.XMax - real.XMin)) + pant.XMin;
        }

        private double ConvertYFromRealToPant(double yreal, double height)
        {
            return (height - pant.YMax) * ((yreal - real.YMin) / (real.YMax - real.YMin)) + pant.YMax;
        }

        private double ConvertXFromPantToReal(double xpant, double width)
        {
            return (real.XMax - real.XMin) * ((xpant - pant.XMin) / (pant.XMax - pant.XMin)) + real.XMin;
        }

        private double ConvertYFromPantToReal(double ypant, double height)
        {
            return (real.YMax - real.YMin) * ((ypant - pant.YMax) / (pant.YMin - pant.YMax)) + real.YMin ;
        }

        private void DeclareFuncRect()
        {
            real.XMin = -10;
            real.YMin = -10;
            real.XMax = 10;
            real.YMax = 10;

            pant.XMin = pant.YMin = 0;
            pant.XMax = lienzo.ActualWidth;
            pant.YMax = lienzo.ActualHeight; 
        }

        private void Window_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            lienzo.Children.Clear();
            if (entered)
                DrawGraphic();
        }

        private void Canvas_MouseWheel(object sender, MouseWheelEventArgs e)
        {
            if (e.Delta > 0)
            {
                scaleTransform.ScaleX *= ScaleRate;
                scaleTransform.ScaleY *= ScaleRate;
            }
            else
            {
                scaleTransform.ScaleX /= ScaleRate;
                scaleTransform.ScaleY /= ScaleRate;
            }

            if (!added)
            {
                TransformGroup tg = lienzo.RenderTransform as TransformGroup;
                if (tg != null)
                {
                    tg.Children.Add(scaleTransform);
                    lienzo.RenderTransformOrigin = new Point(0.5, 0.5);
                    added = true;
                }
            }
        }

        Point _last, onCanvas, posOnWindow;
        bool isDragged;

        private void lienzo_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Panel MousePanel = (Panel)sender;
            Point p = e.GetPosition(lienzo);

            Console.WriteLine("Position Mouse Canvas X:{0} Y:{1}", p.X, p.Y);

            XPositonLabel.Content = ConvertXFromPantToReal(p.X, lienzo.ActualWidth); //(string.Format("{0:n2}", (ConvertXFromPantToReal(p.X, lienzo.ActualWidth) * 100) / 100)); 
            YPositonLabel.Content = ConvertYFromPantToReal(p.Y, lienzo.ActualHeight); //(string.Format("{0:n2}", (ConvertYFromPantToReal(p.Y, lienzo.ActualHeight) * 100) / 100));
        }

        void theGrid_MouseMove(object sender, MouseEventArgs e)
        {
            if (isDragged == false)
                return;

            base.OnMouseMove(e);
            if (e.LeftButton == MouseButtonState.Pressed && theGrid.IsMouseCaptured)
            {

                var pos = e.GetPosition(theGrid);
                var matrix = mt.Matrix;
                matrix.Translate(pos.X - _last.X, pos.Y - _last.Y);
                mt.Matrix = matrix;
                _last = pos;
            }
            
        }

        void theGrid_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            theGrid.ReleaseMouseCapture();
            isDragged = false;
        }

        void theGrid_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            theGrid.CaptureMouse();
            _last = e.GetPosition(theGrid);
            isDragged = true;
        }

      
    }
}
