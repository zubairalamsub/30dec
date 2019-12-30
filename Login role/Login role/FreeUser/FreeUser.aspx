<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeUser.aspx.cs" Inherits="Login_role.doctor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>FreeUser</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1><font color="green">FreeUser Page</font></h1>
       
 
      <%--  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="BrandId" HeaderText="BrandId" SortExpression="BrandId" />
            </Columns>
        </asp:GridView>--%>
        <table border="0" cellpadding="5" cellspacing="0">
<tr>
    <td>Customer Id</td>
    <td><asp:TextBox ID = "txtCustomerId" runat = "server" /></td>
</tr>
<tr>
    <td>Name</td>
    <td><asp:TextBox ID = "txtName" runat = "server" /></td>
</tr>

</table>

        



<%--        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select UserName,BrandId from login join  AssignProduct on login.UserId=AssignProduct.UserId where Role='FreeUser'"></asp:SqlDataSource>--%>

        

        <asp:Image ID="Image1" runat="server" />

    <asp:Label ID="lb1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
