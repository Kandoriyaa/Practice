using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;

namespace Practice.Class
{

   
    public class CommanClass
    {
        GeneralClass ObjG = new GeneralClass();
        public int AddStudent(string Name, string PhoneNo, string EmailId, string Gender, String Address, int Countryid, int stateid, int cityid, string Password)
        {
            int Result = 0;

            NameValueCollection nv = new NameValueCollection();

            nv.Add("@Name", Name);
            nv.Add("@PhoneNo", PhoneNo);
            nv.Add("@EmailId", EmailId);
            nv.Add("@Gender", Gender);
            nv.Add("@Address", Address);
            nv.Add("@CountryId", Countryid.ToString());
            nv.Add("@StateId", stateid.ToString());
            nv.Add("@CityId", cityid.ToString());
            nv.Add("@Password", Password);

            Result = ObjG.GetDataInsertORUpdate("Get_LOginR", nv);


            return Result;
        }


        public DataTable AddSearch( string FristName)
        {
            
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@FristName", FristName);
           
            dt = ObjG.GetDataTable("GET_search", nv);

            return dt;


        }

        public int AddCategory( string CategoryName)
        {
            int Result = 0;
           
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@CategoryName", CategoryName);

            Result = ObjG.GetDataExecuteScaler("Set_Category", nv);

            return Result;

        }


        public int AddSubCatogry( int CategoryId, String SubCategory)
        {
            int result = 0;
            NameValueCollection nv =new NameValueCollection();

            nv.Add("@CategoryId", CategoryId.ToString());
            nv.Add("@SubCategoryName", SubCategory);

            result = ObjG.GetDataInsertORUpdate("GET_Subcategory", nv);


            return result;
        }


        public DataTable AddLogin( string UserName, String Password)
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@UserName", UserName);
            nv.Add("@Password", Password);

            dt = ObjG.GetDataTable("GET_LoginMaster", nv);


            return dt;
          
        }


        public int AddProduct(int CategoryId, int SubCategory, string ProductName, string ShortDescription, string ProductImg, String ProductQuantity, String ProductPrice)
        {
            int Result = 0;
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@CategoryId", CategoryId.ToString());
            nv.Add("@SubCategoryId", SubCategory.ToString());
            nv.Add("@ProductName", ProductName);
            nv.Add("@ShortDescription", ShortDescription);
            nv.Add("@ProductImg", ProductImg);
            nv.Add("@productQuantity", ProductQuantity);
            nv.Add("@ProductPrice", ProductPrice);

            Result = ObjG.GetDataExecuteScaler("Set_Product", nv);

            return Result;

        }


        public DataTable CategoryBindList(string CategoryName)
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@CategoryName", CategoryName);

            dt = ObjG.GetDataTable("GET_CategorySearch", nv);


            return dt;
        }


        public DataTable SubCategoryBindList( string SubCategoryName)
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@SubCategoryName", SubCategoryName);
            

            dt = ObjG.GetDataTable("GET_SubCategoreSearch", nv);

            

            return dt;
        }


        
        public DataTable ProductBind( string ProductName)
        {
            DataTable dt = new DataTable();
            NameValueCollection nv = new NameValueCollection();

            nv.Add("@ProductName", ProductName);
           

            dt = ObjG.GetDataTable("Get_ProductSearch", nv);



            return dt;
        }

       
    }
}