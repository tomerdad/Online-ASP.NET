using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
            Response.Redirect("index.aspx");
    }

    protected void register(object sender, EventArgs e)
    {
        // הירשמות משתמש חדש
        SqlDb sqlUser = new SqlDb();
        DataSet dsUser = new DataSet();
        string stUser = "SELECT Users.FirstName FROM Users WHERE email='"+email.Value+"';";
        dsUser = sqlUser.chkData(stUser);
        if (dsUser.Tables[0].Rows.Count <= 0)
        {
            string Gender;
            //if convert to group need to change
            if (male.Checked)
                Gender = "male";
            else if (female.Checked)
                Gender = "female";
            else
                Gender = "other";


            //הכנסת לטבלת משתמשים עם שם משתמש לא תפוס
            //string stAddUser = "insert into tblUsers(fName,lName,address,cityName,gender,phoneNumber,email,user_Name,pass) values ('" + txtFname.Text + "','" + txtLname.Text + "','" + txtAdress.Text + "','" + ddlCity.SelectedItem.Value + "','" + ddlGender.SelectedItem.Value + "','"+txtPhone.Text+"','"+txtMail.Text+"','"+txtUser.Text+"','"+txtPass.Text+"') ";
            //string stAddUser = "INSERT INTO Users (FirstName,LastName,Email,Password,Gender) VALUES ('" + fName.Value + "', 'dadashov', 'tomerdad@gmail.com', '123', 'male' ) ";
            string stAddUser = "INSERT INTO Users(FirstName,LastName,Email,[Password],Gender) VALUES ('" + fName.Value + "', '" + lName.Value + "', '" + email.Value + "', '" + password.Value + "', '" + Gender + "' );";
            sqlUser.udi(stAddUser);

            Response.Redirect("./index.aspx");

        }
    }

}