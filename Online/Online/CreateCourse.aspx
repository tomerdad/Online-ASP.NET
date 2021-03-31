<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateCourse.aspx.cs" Inherits="CreateCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css?ver=1" />
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

        <div class="Container Column">
            <asp:Label runat="server" ID="CourseNameLbl">שם הקורס</asp:Label>
            <asp:TextBox runat="server" ID="CourseNameTxt" placeholder="שם הקורס" required></asp:TextBox>
            <asp:FileUpload runat="server" ID="imgUpload" accept=".png,.jpg,.jpeg,.gif"/>
            <asp:Label runat="server" ID="DescriptionLbl">תיאור</asp:Label>
            <asp:TextBox runat="server" TextMode="multiline" Columns="50" Rows="5" MaxLength="200" ID="DescriptionTxt" placeholder="תיאור"></asp:TextBox>
            <h3>רמה:</h3>        
            <asp:RadioButtonList runat="server" ID="Skill">
                <asp:ListItem Value="Beginer">מתחיל</asp:ListItem>
                <asp:ListItem Value="Expert">מתקדם</asp:ListItem>
                <asp:ListItem Value="Professional">מומחה</asp:ListItem>
            </asp:RadioButtonList>
            <h3>קטגוריה:</h3>
            <asp:RadioButtonList runat="server" ID="Category">
                <asp:ListItem Value="Websites">אתרים</asp:ListItem>
                <asp:ListItem Value="Securtiy">אבטחה</asp:ListItem>
                <asp:ListItem Value="Development">תכנות</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button runat="server" ID="CreateCourseBtn" OnClick="CreateCourseClick" />
        </div>
    </form>
</body>
</html>
