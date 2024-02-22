namespace StudentFormQ2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            if (!int.TryParse(textBox2.Text, out int res))
                MessageBox.Show("Only enter numbers...");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string name = textBox1.Text;
            int regNo = int.Parse(textBox2.Text);
            string gender = "male";
            if (radioButton2.Checked)
            {
                gender = "female";
            }

            string exams = "";

            if (checkBox1.Checked)
            {
                exams += "jee ";
            }
            if (checkBox2.Checked)
            {
                exams += "cet ";
            }
            if (checkBox3.Checked)
            {
                exams += "MET ";
            }

            string dob = monthCalendar1.SelectionStart.ToShortDateString();
            MessageBox.Show("Confirmed\n Name: " + name + "\nReg No: " + regNo + "\nGender: " + gender + "\nDOB: " + dob + "\nExams: " + exams);
        }
    }
}
