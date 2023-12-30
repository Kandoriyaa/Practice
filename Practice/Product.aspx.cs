using Practice.Class;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice
{
    public partial class Product : System.Web.UI.Page
    {
        CommanClass Cmm = new CommanClass();
        GeneralClass Objg = new GeneralClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ProudectSearchBind();
                CategoryBind();
                SubCategoryBind();
            }

        }


        public void ProudectSearchBind()
        {
            DataTable dt = new DataTable();

            dt = Cmm.ProductBind(txtSearch.Text);



            if (dt != null)
            {
                ProductGrid.DataSource = dt;
                ProductGrid.DataBind();

            }
            else
            {
                ProductGrid.DataSource = null;
                ProductGrid.DataBind();

            }
        }

        public void CategoryBind()
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@Id", "0");
            nv.Add("@Mode", "1");

            dt = Objg.GetDataTable("GET_category", nv);


            if (dt != null && dt.Rows.Count > 0)
            {

                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryId";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("---Select Category---", "0"));
            }
            else
            {
                ddlCategory.DataSource = null;
                ddlCategory.DataBind();
                ddlCategory.Items.Clear();
                ddlCategory.Items.Insert(0, new ListItem("---Select Category---", "0"));


            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategoryBind();
        }


        public void SubCategoryBind()
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            int Category = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            nv.Add("@ID", Category.ToString());
            

            dt = Objg.GetDataTable("GET_SubCategoryDrop", nv);

            if (dt != null && dt.Rows.Count > 0)
            {

                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCategoryName";
                ddlSubCategory.DataValueField = "SubCategoryId";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("---Select Category---", "0"));
            }
            else
            {
                ddlSubCategory.DataSource = null;
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Clear();
                ddlSubCategory.Items.Insert(0, new ListItem("---Select Category---", "0"));


            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int Result = 0;
            NameValueCollection nv = new NameValueCollection();

            Result = Cmm.AddProduct(Convert.ToInt32(ddlCategory.SelectedItem.Value),Convert.ToInt32(ddlSubCategory.SelectedItem.Value),txtProductName.Text, txtProductDescription.Text, lblFilePath.Text, txtQuantity.Text, txtPrice.Text);

            Response.Redirect("Product.aspx");

            //if(Result==0)
            //{
            //    string message = "Product Added  Successfully ";
            //    string url = "Product.aspx";

            //    Objg.ShowMessageAndRedirect(this, message, url);

            //}
            //else
            //{
            //    string message = "Product Added UnSuccessfully ";
            //    string url = "Product.aspx";

            //    Objg.ShowMessageAndRedirect(this, message, url);
            //}
        }

        public void UploadImage()
        {
            try
            {
                string filename = "", newfile = "";
                string[] validFileTypes = { "jpeg", "png", "jpg", "bmp", "gif" };

                if (!FileUploadImage.HasFile)
                {
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select a file.');", true);
                    FileUploadImage.Focus();
                }


                string ext = System.IO.Path.GetExtension(FileUploadImage.PostedFile.FileName).ToLower();
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (isValidFile == true)
                {

                    if (FileUploadImage.HasFile)
                    {

                        filename = Server.MapPath(FileUploadImage.FileName);
                        newfile = FileUploadImage.PostedFile.FileName;

                        FileInfo fi = new FileInfo(newfile);

                        // check folder exist or not
                        if (!System.IO.Directory.Exists(@"~\Photo\"))
                        {
                            try
                            {

                                string Imgname = txtProductName.Text;

                                string path = Server.MapPath(@"~\Photo");

                                System.IO.Directory.CreateDirectory(path);
                                FileUploadImage.SaveAs(path + @"\" + txtProductName.Text + ext);

                                ImageProfileImage.ImageUrl = @"~\Photo\" + txtProductName.Text + ext;
                                ImageProfileImage.Visible = true;

                                lblFilePath.Text = Imgname + ext;


                            }
                            catch (Exception ex)
                            {
                                lblFilePath.Text = "Not able to create new directory";
                            }

                        }
                    }
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "ShowAlert", "alert('Please select valid file.');", true);
                }
            }
            catch (Exception ex)
            {

            }

          

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            ProudectSearchBind();
        }

        protected void SubCategoryGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnUplod_Click(object sender, EventArgs e)
        {
            UploadImage();

        }
    }
}