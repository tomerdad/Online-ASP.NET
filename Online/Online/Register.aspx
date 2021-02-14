﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

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
        <form id="registerForm" runat="server">
            <h1>הרשם</h1>

            <input runat="server" type="text" id="fName" placeholder="שם פרטי" required />
            <input runat="server" type="text" id="lName" placeholder="שם משפחה" required />
            <input runat="server" type="email" id="email" placeholder="אימייל" required />
            <input runat="server" type="password" id="password" placeholder="סיסמא" required />
            <div class="radioButtons">
                <span style="float: right;">מגדר:</span><br>
                <div class="radio">
                    <input runat="server" type="radio" id="male" name="Gender" value="male" />
                    <label for="male">זכר</label>
                </div>
                <div class="radio">
                    <input runat="server" type="radio" id="female" name="Gender" value="female" />
                    <label for="female">נקבה</label>
                </div>
                <div class="radio">
                <input runat="server" type="radio" id="other" name="Gender" value="other" />
                <label for="other">אחר</label><br />
                </div>
            </div>
            <div class="rules">
                <input runat="server" style="margin: 0px;" type="checkbox" id="rulesConfirm" value="Confirm" required />
                <label for="rulesConfirm"><span style="color: crimson;">*</span> אני מאשר שקראתי את תנאי האתר</label>
            </div>
            <input runat="server" type="submit" id="submit" value="התחבר" onclick="regsiter" />
            <div>
                אין לך חשבון? <a>צור עכשיו בחינם</a>
            </div>
        </form>
    </div>

</body>

</html>