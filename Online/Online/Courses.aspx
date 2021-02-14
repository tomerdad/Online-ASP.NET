<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css" />
    <title>Home | OnlineLesson</title>
</head>
<body dir="rtl">
    <nav class="ToolBar noselect">
        <ul>
            <li><a href="./index.aspx">בית</a></li>
            <li><a href="./grades.html">ציונים</a></li>
            <% if (Session["UserID"] == null) { %>
            <li style="float: left;"><a href="./login.aspx">התחבר</a></li>
            <li style="float: left;"><a href="./register.aspx">הרשם</a></li>
            <% } else { %>
            <li style="float: left;"><a href="./account.aspx">החשבון שלי</a></li>
            <% } %>

        </ul>

    </nav>



    <form runat="server">
        <asp:GridView ID="CoursersList" AutoGenerateColumns="false" runat="server" width="100%" class="CoursesList">
            <Columns>
                <asp:TemplateField HeaderText="שם הקורס" ItemStyle-Width="30%">
                    <ItemTemplate>
                        <center>
                        <%# Eval("CourseName") %><br />
                        <img src='<%# "style/images/Courses/"+Eval("CourseID")+".png" %>' width="170px" />
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="תיאור" ItemStyle-Width="70%">
                    <ItemTemplate>
                        <p style="padding: 10px;"><%# Eval("Description") %></p>
                        <asp:HyperLink runat="server" style="float:left" href='<%# "?CourseId="+Eval("CourseID") %>'>הרשם עכשיו</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>



</body>
</html>