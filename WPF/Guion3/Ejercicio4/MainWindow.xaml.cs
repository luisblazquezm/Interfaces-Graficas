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

            ejex.Stroke = Brushes.Black;
            ejey.Stroke = Brushes.Black;

            // EJE X
            ejex.X1 = 0;
            ejex.X2 = pant.XMax;
            ejex.Y1 = ConvertYFromRealToPant(0,0);
            ejex.Y2 = ConvertYFromRealToPant(0, 0);

            // EJE Y
            ejey.Y1 = 0;
            ejey.Y2 = pant.YMax;
            ejey.X1 = ConvertXFromRealToPant(0, 0);
            ejey.X2 = ConvertXFromRealToPant(0, 0);

            lienzo.Children.Add(ejex);
            lienzo.Children.Add(ejey);
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

            for (int i = 0; i < numpuntos; i++)
            {
                xreal = real.XMin + i * (real.XMax - real.XMin) / numpuntos;
                yreal = SwitchFunctionFromButton(xreal);

                xpant = ConvertXFromRealToPant(xreal, pant.XMin);
                ypant = ConvertYFromRealToPant(yreal, pant.YMin);

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
                    break;
                case SEN:
                    numFunction++;
                    return a * Math.Sin(b * xreal); // x^2
                    break;
                case COS:
                    return a * Math.Cos(b * xreal);
                    break;
                case EXPONENCIAL:
                    return a * Math.Pow(xreal, b);
                    break;
                case PRODUCTO:
                    return a * xreal + b;
                    break;
                case FRACCIONARIA:
                    return a / (b * xreal);
                    break;
                default:
                    return xreal* xreal; // x^2
            }

            return 0;
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
            return (real.XMax - width) * ((xpant - pant.XMin) / (pant.XMax - pant.XMin)) + real.XMin;
        }

        private double ConvertYFromPantToReal(double ypant, double height)
        {
            return (height - real.YMax) * ((ypant - pant.YMin) / (pant.YMax - pant.YMin)) + real.YMax;
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
        bool isDragged, isDragging;

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

            posOnWindow = Mouse.GetPosition(lienzo);
            onCanvas.X = double.Parse(string.Format("{0:n2}", (ConvertXFromPantToReal(posOnWindow.X, lienzo.ActualWidth) * 100) / 100));
            onCanvas.Y = double.Parse(string.Format("{0:n2}", (ConvertYFromPantToReal(posOnWindow.Y, lienzo.ActualHeight) * 100) / 100));
            XPositonLabel.Content = ConvertXFromPantToReal(posOnWindow.X, lienzo.ActualWidth);
            YPositonLabel.Content = posOnWindow.X;
            
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
