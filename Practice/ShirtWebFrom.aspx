<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="ShirtWebFrom.aspx.cs" Inherits="Practice.ShirtWebFrom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:Panel ID="Addpanel"  runat="server">
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
                                     <label for="inputEmail4">Frist Name</label>
                                     
                                 </div>
                                 <div class="form-group col-md-4">
                                     <label for="inputPassword4">Middel Name</label>
                                     <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                 </div>
                                   <div class="form-group col-md-4">
                                      <label for="inputPassword4">Last Name</label>
                                       <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                   </div>
                             </div>
                             <div class="form-group col-md-6">
                                 <label for="inputAddress">Class Room</label>
                                 <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                             </div>
                               <div class="form-group col-md-6">
                                 <label for="inputAddress">Roll No</label>
                                   <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                             </div>
                            
                             <div class="form-row">
                                 <div class="form-group col-md-4">
                                     <label for="inputCity">Country</label>
                                     <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
                                 </div>
                                 <div class="form-group col-md-4">
                                     <label for="inputState">State</label>
                                     <asp:DropDownList ID="DropDownList2" class="form-control" runat="server"></asp:DropDownList>
                                 </div>
                                 <div class="form-group col-md-4">
                                     <label for="inputZip">City</label>
                                     <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                                 </div>
                             </div>
                             <div class="form-group">
                                 <div class="custom-control custom-checkbox">
                                     
                                     <label class="custom-control-label" for="customCheck4">Check this custom checkbox</label>
                                 </div>
                             </div>                                
                             <asp:Button ID="btnSubmit"  class="btn btn-primary" runat="server" Text="Submit" />
                         </form>
                     </div>
                 </div>
             </div>
         </div>
     </div>
  
     </div>
      </div>
     </asp:Panel>
 
</asp:Content>
