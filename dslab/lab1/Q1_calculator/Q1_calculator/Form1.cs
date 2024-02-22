using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Q1_calculator
{
    public partial class Form1 : Form
    {
        String str1 = "";
        String str2 = "";
        char opr;
        double res = 0.0;
        int c = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void appendNum(string num)
        {
            if (c == 0)
            {
                str1 += num;
                textBox1.Text = str1;
            }
            else
            {
                str2 += num;
                textBox1.Text = str1 + opr + str2;
            }
        }


        private void textBox1_TextChanged(object s, EventArgs e)
        {

        }

        private void button11_Click(object s, EventArgs e)
        {
            double.TryParse(str1, out double num1);
            double.TryParse(str2, out double num2);

            switch (opr)
            {
                case '+':
                    res = num1 + num2;
                    break;
                case '-':
                    res = num1 - num2;
                    break;
                case '*':
                    res = num1 * num2;
                    break;
                case '/':
                    if (num2 != 0)
                    {
                        res = num1 / num2;
                    } else
                    {
                        textBox1.Text = "DIV/Zero!";
                        return;
                    }
                    break;
            }

            textBox1.Text = res.ToString();
            str1 = res.ToString();
            str2 = "";
            c = 0;
        }


        private void button13_Click(object s, EventArgs e)
        {
            opr = '-';
            c++;
            textBox1.Text += opr;
        }

        private void button14_Click(object s, EventArgs e)
        {
            opr = '*';
            c++;
            textBox1.Text += opr;
        }

        private void button15_Click(object s, EventArgs e)
        {
            opr = '/';
            c++;
            textBox1.Text += opr;
        }

        private void button12_Click(object s, EventArgs e)
        {
            opr = '+';
            c++;
            textBox1.Text += opr;
        }


        private void button18_Click(object s, EventArgs e)
        {
            double.TryParse(textBox1.Text, out double num);
            res = Math.Sin(num * (Math.PI / 180));
            textBox1.Text = res.ToString();
        }

        private void button16_Click(object s, EventArgs e)
        {
            double.TryParse(textBox1.Text, out double num);
            textBox1.Text = Math.Log(num).ToString();
        }

        private void button20_Click(object s, EventArgs e)
        {
            textBox1.Text = null;
            str1 = "";
            str2 = "";
        }

        private void button17_Click(object s, EventArgs e)
        {
            double.TryParse(textBox1.Text, out double num);
            num *= num;
            textBox1.Text = num.ToString();
        }

        private void button19_Click(object s, EventArgs e)
        {
            double.TryParse(textBox1.Text, out double num);
            res = Math.Cos(num * (Math.PI / 180));
            textBox1.Text = res.ToString();
        }

        private void button21_Click(object sender, EventArgs e)
        {
            appendNum(".");
        }

        private void button_num_click(object sender, EventArgs e)
        {
            // get value of the button
            string num = ((Button)sender).Text;
            appendNum(num);
        }
    }
}
