<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login_role.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login</title>
    <script type="text/javascript" language="javascript">
    function Validate()
    {
    var UName=document.getElementById('TextBox_user_name');
    var Password=document.getElementById('TextBox_password');
    if((UName.value=='') || (Password.value==''))
    {
     alert('UserName or Password should not be blank');
     return false;
    }
    else
    {
      return true;
    }
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="lb1" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label><br />
     <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="True" Width="100px" BackColor="#FFFF66" ForeColor="#FF3300"></asp:Label>
            
        <asp:TextBox ID="TextBox_user_name" runat="server" ForeColor="#993300" Width="100px"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Password" Font-Bold="True" Width="100px" BackColor="#FFFF66" ForeColor="#FF3300"></asp:Label>
            
        <asp:TextBox ID="TextBox_password" runat="server" ForeColor="#CC6600" TextMode="Password" Width="100px"></asp:TextBox><br />
                
        <asp:Button ID="btn_login" runat="server" Text="Login" Font-Bold="True" 
            BackColor="#CCFF99"   OnClientClick="Validate()" onclick="btn_login_Click" 
            /><br />
    </div>
    </form>
</body>
</html>
