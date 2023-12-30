using Practice.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice
{
    public partial class Login : System.Web.UI.Page
    {

        GeneralClass Obgj = new GeneralClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            CommanClass Cmm = new CommanClass();
            DataTable dt = new DataTable();


            dt = Cmm.AddLogin(txtUserName.Text,txtPassword.Text);

            


            if(dt !=null && dt.Rows.Count>0) 
            {

                Response.Redirect("Category.aspx");

            }
            else
            {
                string message = "Login  UnSuccessfully ";
                string url = "BatchCompleted.aspx";

                Obgj.ShowMessageAndRedirect(this, message, url);

                Response.Redirect("Login.aspx");
            }



        }
    }
}