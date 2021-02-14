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
    <nav class="ToolBar noselect">
        <ul>
            <li><a href="./index.aspx">בית</a></li>
            <li><a href="./grades.html">ציונים</a></li>
            <% if (Session["UserID"] == null) { %>
            <li style="float: left;"><a href="./login.aspx">התחבר</a></li>
            <li style="float: left;"><a href="./register.aspx">הרשם</a></li>
            <% } else { %>
            <li style="float: left;"><a href="./account.aspx">החשבון שלי</a></li>
            <!-- to check
            <li style="float: left;"><a href="#" id="logoutbtn" runat="server" onServerClick="logout_click">התנתק</a></li>-->

            <% } %>

        </ul>

    </nav>
    <div class="indexImage">
        <h1 style="text-align: center;">כל שנה היא התחלה חדשה<br>עם הצלחות חדשות</h1>
    </div>
</body>
</html>
