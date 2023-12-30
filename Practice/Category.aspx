<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Practice.Category" %>
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
                                    
                                     
                                 </div>
                                 <div class="form-group col-md-4">
                                     <label for="inputPassword4">Category</label>
                                     <asp:TextBox ID="txtCategory" class="form-control" runat="server"></asp:TextBox>
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
         <asp:TextBox ID="txtsearch" OnTextChanged="txtsearch_TextChanged"  class="form-control" runat="server"></asp:TextBox>

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
        <asp:GridView ID="CategoryGrid" OnRowCommand="CategoryGrid_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-hover dataTable dtr-inline" runat="server">
               <Columns>
                   <asp:TemplateField HeaderText = "Sr No" >
        <ItemTemplate>
              <asp:Label ID = "Name" runat="server" Text='<%#  Container.DataItemIndex +1%>'></asp:Label>
         </ItemTemplate>
        </asp:TemplateField>
                   <asp:TemplateField HeaderText="Name">
                       <ItemTemplate>
                           <asp:Label ID="CategoryName" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
               
           </Columns> 

        </asp:GridView>
          </div>
              </div>
        
   
                 </div>
            
    </asp:Panel>


</asp:Content>
