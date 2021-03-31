<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CoursePage.aspx.cs" Inherits="CoursePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css?ver=1" />
    <title>Home | OnlineLesson</title></head>
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
                <li style="float: left;"><a href="/account">החשבון שלי</a></li>
                <% } %>

            </ul>
        </nav>
        <div class="Container">
            <h1 runat="server" id="CourseTitle"></h1>
            <h2 runat="server" id="PartTitle"></h2>
            <asp:Literal ID="CourseContent" text="13" runat="server"></asp:Literal>
        </div>
        <% if (PprevPartId != 0) { %>
        <a href="/CoursePage/<%= PCourseId+"/"+PprevPartId %>">החלק הקודם</a>
        <% } %>
        <% if (PnextPartId != 0) { %>
        <a href="/CoursePage/<%= PCourseId+"/"+PnextPartId %>">החלק הבא</a>
        <% } %>
    </form>
</body>
</html>
