<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css" />
    <title>Home | OnlineLesson</title>
</head>
<body dir="rtl">
    <form runat="server" id="header" class="ToolBar noselect">
        <ul>
            <li><a href="/index">בית</a></li>
            <li><a href="/Courses">קורסים</a></li>
            <% if (Session["UserID"] == null) { %>
            <li style="float: left;"><a href="/login">התחבר</a></li>
            <li style="float: left;"><a href="/register">הרשם</a></li>
            <% } else { %>
            <script language="C#" type="text/C#" runat="server">
                protected void logoutClick(object sender, EventArgs e) {
	                Session.RemoveAll();
                }
            </script>

            <li style="float: left;"><a href="/account">החשבון שלי</a></li>
            <li style="float: left;"><asp:LinkButton id="logoutbtn" runat="server" onclick="logoutClick">התנתק</asp:LinkButton></li>
            <% } %>

        </ul>

    </form>
    <div class="indexImage">
        <h1 style="text-align: center;">כל שנה היא התחלה חדשה<br>עם הצלחות חדשות</h1>
    </div>
</body>
</html>
