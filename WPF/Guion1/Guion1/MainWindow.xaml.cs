using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Guion1
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BotonInvierte_Click(object sender, RoutedEventArgs e)
        {
            TextBox tb = CajaTexto;
            Label etiq = Etiqueta;
            int i;
            string aux = "";
            for (i = 0; i < tb.Text.Length; i++)
                aux += tb.Text[tb.Text.Length - i - 1];

            etiq.Content = aux;
        }

        private void BotonMayuscula_Click(object sender, RoutedEventArgs e)
        {
            TextBox tb = CajaTexto;
            Label etiq = Etiqueta;
            etiq.Content = CajaTexto.Text.ToUpper();
        }

        private void Rojo_Click(object sender, RoutedEventArgs e)
        {
            Background = Brushes.Red;
        }

        private void Verde_Click(object sender, RoutedEventArgs e)
        {
            Background = Brushes.Green;
        }

        private void ConvertirButton_Click(object sender, RoutedEventArgs e)
        {
            TextBox tb = CelsiusBox;
            Label etiq = FarenheitBox;
            double aux = double.Parse(tb.Text);
            double output = ((aux*9)/5)+32;  // OJO Cuidado aqui 

            etiq.Content = output.ToString();
        }
    }
}
