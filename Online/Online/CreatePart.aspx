<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreatePart.aspx.cs" Inherits="CreatePart" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css?ver=1" />
    <title>Home | OnlineLesson</title>

    <!-- Script Text-html Editor -->
    <!--<script type="text/javascript">


        var ShowSourceCode = false;




        window.onload = function enableEditMode() {
            var htmlEditorObj = document.getElementById("htmlEditor");
            htmlEditor.document.designMode = 'On';
        }

        function UpdateIframe() {
            htmlEditor.document.getElementsByTagName('body')[0].innerHTML = document.getElementById('htmlEditor1').value;
        }

        function UpdateTextBox() {
            document.getElementById('htmlEditor1').value = htmlEditor.document.getElementsByTagName('body')[0].innerHTML;
        }

        function execCmd(command) {
            document.getElementById('htmlEditor').focus();
            document.execCommand(command, false, null);
        }

        function execCommandWithArg(Command, arg) {
            htmlEditor.document.execCommand(Command, false, arg);
        }

        function toggleSource() {
            var htmlEditorObj = document.getElementById("htmlEditor");
            if (ShowSourceCode) {
                htmlEditor.document.getElementsByTagName('body')[0].innerHTML = htmlEditor.document.getElementsByTagName('body')[0].textContent;
                ShowSourceCode = false;
                htmlEditorObj.setAttribute('EditMode','RichText');
            } else {
                htmlEditor.document.getElementsByTagName('body')[0].textContent = htmlEditor.document.getElementsByTagName('body')[0].innerHTML;
                ShowSourceCode = true;
                htmlEditorObj.setAttribute('EditMode', 'html');
            }
        }

        function Post() {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", yourUrl, true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify({
                value: htmlEditor.document.getElementsByTagName('body')[0].innerHTML
            }));
        }
    </script>-->
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
            <asp:Label runat="server" ID="CourseNameLbl" /> 
            <asp:Label runat="server" ID="PartNameLbl">שם הפרק</asp:Label>
            <asp:TextBox runat="server" ID="PartNameTxt" placeholder="שם הפרק" required></asp:TextBox>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
            <!--<ul class="EditorToolBar">
                <li><i onclick="execCmd('bold');" class="fa fa-bold"></i></li>
                <li><i onclick="execCmd('italic');" class="fa fa-italic"></i></li>
                <li><i onclick="execCmd('underline');" class="fa fa-underline"></i></li>
                <li><i onclick="execCmd('strikeThrough');" class="fa fa-strikethrough"></i></li>
                <li><i onclick="execCmd('justifyLeft');" class="fa fa-align-left"></i></li>
                <li><i onclick="execCmd('justifyCenter');" class="fa fa-align-center"></i></li>
                <li><i onclick="execCmd('justifyRight');" class="fa fa-align-right"></i></li>
                <li><i onclick="execCmd('justifyFull');" class="fa fa-align-justify"></i></li>
                <li><i onclick="execCmd('cut');" class="fa fa-cut"></i></li>
                <li><i onclick="execCmd('copy');" class="fa fa-copy"></i></li>
                <li><i onclick="execCmd('paste')" class="fa fa-paste"></i></li>
                <li><i onclick="execCmd('indent');" class="fa fa-indent"></i></li>
                <li><i onclick="execCmd('outdent');" class="fa fa-dedent"></i></li>
                <li><i onclick="execCmd('subscript');" class="fa fa-subscript"></i></li>
                <li><i onclick="execCmd('superscript');" class="fa fa-superscript"></i></li>
                <li><i onclick="execCmd('undo');" class="fa fa-undo"></i></li>
                <li><i onclick="execCmd('redo');" class="fa fa-redo"></i></li>
                <li><i onclick="execCmd('repeat');" class="fa fa-repeat"></i></li>
                <li><i onclick="execCmd('insertUnorderedList');" class="fa fa-list-ul"></i></li>
                <li><i onclick="execCmd('insertOrderedList');" class="fa fa-list-ol"></i></li>
                <li><i onclick="execCmd('insertParagraph');" class="fa fa-paragraph"></i></li>
                <li><select onchange="execCommandWithArg('formatBlock', this.value);">
                    <option value="H1">H1</option>
                    <option value="H2">H2</option>
                    <option value="H3">H3</option>
                    <option value="H4">H4</option>
                    <option value="H5">H5</option>
                    <option value="H6">H6</option>
                </select></li>

                <li></li>


                <li><i onclick="toggleSource();" class="fa fa-code"></i></li>
            </ul>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="updatePanel">
                <ContentTemplate> 
                    <asp:TextBox runat="server" ID="htmlEditor" onkeyup="javascript:UpdateIframe();" TextMode="multiline" Columns="50" Rows="5" contenteditable="true"></asp:TextBox>
                    <iframe name="htmlEditor" id="htmlEditor1" onkeyup="UpdateTextBox();" runat="server" class="htmlEditor"></iframe>


                </ContentTemplate>
            </asp:UpdatePanel>-->

        <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>

        <script>

            window.onload = function enableEditMode() {
                ClassicEditor
                    .create(document.getElementById('Editor'))
                    .catch(error => {
                        console.error(error);
                    });
            }
        </script>

        <asp:TextBox runat="server" ID="Editor" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>

        <asp:Button runat="server" ID="Button1" OnClick="CreatePartClick" CausesValidation="False" AutoPostBack="true"/>

        </div>
    </form>
</body>
</html>
