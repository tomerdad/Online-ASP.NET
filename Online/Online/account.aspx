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
    <div>
        <h1>ברוך הבא <%= /*Session["UserFName"]*/ HttpUtility.JavaScriptStringEncode(Session["UserFName"].ToString()) %></h1>

        <form runat="server">
            <asp:TextBox runat="server" id="Oldpassword" placeholder="סיסמא ישנה" />
            <asp:TextBox runat="server" id="Newpassword" placeholder="סיסמא חדשה" />
            <asp:Button runat="server" id="submit" Text="התחבר" OnClick="replace_password" />
        </form>
    </div>
</body>
</html>
