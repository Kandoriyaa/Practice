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
    public partial class Category : System.Web.UI.Page
    {
        GeneralClass OBJG = new GeneralClass();
        CommanClass Cmm = new CommanClass();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {

                CategoryBind();
            }
        }

        public void CategoryBind()
        {
            DataTable dt = new DataTable();

            dt = Cmm.CategoryBindList(txtsearch.Text);

            if(dt !=null) 
            {
              CategoryGrid.DataSource = dt;
              CategoryGrid.DataBind();
            
            }
            else
            { 
                CategoryGrid.DataSource = null;
                CategoryGrid.DataBind();
            
            
            }

        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int Result = 0;
            CommanClass Cmm = new CommanClass();
           

            Result = Cmm.AddCategory(txtCategory.Text);

            //Response.Redirect("SubCategory.aspx");

            if(Result==0)
            {

                string message = "Category Added  Successfully ";
                string url = "BatchCompleted.aspx";

                OBJG.ShowMessageAndRedirect(this, message, url);
            }
            else
            {
                string message = "Category Added  UnSuccessfully ";
                string url = "BatchCompleted.aspx";

                OBJG.ShowMessageAndRedirect(this, message, url);


            }
            
        }

        protected void CategoryGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            CategoryBind();
        }
    }
}