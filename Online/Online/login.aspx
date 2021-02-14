<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
            <li style="float: left;"><a href="./login.aspx">התחבר</a></li>
            <li style="float: left;"><a href="./register.aspx">הרשם</a></li>
        </ul>
        
    </nav>
    
    <div class="Login">
        <form id="loginForm" runat="server">
            <h1>התחבר</h1>
            <asp:TextBox runat="server" id="email" placeholder="אימייל" />
            <asp:TextBox runat="server" id="password" placeholder="סיסמא" />
            <asp:Button runat="server" id="submit" Text="התחבר" OnClick="btnLogin_Click" />
            <div>
            אין לך חשבון? <a href="./signup.aspx">צור עכשיו בחינם</a>
            </div>
        </form>
    </div>
</body>
</html>
