<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css?ver" />
    <title>Home | OnlineLesson</title>

</head>
<body dir="rtl">
    <form runat="server" id="pageForm">
        <nav class="ToolBar noselect">
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
        </nav>
    
        <div class="Login">
            <div class="loginContainer">
                <h1>התחבר</h1>
                <asp:TextBox runat="server" id="email" placeholder="אימייל" />
                <asp:TextBox runat="server" id="password" TextMode="Password" placeholder="סיסמא" />
                <asp:Button runat="server" id="submit" Text="התחבר" OnClick="btnLogin_Click" />
                <div>
                אין לך חשבון? <a href="/register">צור עכשיו בחינם</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
