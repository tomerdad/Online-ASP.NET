using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("index.aspx");

        DataSet dsUser = new DataSet();
        SqlDb sqlUser = new SqlDb();
        string stUser = "SELECT * FROM Courses WHERE UserOwnerID = (" + Session["UserID"] + ");";
        dsUser = sqlUser.chkData(stUser);

        CoursersList.DataSource = dsUser;
        CoursersList.DataBind();
    }

    protected void replace_password(object sender, EventArgs e)
    {
        // replace password
        SqlDb sqlUser = new SqlDb();
        DataSet dsUser = new DataSet();
        string stUser = "SELECT * FROM Users WHERE UserID=(" + Session["UserID"].ToString() + ") AND password='" + Oldpassword.Text + "';";
        dsUser = sqlUser.chkData(stUser);
        if (dsUser.Tables[0].Rows.Count > 0)
        {
            string stAddUser = "UPDATE Users SET [password]='"+ Newpassword.Text +"' WHERE UserID=(" + Session["UserID"].ToString() + ");";
            sqlUser.udi(stAddUser);

        }
    }
}