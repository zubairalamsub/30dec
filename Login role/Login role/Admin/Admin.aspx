<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Login_role.clerk" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Admin</title>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
      <script>
            //$(document).ready(function () {
            //    var ulProducts = $('#ulProducts');
            //    $("#btn").click(function () {
            //        $.ajax({
            //            type: 'GET',
            //            url: 'http://api.ajkerdeal.com/AppApi/Brand/Loadbrand',
            //            dataType: 'json',
            //            success: function (data) {
            //                ulProducts.empty();
            //                $.each(data, function (index, val) {
            //                    var product = val.BrandId + ' ' + val.BrandNameEng
            //                    ulProducts.append('<li>' + product + '</li>');
            //                });
            //            }
                      
            //        });
            //    });
            //});
          $.ajax({
              url: "http://api.ajkerdeal.com/AppApi/Brand/Loadbrand",
              type: "get",
              success: function (result) {
                  var $ddlproduct = $("#ddlproduct");
                  $.each(result, function (i, product) {
                      $("<option></option>").val(product.BrandId).text(product.BrandNameEng).appendTo($ddlproduct);
                  });
              }
          })
    
          function myFunction() {
              var value = document.getElementById("<%=ddlUser.ClientID%>");
              var getvalue = value.options[value.selectedIndex].value;
              var gettext = value.options[value.selectedIndex].text;
              var value1 = document.getElementById("<%=ddlproduct.ClientID%>");

              var getpvalue = value1.options[value1.selectedIndex].value
           

              alert(getvalue);
              alert(getpvalue);
             

              

          }

          function SaveUser() {
              var UserId = $("#ddlUser").val();
              var BrandId = $("#ddlproduct").val();
                  var obj = {
                      UserId: UserId,
                      BrandId: BrandId

                  }
                  $.ajax({
                      type: "POST",
                      url: "admin.aspx/saveuser",
                      data: JSON.stringify(obj),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (response) {
                          alert("Product has been added successfully.");
                          window.location.reload();
                      }
                  });
                  
            
          }
          

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <h1><font color="red">Admin Page</font></h1>

         <table align="center" bgcolor="#B7FFC9" cellpadding="4" cellspacing="2" style="border: 1px solid #999999; font-family: Century">
            <tr>
                <td class="auto-style1" colspan="3" style="text-align: center; background-color: #FEEEDE">Assign Product</td>
            </tr>
            <tr>
                <td width="100px">User Name</td>

                <td width="5px" rowspan="8" style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999"></td>

                <td>
                    <asp:DropDownList ID="ddlUser" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Product Name</td>
                <td>
                    <asp:DropDownList ID="ddlproduct" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>

                <td>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" id="btnSave" value="submit" onclick="SaveUser()" />&nbsp;&nbsp;

                </td>
            </tr>
        </table>


    <asp:Label ID="lb1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
