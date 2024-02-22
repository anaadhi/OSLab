using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace notepad
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void newToolStripMenuItem_Click(object sender, EventArgs e)
        {
            rtb.Clear();
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog var = new OpenFileDialog();
            var.Title = "Open";
            var.Filter = "Text Document(*.txt)|*.txt|All Files(*.*)|*.*";
            if (var.ShowDialog() == DialogResult.OK)
                rtb.LoadFile(var.FileName,
            RichTextBoxStreamType.PlainText);
            this.Text = var.FileName;
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveFileDialog var = new SaveFileDialog();
            var.Title = "Save";
            var.Filter = "Text Document(*.txt)|*.txt|All Files(*.*)|*.*";
            if (var.ShowDialog() == DialogResult.OK)
                rtb.SaveFile(var.FileName,
            RichTextBoxStreamType.PlainText);
            this.Text = var.FileName;
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void redoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            rtb.Redo();
        }

        private void undoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            rtb.Undo();
        }

        private void cutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            rtb.Cut();
        }

        private void copyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            rtb.Copy();
        }

        private void pasteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            rtb.Paste();
        }

        private void selectAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            rtb.SelectAll();
        }

        private void fontToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FontDialog dlg = new FontDialog();
            dlg.Font = rtb.SelectionFont;
            dlg.Color = rtb.SelectionColor;
            if (dlg.ShowDialog() == DialogResult.OK)
            {
            rtb.SelectionFont = dlg.Font;
            rtb.SelectionColor = dlg.Color;
            }
        }

        private void colorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ColorDialog dlg = new ColorDialog();
            dlg.Color = rtb.SelectionColor;
            if (dlg.ShowDialog() == DialogResult.OK)
            {
                rtb.SelectionColor = dlg.Color;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void PrintDocument_PrintPage(object sender, PrintPageEventArgs e)
        {}

        private void printToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PrintDialog printDialog = new PrintDialog();
            if (printDialog.ShowDialog() == DialogResult.OK)
            {
                PrintDocument printDocument = new PrintDocument();
                printDocument.DocumentName = "My Document";
                printDocument.PrintPage += new PrintPageEventHandler(PrintDocument_PrintPage);
                printDocument.Print();
            }
        }
       }
}

