﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/style.css?ver" />
    <title>Home | OnlineLesson</title>

    <!--<script type="text/javascript" >
          
    function validName()
    {
    var st=document.getElementById("fName").value;
    if (st.length == 0) {
        alert(" לא כתבת שם פרטי ");
        return false;
    }
    var digits=0, chars=0,i;
    for (i = 0; i < st.length; i++)
     {
        if (isNaN(st.charAt(i)))
            chars++;
        else digits++;
    }
    
    if(digits>0) {
        alert("השם הפרטי חייב להכיל רק אותיות");
        return false;
    }
       
       return true;
   }

   function validName2() {
       var st = document.getElementById("lName").value;
       if (st.length == 0) {
           alert(" לא כתבת שם משפחה ");
           return false;
       }
       var digits = 0, chars = 0, i;
       for (i = 0; i < st.length; i++) {
           if (isNaN(st.charAt(i)))
               chars++;
           else digits++;
       }

       if (digits > 0) {
           alert("שם המשפחה חייב להכיל רק אותיות");
           return false;
       }

       return true;
   }
   
   function validTZ() {
   var st=document.getElementById("TZ").value;
    
    var digits=0,chars=0,i;
    for (i = 0; i < st.length; i++)
     {
        if (isNaN(st.charAt(i)))
             chars++;
        else digits++;
    }
     if (digits!=9 || chars!=0) {
        alert("יש להכניס 9 ספרות");
        return false;
    }
       return true;
   }


   function validEmail() {
       var c = 0;
       var st = document.getElementById("email").value;
       var stAlert = "";
       if (st.indexOf("@") < 0)
           stAlert += "חייב שטרודל בדואר האלקטרוני  "
       else {

           if (st.charAt(0) == "@")
               stAlert += "אין שטרודל בתחילת הדאר האלקטרוני  ";
       }
       for (i = 0; i < st.length; i++) {
           if (st.charAt(i) == "@")
               c++;
       }
       if (c > 1)
           stAlert += "  הסימן שטרודל יכול להופיע רק פעם אחת  ";

       if (st.indexOf(".") < 0)
           stAlert += "   בדואר האלקטרוני חייב נקודה ";
       var t;
       t = st.charAt(st.length - 1);
       if (t == ".")
           stAlert += "הנקודה לא יכולה להיות בסוף הדואר האלקטרוני";


       if (stAlert == "")
           return true;
       else {
           alert(stAlert)
           return false;
       }
   }


   function isValid() {
           return (validName() && validName2()&& validTZ()&&validEmail());
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

    
        <div class="Login">
            <div class="loginContainer">
                <h1>הרשם</h1>

                <input runat="server" type="text" id="fName" placeholder="שם פרטי" required="" pattern="[a-zA-Z/א-ת]*" title="only letters" />
                <input runat="server" type="text" id="lName" placeholder="שם משפחה" required="" pattern="[a-zA-Z/א-ת]*" title="only letters" />
                <input runat="server" type="email" id="email" placeholder="אימייל" required="" />
                <input runat="server" type="password" id="password" placeholder="סיסמא" required="" minlength="8"/>
                <div class="radioButtons">
                    <span style="float: right;">מגדר:</span><br />
                    <div class="radio">
                        <input runat="server" type="radio" id="male" name="Gender" value="male" />
                        <label for="male">זכר</label>
                    </div>
                    <div class="radio">
                        <input runat="server" type="radio" id="female" name="Gender" value="female" />
                        <label for="female">נקבה</label>
                    </div>
                </div>
                <div class="rules">
                    <input runat="server" style="margin: 0px;" type="checkbox" id="rulesConfirm" value="Confirm" required />
                    <label for="rulesConfirm"><span style="color: crimson;">*</span> אני מאשר שקראתי את תנאי האתר</label>
                </div>
                <input runat="server" type="submit" id="submit" value="התחבר" onclick="register" />
                <div>
                    יש לך כבר חשבון? <a href="/login">התחבר</a>
                </div>
            </div>
        </div>
    </form>

</body>

</html>