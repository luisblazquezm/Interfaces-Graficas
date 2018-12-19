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
        Point _last;
        bool isDragged;

        public MainWindow()
        {
            InitializeComponent();
            lienzo.MouseWheel += new MouseWheelEventHandler(Canvas_MouseWheel);
            this.SizeChanged += Window_SizeChanged;
        }

        private void DrawButton_Click(object sender, RoutedEventArgs e)
        {
            // OJO BORRA TODO LO ANTERIOR 
            lienzo.Children.Clear();
            numFunction = COS;
            DrawGraphic();
        }

        private void DrawAxis()
        {
            Line ejex = new Line();
            Line ejey = new Line();
            //Line axisStrip = new Line();

            double distancia = 0.167;
            double pos = real.XMin;
            //double length1 = -0.25, length2 = 0.25;
            Boolean axisHorizontal;
            //int counter;

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

            axisHorizontal = true;
            foreach(Line l in DrawAxisLines(real.XMin, real.XMax, distancia, axisHorizontal)) // Para X
                lienzo.Children.Add(l);

            axisHorizontal = false;
            foreach (Line l in DrawAxisLines(real.XMin, real.XMax, distancia, axisHorizontal)) // Para Y
                lienzo.Children.Add(l);
            /*
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
            */


        }

        private List<Line> DrawAxisLines(double actualPos, double maxLimit, double distancia, Boolean axisHorizontal)
        {
            int counter = 6;
            List<Line> listOflines = new List<Line>();
            Line line = new Line { Stroke = Brushes.Black };
            double length1, length2;
            TextBlock textB;
            int varia = -6;
            

            while (actualPos < maxLimit)
            {
                // Altura de la raya de -0.5 a 0.5
                if (counter == 6)
                {
                    length1 = -0.5;
                    length2 = 0.5;
                }
                else
                {
                    length1 = -0.25;
                    length2 = 0.25;
                }

                if (axisHorizontal) {
                    line.X1 = ConvertXFromRealToPant(actualPos, pant.XMin);
                    line.X2 = ConvertXFromRealToPant(actualPos, pant.XMin);
                    line.Y1 = ConvertYFromRealToPant(length1, pant.YMin);
                    line.Y2 = ConvertYFromRealToPant(length2, pant.YMin);

                    if (counter == 6) {
                        counter = 0;
                        varia++;
                        textB = new TextBlock();

                        textB.Text = Convert.ToString(varia);
                        Canvas.SetLeft(textB, line.X1);
                        Canvas.SetTop(textB, line.Y1);
                        lienzo.Children.Add(textB);
                    }
                } else {
                    line.X1 = ConvertXFromRealToPant(length1, pant.XMin);
                    line.X2 = ConvertXFromRealToPant(length2, pant.XMin);
                    line.Y1 = ConvertYFromRealToPant(actualPos, pant.YMin);
                    line.Y2 = ConvertYFromRealToPant(actualPos, pant.YMin);
                }

                listOflines.Add(line);

                actualPos += distancia;
                line = new Line { Stroke = Brushes.Black };
                counter++;
            }

            return listOflines;
        }

        private void DrawGraphic()
        {
            List<PointCollection> PointCollectionList = new List<PointCollection>();
            PointCollection puntos = new PointCollection();
            Polyline polilinea = new Polyline();
            double xreal, yreal, xpant, ypant;
            int numpuntos;

            entered = true;

            DeclareFuncRect();

            numpuntos = (int)pant.XMax;

            polilinea.Stroke = Brushes.Red;
            // Xreal  = de -10  a 0 y de 0 a 10
            /*
            while (j < 2) { 

                do {
                    i++;
                    xreal = real.XMin + i * (real.XMax - real.XMin) / numpuntos;
                    Console.WriteLine("Xreal {0}", xreal);
                    yreal = SwitchFunctionFromButton(xreal);

                    xpant = ConvertXFromRealToPant(xreal, pant.XMin);
                    ypant = ConvertYFromRealToPant(yreal, pant.YMin);

                    Point punto = new Point(xpant, ypant);
                    puntos.Add(punto);
                } while (Convert.ToInt32(xreal) < limit);

                PointCollectionList.Add(puntos);
                puntos = new PointCollection();

                j++;

                Console.WriteLine("Antes {0}",xreal);
                oldXReal = xreal;
                xreal += 1;
                limit = (int)real.XMax;
                Console.WriteLine("Despues {0}", xreal);
                i = (int) (-(real.XMin) * numpuntos/(real.XMax - real.XMin));
                Console.WriteLine("i {0}", i);

            }
            */
            
            for (int i = 0; i <= numpuntos; i++) // OJOOOOOOOOOOOOOO Aqui he cambiado el < por <= para que llegue de -10 a 10 y no de -10 a 9.66 por ejemplo
            {
                xreal = real.XMin + i * (real.XMax - real.XMin) / numpuntos;
                yreal = SwitchFunctionFromButton(xreal);


                if ((Convert.ToInt32(xreal)) == 0)
                {
                    Console.WriteLine(xreal);
                    i++;
                    i++;
                    xreal = real.XMin + i * (real.XMax - real.XMin) / numpuntos;
                }

                xpant = ConvertXFromRealToPant(xreal, pant.XMin);
                ypant = ConvertYFromRealToPant(yreal, pant.YMin);

                Point punto = new Point(xpant, ypant);
                puntos.Add(punto);
            }

            polilinea.Points = new PointCollection(puntos);
            lienzo.Children.Add(polilinea);
            

            foreach(PointCollection p in PointCollectionList)
            {
                lienzo.Children.Add(new Polyline()
                {
                    Points = p,
                    Stroke = Brushes.Black
                });
            }

            DrawAxis();
        }

        private double SwitchFunctionFromButton(double xreal)
        {
            double a = 12;
            double b = -5;
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
            real.XMin = -5;
            real.YMin = -10;
            real.XMax = 3;
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
                TransformGroup tg = (TransformGroup)lienzo.RenderTransform;
                if (tg != null)
                {
                    tg.Children.Add(scaleTransform);
                    lienzo.RenderTransformOrigin = new Point(0.5, 0.5);
                    added = true;
                }
            }
        }


        private void lienzo_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Panel MousePanel = (Panel)sender;
            Point p = e.GetPosition(lienzo);

            Console.WriteLine("Position Mouse Canvas X:{0} Y:{1}", p.X, p.Y);

            XPositonLabel.Content = ConvertXFromPantToReal(p.X, lienzo.ActualWidth); 
            YPositonLabel.Content = ConvertYFromPantToReal(p.Y, lienzo.ActualHeight);
        }

        private void clipBorder_MouseEnter(object sender, MouseEventArgs e)
        {
            Mouse.OverrideCursor = Cursors.Cross;
        }

        private void clipBorder_MouseLeave(object sender, MouseEventArgs e)
        {
            Mouse.OverrideCursor = Cursors.Arrow;
        }

        private void theGrid_MouseMove(object sender, MouseEventArgs e)
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

        private void theGrid_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            theGrid.ReleaseMouseCapture();
            isDragged = false;
        }

        private void theGrid_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            theGrid.CaptureMouse();
            _last = e.GetPosition(theGrid);
            isDragged = true;
        }

        /*
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
        */

    }
}
