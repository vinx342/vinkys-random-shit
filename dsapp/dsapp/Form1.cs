using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace dsapp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void RegisButton_Click(object sender, EventArgs e)
        {
            string connectionString = null;
            SqlConnection cnn;
            connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vinx\\source\\repos\\dsapp\\dsapp\\MyDB1.mdf;Integrated Security=True";
            cnn = new SqlConnection(connectionString);

            cnn.Open();

            int IDTEST = Convert.ToInt32(idTBox.Text);
            int AGETEST = Convert.ToInt32(AgeTBox.Text);

            SqlCommand sqlcmd = new SqlCommand("INSERT into tbl_Student values ("+IDTEST+",'"+FNameTBox.Text+"','"+LNameTBox.Text+"','" +AGETEST+ "','"+adrsTBox.Text+"')", cnn);
            sqlcmd.ExecuteNonQuery();
            cnn.Close();

            refresh();
        }

        public void refresh()
        {
            string connectionString = null;
            SqlConnection cnn;
            connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vinx\\source\\repos\\dsapp\\dsapp\\MyDB1.mdf;Integrated Security=True";
            cnn = new SqlConnection(connectionString);

            cnn.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("SELECT * from tbl_Student", cnn);
            DataTable dt = new DataTable();
            sqlDA.Fill(dt);
            dataGridView1.DataSource = dt;
            cnn.Close();
        }

        private void removeButton_Click(object sender, EventArgs e)
        {
            string connectionString = null;
            SqlConnection cnn;
            connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\vinx\\source\\repos\\dsapp\\dsapp\\MyDB1.mdf;Integrated Security=True";
            cnn = new SqlConnection(connectionString);

            cnn.Open();

            int IDTEST = Convert.ToInt32(idTBox.Text);
            int AGETEST = Convert.ToInt32(AgeTBox.Text);

            SqlCommand sqlcmd = new SqlCommand("DELETE from tbl_Student", cnn);
            sqlcmd.ExecuteNonQuery();
            cnn.Close();

            refresh();
        }
    }
}
