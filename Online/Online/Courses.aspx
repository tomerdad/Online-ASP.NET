<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css?ver=1" />
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



    <form runat="server" class="Container">
        <!--SideBar-->
        <div class="sidebar">
            <h2>מסנן</h2>
            <h3>רמה</h3>
            <asp:CheckBoxList runat="server">
                 <asp:ListItem>מתחיל</asp:ListItem>
                 <asp:ListItem>מתקדם</asp:ListItem>
                 <asp:ListItem>מומחה</asp:ListItem>
            </asp:CheckBoxList>
            <h3>קטגוריה</h3>
            <asp:CheckBoxList runat="server">
                 <asp:ListItem>אתרים</asp:ListItem>
                 <asp:ListItem>אבטחה</asp:ListItem>
                 <asp:ListItem>תכנות</asp:ListItem>
            </asp:CheckBoxList>
        </div>

        <!--The content-->
        <asp:GridView ID="CoursersList" AutoGenerateColumns="false" runat="server" class="CoursesList">
            <Columns>
                <asp:TemplateField HeaderText="תיאור" ItemStyle-Width="70%" ItemStyle-CssClass="CourseListDescription">
                    <ItemTemplate>
                        <img src='<%# "style/images/Courses/"+Eval("CourseID")+".png" %>' width="150px" style="float: right; padding-left: 20px;" />
                        <h2><%# Eval("CourseName") %></h2>
                        <p style="padding: 10px;"><%# Eval("Description") %></p>
                        <asp:HyperLink runat="server" class="CourseLink" href='<%# "./CoursePage/"+Eval("CourseID") %>'>לדף הקורס</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>



</body>
</html>