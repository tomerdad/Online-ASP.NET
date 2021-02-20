<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css?ver=1" />
    <title>Home | OnlineLesson</title>

    <!-- Script Check url Filters -->
    <script type="text/javascript">
        /*const queryString = window.location.search;
        console.log(queryString);
        const urlParams = new URLSearchParams(queryString);
        for (var urlParm in urlParams) {

        }

        function FiltersCheckBoxListChange() {
            
        }

        window.handleCSSToggleButtonClick = function (event) {
            var target = event.currentTarget;
            var cssToggleId = target && target.dataset && target.dataset.cssToggleId;
            var input = cssToggleId && document.getElementById(cssToggleId);
            if (input) {
                if (input.dataset.type === 'checkbox') {
                    input.dataset.checked = input.dataset.checked ? '' : 'checked';
                } else {
                    input.dataset.checked = input.dataset.allowToggle && input.dataset.checked ? '' : 'checked';
                    var radios = document.querySelectorAll('[name="' + input.dataset.name + '"]');
                    for (var i = 0; i < radios.length; i++) {
                        if (radios[i] !== input) {
                            //radios[i].dataset.checked = '';
                        }
                    }
                }
            }
        };
        (function () {
            var cssToggleButtons = document.querySelectorAll('[data-css-toggle-id');
            for (var i = 0; i < cssToggleButtons.length; i++) {
                cssToggleButtons[i].addEventListener('click', window.handleCSSToggleButtonClick);
            }
        })();*/

        //get Url parms and select checkboxes on load.
        window.onload = function () {
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            for (parm of urlParams.keys()) {
                values = urlParams.get(parm).split('|')
                for (value of values) {
                    checkBox = document.getElementsByName(parm + "_" + value)[0].querySelectorAll("input");
                    checkBox[0].checked = true;
                }
            }
            
        };
    </script>

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
            <asp:CheckBoxList runat="server" ID="Skill" AutoPostBack="True" OnSelectedIndexChanged="FiltersCheckBoxListChange">
                 <asp:ListItem runat="server" name="Skill_Beginer" Value="Beginer">מתחיל</asp:ListItem>
                 <asp:ListItem runat="server" name="Skill_Expert" Value="Expert">מתקדם</asp:ListItem>
                 <asp:ListItem runat="server" name="Skill_Professional" Value="Professional">מומחה</asp:ListItem>
            </asp:CheckBoxList>
            <h3>קטגוריה</h3>
            <asp:CheckBoxList runat="server" ID="Category" AutoPostBack="true" OnSelectedIndexChanged="FiltersCheckBoxListChange" onchange="FiltersCheckBoxListChange()">
                 <asp:ListItem runat="server" name="Category_Websites" Value="Websites" >אתרים</asp:ListItem>
                 <asp:ListItem runat="server" name="Category_Securtiy" Value="Securtiy">אבטחה</asp:ListItem>
                 <asp:ListItem runat="server" name="Category_Development" Value="Development">תכנות</asp:ListItem>
            </asp:CheckBoxList>
        </div>

        <!--The content-->
        <div style="width: 100%;">
        <asp:GridView ID="CoursersList" AutoGenerateColumns="false" runat="server" class="CoursesList">
            <Columns>
                <asp:TemplateField HeaderText="תיאור" ItemStyle-Width="70%" ItemStyle-CssClass="CourseListDescription">
                    <ItemTemplate>
                        <img src='<%# "style/images/Courses/"+Eval("CourseID")+".png" %>' width="150px" style="float: right; padding-left: 20px;" />
                        <div style="display:flex; flex-direction:column;">
                        <h2><%# Eval("CourseName") %></h2>
                        <p style="padding: 10px; width: 100%;"><%# Eval("Description") %></p>
                        <p>רמה: <%# Eval("Skill") %></p>
                        <p>קטגוריה: <%# Eval("Category") %></p>
                        <asp:HyperLink runat="server" class="CourseLink" href='<%# "./CoursePage/"+Eval("CourseID") %>'>לדף הקורס</asp:HyperLink>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </form>



</body>
</html>