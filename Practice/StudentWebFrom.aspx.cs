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
    public partial class StudentWebFrom : System.Web.UI.Page
    {
        GeneralClass OBJG = new GeneralClass();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StudentBindList();
                BindCountry();
                BindState();
                BindCity();

            }

        }

        public void StudentBindList()
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@Name", txtsearch.Text);
            nv.Add("@PhoneNo", txtsearch.Text);
            nv.Add("@EmailId", txtsearch.Text);

            dt = OBJG.GetDataTable("GET_EmployeeSearch", nv);



            if (dt != null)
            {
                StudentList.DataSource = dt;
                StudentList.DataBind();

            }
            else
            {
                StudentList.DataSource = null;
                StudentList.DataBind();

            }



        }

        public void BindCountry()
        {

            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@ID", "0");

            nv.Add("@Mode", "1");

            dt = OBJG.GetDataTable("Get_AllCountry", nv);


            if (dt != null && dt.Rows.Count > 0)
            {
                ddlCountry.DataSource = dt;
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("---Select Country---", "0"));

            }
            //else
            //{
            //    ddlCountry.DataSource=null;
            //    ddlCountry.DataBind();
            //    ddlCountry.Items.Clear();
            //    ddlCountry.Items.Insert(0, new ListItem("---Select Country", "0"));

            //}

        }

        public void BindState()
        {


            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            int Country = Convert.ToInt32(ddlCountry.SelectedItem.Value);

            nv.Add("@Id", Country.ToString());
            


            dt = OBJG.GetDataTable("Get_State", nv);


            if (dt != null && dt.Rows.Count > 0)
            {
                ddlState.DataSource = dt;
                ddlState.DataTextField = "StateName";
                ddlState.DataValueField = "StateID";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("---Select state---", "0"));

            }
            else
            {
                ddlState.DataSource = null;
                ddlState.DataBind();
                ddlState.Items.Clear();
                ddlState.Items.Insert(0, new ListItem("---Select State---", "0"));

            }

        }

        public void BindCity()
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@Id", ddlState.SelectedItem.Value);
           

            dt = OBJG.GetDataTable("Get_City", nv);

            if (dt != null && dt.Rows.Count > 0)
            {
                ddlCity.DataSource = dt;
                ddlCity.DataTextField = "CityName";
                ddlCity.DataValueField = "CityID";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("---Select City", "0"));

            }
            else
            {
                ddlCity.DataSource = null;
                ddlCity.DataBind();
                ddlCity.Items.Clear();
                ddlCity.Items.Insert(0, new ListItem("---Select City", "0"));
            }




        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            CommanClass Cmm = new CommanClass();
            int Result = 0;
            Result = Cmm.AddStudent(txtName.Text, txtPhoneNo.Text,txtEmailId.Text,txtGender.Text,txtAddress.Text, Convert.ToInt32(ddlCountry.SelectedItem.Value), Convert.ToInt32(ddlState.SelectedItem.Value), Convert.ToInt32(ddlCity.SelectedItem.Value),txtPassword.Text);

            Response.Redirect("StudentWebFrom.aspx");

        }




        protected void StudentList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void ddlState_SelectedIndexChanged1(object sender, EventArgs e)
        {
            BindCity();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            Addpanel.Visible = true;
            Listpanel.Visible = false;
        }

        protected void ddlCountry_SelectedIndexChanged1(object sender, EventArgs e)
        {
            BindState();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StudentBindList();

            //if (!string.IsNullOrEmpty(txtsearch.Text))
            //{

            //    CommanClass cmm = new CommanClass();
            //    DataTable dt = new DataTable();
            //    dt = cmm.AddSearch(FullNametxt.Text);

            //    StudentList.DataSource = dt;
            //    StudentList.DataBind();
            //}
            //else
            //{
            //    StudentBindList();
            //}
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            StudentBindList();
        }

        protected void StudentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }

}