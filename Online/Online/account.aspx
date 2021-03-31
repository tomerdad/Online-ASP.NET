<%@ Page Language="C#" AutoEventWireup="true" CodeFile="account.aspx.cs" Inherits="account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css" />
    <title>Home | OnlineLesson</title>
</head>
<body dir="rtl" runat="server">
    <form runat="server" id="pageForm">
        <nav class="ToolBar noselect">
            <ul>
                <li><a href="/index">בית</a></li>
                <li><a href="/Courses">קורסים</a></li>
                <% if (Session["UserID"] == null) { %>
                <li style="float: left;"><a href="/login">התחבר</a></li>
                <li style="float: left;"><a href="/register">הרשם</a></li>
                <% } else { %>
                <li style="float: left;"><a href="/account">החשבון שלי</a></li>
                <% } %>

            </ul>
        </nav>

        <div class="Container">
            <h1>ברוך הבא <%= Session["UserFName"] %></h1>
            <h2>החלפת סיסמה</h2>
            <asp:TextBox runat="server" type="password" required="" id="Oldpassword" placeholder="סיסמה ישנה" />
            <asp:TextBox runat="server" type="password" required="" id="Newpassword" placeholder="סיסמה חדשה" />
            <asp:Button runat="server" id="submit" Text="החלף סיסמה" OnClick="replace_password" />


            <h2>הקורסים שלי</h2>
            <a href="/CreateCourse.aspx">יצירת קורס</a>
            <div style="width: 100%;">
            <asp:GridView ID="CoursersList" AutoGenerateColumns="false" runat="server" class="CoursesList" style="margin: auto;">
                <Columns>
                    <asp:TemplateField HeaderText="תיאור" ItemStyle-Width="70%" ItemStyle-CssClass="CourseListDescription">
                        <ItemTemplate>
                            <img src='<%# "style/images/Courses/"+Eval("CourseID")+".png" %>' width="150px" height="150px" style="float: right; padding-left: 20px;" />
                            <div style="display:flex; flex-direction:column;">
                            <h2><%# Eval("CourseName") %></h2>
                            <p style="padding: 10px; width: 100%;"><%# Eval("Description") %></p>
                            <p>רמה: <%# Eval("Skill") %></p>
                            <p>קטגוריה: <%# Eval("Category") %></p>
                            <asp:HyperLink runat="server" class="CourseLink" href='<%# "/createpart/"+Eval("CourseID") %>' style="left: 110px;">הוספת פרק</asp:HyperLink>
                            <asp:HyperLink runat="server" class="CourseLink" href='<%# "/CoursePage/"+Eval("CourseID") %>'>לדף הקורס</asp:HyperLink>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
            
        </div>
    </form>
</body>
</html>
