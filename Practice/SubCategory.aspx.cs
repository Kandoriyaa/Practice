using Practice.Class;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice
{
    public partial class SubCategory : System.Web.UI.Page
    {
        GeneralClass OBJG = new GeneralClass();
        CommanClass Cmm = new CommanClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            { 
                BindCategory();
                BindSubCategorySearch();
            }
        }

        public void BindSubCategorySearch()
        {
            DataTable dt = new DataTable();
            
            dt = Cmm.SubCategoryBindList(txtSearch.Text);

            if(dt !=null)
            {
                SubCategoryGrid.DataSource = dt;
                SubCategoryGrid.DataBind();

            }
            else
            {
                SubCategoryGrid.DataSource=null;
                SubCategoryGrid.DataBind();

            }


        }


        public void BindCategory()
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@Id", "");
            nv.Add("@Mode", "1");

            dt = OBJG.GetDataTable("GET_category", nv);


            if(dt !=null && dt.Rows.Count >0)
            {

                ddlcategory.DataSource = dt;
                ddlcategory.DataTextField = "CategoryName";
                ddlcategory.DataValueField = "CategoryId";
                ddlcategory.DataBind();
                ddlcategory.Items.Insert(0,new ListItem("---Select Category---","0"));
            }
            else 
            {
                ddlcategory.DataSource = null;
                ddlcategory.DataBind();
                ddlcategory.Items.Clear();
                ddlcategory.Items.Insert(0, new ListItem("---Select Category---", "0"));


            }


        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            CommanClass Cmm = new CommanClass();

            int Result = 0;

            Result = Cmm.AddSubCatogry(Convert.ToInt32(ddlcategory.SelectedItem.Value),txtsubCategoryName.Text);



        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindSubCategorySearch();
        }

        protected void SubCategoryGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}