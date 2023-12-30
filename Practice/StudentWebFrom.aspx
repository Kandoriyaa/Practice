<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="StudentWebFrom.aspx.cs" Inherits="Practice.StudentWebFrom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Addpanel" Visible="false"  runat="server">
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
                                        <label for="inputEmail4"> Name</label>
                                        <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputPassword4">PhoneNo </label>
                                        <asp:TextBox ID="txtPhoneNo" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                      <div class="form-group col-md-4">
                                         <label for="inputPassword4">EmailId</label>
                                          <asp:TextBox ID="txtEmailId" class="form-control" runat="server"></asp:TextBox>
                                      </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputAddress">Gender</label>
                                    <asp:TextBox ID="txtGender" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                  <div class="form-group col-md-6">
                                    <label for="inputAddress">Address</label>
                                      <asp:TextBox ID="txtAddress" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                  <div class="form-group col-md-6">
                                        <label for="inputAddress">Password</label>
                                          <asp:TextBox ID="txtPassword" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                               
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="inputCity">Country</label>
                                        <asp:DropDownList ID="ddlCountry" class="form-control" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged1" AutoPostBack="true" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputState">State</label>
                                        <asp:DropDownList ID="ddlState" class="form-control" OnSelectedIndexChanged="ddlState_SelectedIndexChanged1" AutoPostBack="true" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputZip">City</label>
                                        <asp:DropDownList ID="ddlCity" class="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="customCheck4">
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

    <asp:Panel ID="Listpanel" Visible="true" runat="server">
        
            <div style="padding:0px 0px 0px 240px;" >
        <div >
           <div class="row">
      
            <div class=" col-md-6x">
                <div class="form-group">
                <label> search</label>
                <asp:TextBox ID="txtsearch" OnTextChanged="txtsearch_TextChanged" class="form-control" runat="server"></asp:TextBox>
                 </div>
                    </div>
                
            <div class=" col-md-6"> 
                <div class="form-group">
                <label>Add </label>
                <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text="Search" />
                <asp:Button ID="btnadd"  OnClick="btnadd_Click" runat="server" Text="Add" />
            </div>
                    </div>
           
             </div>
            
                <div class="row">
                    <div class=" col-md-12">
                        <asp:GridView ID="StudentList"   AutoGenerateColumns="false"  OnSelectedIndexChanged="StudentList_SelectedIndexChanged" OnRowCommand="StudentList_RowCommand"  class="table table-bordered table-hover dataTable dtr-inline" runat="server">
                          <Columns>
                               <asp:TemplateField HeaderText = "Sr No" >
                                   <ItemTemplate>
                                         <asp:Label ID = "Name" runat="server" Text='<%#  Container.DataItemIndex +1%>'></asp:Label>
                                    </ItemTemplate>
                                   </asp:TemplateField>
                              <asp:TemplateField HeaderText="Name">
                                  <ItemTemplate>
                                      <asp:Label ID="FristName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="PhoneNo">
                                  <ItemTemplate>
                                      <asp:Label ID="MiddelName" runat="server" Text='<%# Eval("PhoneNo") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="EmailId">
                                  <ItemTemplate>
                                      <asp:Label ID="LastName" runat="server" Text='<%# Eval("EmailId") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Gender">
                                  <ItemTemplate>
                                      <asp:Label ID="classroom" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                             <asp:TemplateField HeaderText="Address">
                                 <ItemTemplate>
                                     <asp:Label ID="RollNo" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                              <asp:TemplateField HeaderText="CountryId">
                                  <ItemTemplate>
                                      <asp:Label ID="CountryId" runat="server" Text='<%# Eval("CountryId") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="StateId">
                                  <ItemTemplate>
                                      <asp:Label ID="StateId" runat="server" Text='<%# Eval("StateId") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="CityId">
                                  <ItemTemplate>
                                      <asp:Label ID="CityId" runat="server" Text='<%# Eval("CityId") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>

                          </Columns>


                        </asp:GridView>

                    </div>
                    </div>

                </div>
               
            </div>

    </asp:Panel>
</asp:Content>
