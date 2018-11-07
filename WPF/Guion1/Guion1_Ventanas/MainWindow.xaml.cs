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

namespace Guion1_Ventanas
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {


        public class Function
        {
            public bool isVisible { get; set; }
            public string color { get; set; }
            public string name { get; set; }
        }

        public MainWindow()
        {
            InitializeComponent();

            List<Function> obj = new List<Function>();

            Function f = new Function();
            f.isVisible = false;
            f.color = "Red";
            f.name = "sin(x)";
            obj.Add(f);

            f = new Function();
            f.isVisible = false;
            f.color = "Red";
            f.name = "cos(x)";
            obj.Add(f);

            f = new Function();
            f.isVisible = false;
            f.color = "Red";
            f.name = "1/(x-2)";
            obj.Add(f);

            tableGrid.ItemsSource = obj;
        }

        
    }
}
