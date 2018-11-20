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

        public static int REAL_MIN_INDEX = 0;
        public static int REAL_MAX_INDEX = 1;
        public static int PANT_MIN_INDEX = 2;
        public static int PANT_MAX_INDEX = 3;

        public static double xrealMin = -10;
        public static double yrealMin = -10;
        public static double xrealMax = 10;
        public static double yrealMax = 110;
        public static double xpantMin = 0; // X_MIN
        public static double ypantMin = 0; // Y_MIN
        public static double xpantMax = 0; // X_MAX
        public static double ypantMax = 0; // Y_MAX
        public double ScaleRate = 1.1;
        public ScaleTransform scaleTransform = new ScaleTransform();      //---------> object for Scale-Transform                         //-------------> scaleRate that has to be Zoom for each point of Mouse_Wheel
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

            DrawGraphic();


            // OJO hacer un evento en EL TRABAJO FINAL QUE REDIBUJE CADA VEZ QUE SE HAGA LA VISTA
            // PORQUE SINO CUANDO AUMENTAS O DISMINUYES EL TAMAÑO DE LA VENTANA TIENES QUE VOLVER
            // A DARLE AL BOTON DE DIBUJAR PARA QUE RECALCULE TODO.

        }

        private void DrawAxis()
        {
            Line ejex = new Line();
            Line ejey = new Line();

            ejex.Stroke = Brushes.Black;
            ejey.Stroke = Brushes.Black;

            // X1 es el inicio y X2 el final
            ejex.X1 = xpantMin;
            ejex.X2 = xpantMax;
            ejex.Y1 = (ypantMin - ypantMax) * ((0 - yrealMin) / (yrealMax - yrealMin)) + ypantMax;
            ejex.Y2 = (ypantMin - ypantMax) * ((0 - yrealMin) / (yrealMax - yrealMin)) + ypantMax;

            ejey.X1 = xpantMax / 2;
            ejey.X2 = xpantMax / 2;
            ejey.Y1 = ypantMin;
            ejey.Y2 = ypantMax;

            lienzo.Children.Add(ejex);
            lienzo.Children.Add(ejey);
        }

        private void DrawGraphic()
        {
            PointCollection puntos = new PointCollection();
            Polyline polilinea = new Polyline();
            double xreal, yreal, xpant, ypant;
            int numpuntos;
        
            xpantMax = lienzo.ActualWidth;
            ypantMax = lienzo.ActualHeight;
            numpuntos = (int)xpantMax;

            polilinea.Stroke = Brushes.Red;

            for (int i = 0; i < numpuntos; i++)
            {
                xreal = xrealMin + i * (xrealMax - xrealMin) / numpuntos;
                yreal = xreal * xreal; // x^2

                xpant = (xpantMax - xpantMin) * ((xreal - xrealMin) / (xrealMax - xrealMin)) + xpantMin;
                ypant = (ypantMin - ypantMax) * ((yreal - yrealMin) / (yrealMax - yrealMin)) + ypantMax;

                Point punto = new Point(xpant, ypant);
                puntos.Add(punto);
            }

            polilinea.Points = new PointCollection(puntos);
            lienzo.Children.Add(polilinea);

            DrawAxis();
        }

        private double ConvertXFromRealToPant(PointCollection pts, double xRealFunctionValue)
        {
            //return ( (xpantMax - xpantMin) * ((xreal - xrealMin) / (xrealMax - xrealMin)) + xpantMin );
            double value = ( (pts[PANT_MAX_INDEX].X - pts[PANT_MIN_INDEX].X) * ((xRealFunctionValue - pts[REAL_MIN_INDEX].X) / (pts[REAL_MAX_INDEX].X - pts[REAL_MIN_INDEX].X) + pts[PANT_MIN_INDEX].X) );
            Console.WriteLine("XfroMrealtoPant: {0}", value);
            return value;
        }

        private double ConvertYFromRealToPant(PointCollection pts, double yRealFunctionValue)
        {
            //return (ypantMin - ypantMax) * ((yreal - yrealMin) / (yrealMax - yrealMin)) + ypantMax;
            double value = ( (pts[PANT_MIN_INDEX].Y - pts[PANT_MAX_INDEX].Y) * ((yRealFunctionValue - pts[REAL_MIN_INDEX].Y) / (pts[REAL_MAX_INDEX].Y - pts[REAL_MIN_INDEX].Y) + pts[PANT_MAX_INDEX].Y) );
            Console.WriteLine("YfroMrealtoPant: {0}", value);
            return value;
        }

        private void Window_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            lienzo.Children.Clear();
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

        Point _last;
        bool isDragged;
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
            //_last = e.GetPosition(canvas);
            _last = e.GetPosition(theGrid);
            isDragged = true;
        }
    }
}
