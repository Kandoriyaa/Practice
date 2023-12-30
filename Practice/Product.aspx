<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Practice.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:Panel ID="AddPanel" Visible="true" runat="server">
 <div >
<div class="dash-app">
 
<div class="container-fluid">
           <div class="col">
            <div class="col-xl-12">
                <div class="card easion-card">
                    <div class="card-header">
                        <div class="easion-card-icon">
                            <i class="fas fa-chart-bar"></i>
                        </div>
                        <div class="easion-card-title"> Student layout </div>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="form-row col-md-12">
                                <div class="form-group col-md-4">
                                
                                    <label for="inputPassword4">Category</label>
                                    <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" class="form-control" runat="server"></asp:DropDownList>
                                </div>                                   
                                    
                                          <div class="form-group col-md-4">
                                
                                    <label for="inputPassword4">Sub Category</label>
                                              <asp:DropDownList ID="ddlSubCategory" class="form-control" runat="server"></asp:DropDownList>
                                </div>   
                                </div>
                                
                                 <div class="form-row col-md-12">
                               <div class="form-group col-md-4">
                                    <label for="inputPassword4">Product Name</label>
                                    <asp:TextBox ID="txtProductName" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Product Description</label>
                                    <asp:TextBox ID="txtProductDescription" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Product Img</label>
                                    <asp:FileUpload ID="FileUploadImage" runat="server" />
                                   
                                </div>
                               </div>
                              <div class="form-row col-md-12">
                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Product Quantity</label>
                                    <asp:TextBox ID="txtQuantity" class="form-control" runat="server"></asp:TextBox>
                                </div>  
                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Product Price</label>
                                    <asp:TextBox ID="txtPrice" class="form-control" runat="server"></asp:TextBox>
                                </div>                                
                            </div>
                          
                           
                            <div class="form-row">
                            
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                    
                                    <label class="custom-control-label" for="customCheck4">Check this custom checkbox</label>
                                </div>
                            </div>                                
                            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary" runat="server" Text="Submit" />
                            <asp:Button ID="btnUplod" OnClick="btnUplod_Click" runat="server" class="btn btn-primary" Text="Uplod" />
                            <asp:Image ID="ImageProfileImage" runat="server" />
                            <asp:Label ID="lblFilePath" runat="server" Text="Label"></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
    </div>
     </div>
    </asp:Panel>


        <asp:Panel ID="ViewPanel" Visible="true" runat="server">
         
             <div style="padding:0px 0px 0px 240px;" >
 
    <div class="row">
      
     <div class=" col-md-6x">
         <div class="form-group">
         <label> search</label>
             <asp:TextBox ID="txtSearch" OnTextChanged="txtSearch_TextChanged" runat="server"></asp:TextBox>
                   </div>
         
    <div class=" col-md-6"> 
<div class="form-group">
<label>Search </label>
<asp:Button ID="btnSearch"  runat="server" Text="Search" />
    </div>
        </div>
     </div>
    </div>
    
      <div class="row">
  <div class=" col-md-12">
      <asp:GridView ID="ProductGrid" OnRowCommand="SubCategoryGrid_RowCommand" AutoGenerateColumns="false"  class="table table-bordered table-hover dataTable dtr-inline" runat="server">
                             <Columns>
                       <asp:TemplateField HeaderText = "Sr No" >
            <ItemTemplate>
                  <asp:Label ID = "Name" runat="server" Text='<%#  Container.DataItemIndex +1%>'></asp:Label>
             </ItemTemplate>
            </asp:TemplateField>
                      <asp:TemplateField HeaderText="CategoryName">
                          <ItemTemplate>
                              <asp:Label ID="CategoryName" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>           
                       <asp:TemplateField HeaderText="SubCategoryName">
                           <ItemTemplate>
                               <asp:Label ID="SubCategoryName" runat="server" Text='<%# Eval("SubCategoryName") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductName">
                         <ItemTemplate>
                             <asp:Label ID="ProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>           
                      <asp:TemplateField HeaderText="ShortDescription">
                          <ItemTemplate>
                              <asp:Label ID="ShortDescription" runat="server" Text='<%# Eval("ShortDescription") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                         <asp:TemplateField HeaderText="productQuantity">
                             <ItemTemplate>
                                 <asp:Label ID="productQuantity" runat="server" Text='<%# Eval("productQuantity") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>           
                          <asp:TemplateField HeaderText="ProductPrice">
                              <ItemTemplate>
                                  <asp:Label ID="ProductPrice" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                         <asp:TemplateField HeaderText="ProductImg">
                             <ItemTemplate>
                                 <asp:Image ID="ProductImg" runat="server" Width="100px" Height="75px" ImageUrl='<%# "../Photo/"+ Eval("ProductImg") %>'></asp:Image>
                             </ItemTemplate>
                         </asp:TemplateField>
               </Columns> 
      </asp:GridView>
        </div>
      </div>

   
         </div>
    </asp:Panel>
</asp:Content>
